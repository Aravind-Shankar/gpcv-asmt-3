function [ im, imgray ] = read_image( fname, sc )
%READ_IMAGE Summary of this function goes here
%   Detailed explanation goes here
im = imresize(imread(fname), sc);
imgray = rgb2gray(im);
end