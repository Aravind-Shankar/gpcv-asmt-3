function [ F1, F2, F3, T, Tp ] = stack_and_solve( array_x, array_xp )
%STACK_AND_SOLVE Summary of this function goes here
%   Detailed explanation goes here
F1 = 0; F2 = 0; F3 = 0;

n = size(array_x, 1);

assert(n >= 7, strcat('Number of correspondences (',num2str(n),') is too low'));

A = zeros(n, 9);
[array_x,T] = pointnorm(array_x);
[array_xp,Tp] = pointnorm(array_xp);

for i=1:n
    A(i, :) = constr_corresp(array_x(i,:), array_xp(i,:));
end

% assert(rank(A) == n || rank(A) == 9, 'Rank of A is insufficient');
if (rank(A) ~= min([n 9]))
    return
end

if (n == 7)
    [F1,F2,F3] = eqsolve_7pt(A);
else
    if (n == 8)
        F1 = eqsolve_8pt(A);
    else
        F1 = eqsolve_full(A);
    end
end

F1 = norm_mat(Tp' * F1 * T);
if F2 ~= 0
    F2 = norm_mat(Tp' * F2 * T);
    F3 = norm_mat(Tp' * F3 * T);
end

end

