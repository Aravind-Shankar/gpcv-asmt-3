function [ ind, cnt ] = get_inliers( F, x, xp, tol )
%COUNT_INLIERS Summary of this function goes here
%   Detailed explanation goes here

[ind,vals] = find(diag(xp * F * x') <= tol);
cnt = sum(vals);

end

