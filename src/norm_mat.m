function [ outmat ] = norm_mat( inmat )
%NORM_MAT Summary of this function goes here
%   Detailed explanation goes here

outmat = inmat / norm(inmat,'fro');
if outmat(end) < 0
    outmat = -outmat;
end

end

