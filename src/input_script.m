ip.rootpath = '../given-images/DSC_076';

ip.fname1 = strcat(ip.rootpath,'5.JPG');
ip.fname2 = strcat(ip.rootpath,'6.JPG');
% fname1 = strcat(rootpath,'7.JPG');
% fname2 = strcat(rootpath,'8.JPG');

ip.sc = 0.2;
[ip.im1, ip.im1gray] = read_image(ip.fname1, ip.sc);
[ip.im2, ip.im2gray] = read_image(ip.fname2, ip.sc);