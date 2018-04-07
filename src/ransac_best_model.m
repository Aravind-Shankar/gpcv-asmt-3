function [ Fbest, inds, trials, dur ] = ransac_best_model( array_x, array_xp,...
    pts_for_model, init_p, min_correct_chance, tol )
%RANSAC_BEST_BASIC_MODEL Summary of this function goes here
%   Detailed explanation goes here
tic;
X = [array_x array_xp];
n = size(X, 1);

p = init_p;
min_trials = ceil( log(1-min_correct_chance) / log(1 - p^4) );

trials = 1;

while trials < min_trials
    Xsample = datasample(X, pts_for_model);
    x = Xsample(:,1:3);
    xp = Xsample(:,4:6);
    [F1,F2,F3] = stack_and_solve(x, xp);
    
    [inds,nmax] = get_inliers(F1, array_x, array_xp, tol);
    if F2 ~= 0
        [i2,n2] = get_inliers(F2, array_x, array_xp, tol);
        if n2 > nmax
            inds = i2;
            nmax = n2;
        end
        [i3,n3] = get_inliers(F3, array_x, array_xp, tol);
        if n3 > nmax
            inds = i3;
            nmax = n3;
        end
    end
    
    p = nmax / n;
    trials = trials + 1;
    min_trials = ceil( log(1-min_correct_chance) / log(1 - p^4) );
end

xbest = array_x(inds, :);
xpbest = array_xp(inds, :);
[Fbest,~,~] = stack_and_solve(xbest, xpbest);
dur = toc;
end

