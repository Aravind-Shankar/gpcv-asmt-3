function [ ind, cnt, err ] = get_inliers( F, x, xp, tol )
%COUNT_INLIERS Summary of this function goes here
%   Detailed explanation goes here

all_errs = abs( sum((xp * F) .* x,2) );
[ind,vals] = find(all_errs <= tol);
cnt = sum(vals);
err = sum(all_errs);

end

