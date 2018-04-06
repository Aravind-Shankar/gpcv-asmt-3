function [ constr ] = constr_corresp( x, xp )
%CONSTR_CORRESP Summary of this function goes here
%   Detailed explanation goes here

% xp' * F * x = 0
% unknowns as a column: (F11 F12 F13 ... F33)'

constr = [ xp(1)*x(1) xp(1)*x(2) xp(1)*x(3) xp(2)*x(1) xp(2)*x(2) xp(2)*x(3) xp(3)*x(1) xp(3)*x(2) xp(3)*x(3) ];

end

