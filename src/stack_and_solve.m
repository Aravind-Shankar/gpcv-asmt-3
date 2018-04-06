function [ F1, F2, F3 ] = stack_and_solve( array_x, array_xp )
%STACK_AND_SOLVE Summary of this function goes here
%   Detailed explanation goes here
F1 = 0; F2 = 0; F3 = 0;

n = size(array_x, 1);
A = zeros(n, 9);

for i=1:n
    A(i, :) = constr_corresp(array_x(i,:), array_xp(i,:));
end

if (n == 7)
    [F1,F2,F3] = eqsolve_7pt(A);
else
    if (n == 8)
        F1 = eqsolve_8pt(A);
    end
end

end

