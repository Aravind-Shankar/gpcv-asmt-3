function [ Fbest, indsbest, besterr, trials, dur ] = ransac_best_model(...
    array_x, array_xp, pts_for_model, min_correct_chance, tol )
%RANSAC_BEST_BASIC_MODEL Summary of this function goes here
%   Detailed explanation goes here
tic;
X = [array_x array_xp];

n = size(X, 1);

p = 0;
min_trials = Inf;

trials = 1;
indsbest = []; nbest = -1;
besterr = Inf;

while trials < min_trials
    Xsample = datasample(X, pts_for_model);
    x = Xsample(:,1:3);
    xp = Xsample(:,4:6);
    [F1,F2,F3,~,~] = stack_and_solve(x, xp);
    if F1 == 0  % sample has insuff rank of equation matrix
        trials = trials + 1;
        continue
    end
    
    c = zeros(3,1); % counts
    [i1,c(1),~] = get_inliers(F1, array_x, array_xp, tol);
    if F2 ~= 0
        [i2,c(2),~] = get_inliers(F2, array_x, array_xp, tol);
        [i3,c(3),~] = get_inliers(F3, array_x, array_xp, tol);
    end
    
    [m,mind] = max(c);
    if mind == 1
        inds = i1;
    else
        if mind == 2
            inds = i2;
        else
            inds = i3;
        end
    end
    
    if m > p*n
        x = array_x(inds,:);
        xp = array_xp(inds,:);
        [F1,F2,F3,~,~] = stack_and_solve(x, xp);
        
        [~,~,err] = get_inliers(F1, x, xp, tol);
        if err < besterr
            nbest = m;
            indsbest = inds;
            Fbest = F1;
            besterr = err;
        end
        
        if F2 ~= 0
            [~,~,err] = get_inliers(F2, x, xp, tol);
            if err < besterr
                nbest = m;
                indsbest = inds;
                Fbest = F2;
                besterr = err;
            end
            [~,~,err] = get_inliers(F3, x, xp, tol);
            if err < besterr
                nbest = m;
                indsbest = inds;
                Fbest = F3;
                besterr = err;
            end
        end
        
        pnew = nbest / n;
        if pnew > p
            p = pnew;
            min_trials = ceil( log(1-min_correct_chance) / log(1 - p^pts_for_model) );
        end
    end
    
    trials = trials + 1;
end

% xbest = array_x(inds, :);
% xpbest = array_xp(inds, :);
% [Fbest,~,~,~,~] = stack_and_solve(xbest, xpbest);
dur = toc;
end

