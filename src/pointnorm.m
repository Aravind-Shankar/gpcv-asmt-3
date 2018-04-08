function [ U2,T ] = pointnorm( U )
%POINTNORM Summary of this function goes here
%   Detailed explanation goes here
u = U';
n = size(u,2);

centroid = mean( u(1:2,:)' )';
u2 = u;
u2(1:2,:) = u(1:2,:) - repmat(centroid,1,n);

scale = sqrt(2) / mean( sqrt(sum(u2(1:2,:).^2)) );
u2(1:2,:) = scale*u2(1:2,:);
U2 = u2';

T = diag([scale scale 1]);
T(1:2,3) = -scale*centroid;

end

