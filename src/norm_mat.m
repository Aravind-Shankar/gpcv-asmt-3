function [ outmat ] = norm_mat( inmat )
%NORM_MAT Summary of this function goes here
%   Detailed explanation goes here

outmat = reshape_f( normc(reshape(inmat, [9,1])) );

end

