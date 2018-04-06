function [ F1, F2, F3 ] = eqsolve_7pt( constrs )
%EQSOLVE_7PT Summary of this function goes here
%   Detailed explanation goes here

% xp' * F * x = 0 and det(F) = 0
% unknowns as a column: (F11 F12 F13 ... F33)'

b = null(constrs);

syms lambda;
f = b(:,1)*lambda + b(:,2)*(1-lambda);  % no 2 lambdas return same f upto scale
smat = reshape_f(f);

sol = real(double( vpa(solve(det(smat) == 0, lambda, 'real', true)) ));
if (numel(sol) == 3)
    F1 = norm_mat( double(subs(smat, sol(1))) );
    assert(det(F1) <= eps, strcat('det (', num2str(det(F1)), ') > eps(', num2str(eps), ')'));
    F2 = norm_mat( double(subs(smat, sol(2))) );
    assert(det(F2) <= eps, strcat('det (', num2str(det(F2)), ') > eps(', num2str(eps), ')'));
    F3 = norm_mat( double(subs(smat, sol(3))) );
    assert(det(F3) <= eps, strcat('det (', num2str(det(F3)), ') > eps(', num2str(eps), ')'));
else
    F1 = norm_mat( double(subs(smat, sol(1))) );
    assert(det(F1) <= eps, strcat('det (', num2str(det(F1)), ') > eps(', num2str(eps), ')'));
    F2 = 0; F3 = 0;
end

end

