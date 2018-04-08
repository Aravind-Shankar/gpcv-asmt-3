function [ x,y,hp ] = read_points( img, title )
%READ_POINTS Summary of this function goes here
%   Detailed explanation goes here
figure('Name',strcat(title, ' Then ENTER.'),'NumberTitle','off');
imshow(img);
[x, y] = getpts;
close;

hp = [x y ones(numel(x),1)];

end

