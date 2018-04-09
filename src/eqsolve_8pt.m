function [ F ] = eqsolve_8pt( constrs )
%EQSOLVE_8PT Summary of this function goes here
%   Detailed explanation goes here

% xp' * F * x = 0
% unknowns as a column: (F11 F12 F13 ... F33)'

f = null(constrs);
F = reshape_f(f);

% rank 2 setting
[U,S,V] = svd(F);
S(3,3) = 0;
F = U*S*V';

end

