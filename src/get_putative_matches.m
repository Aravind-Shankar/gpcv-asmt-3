function [ x,xp ] = get_putative_matches( ip, pts_for_model )
%GET_PUTATIVE_MATCHES Summary of this function goes here
%   Detailed explanation goes here

% algo chosen - SURF simply because of max matches obtained
p1 = detectSURFFeatures(ip.im1gray);
p2 = detectSURFFeatures(ip.im2gray);
[f1, vp1] = extractFeatures(ip.im1gray, p1);
[f2, vp2] = extractFeatures(ip.im2gray, p2);

indexPairs = matchFeatures(f1,f2);
mp1 = vp1(indexPairs(:,1),:);
mp2 = vp2(indexPairs(:,2),:);

assert(mp1.Count > pts_for_model, sprintf('too little matches - %d', mp1.Count));
showMatchedFeatures(ip.im1, ip.im2, mp1, mp2);

x = [mp1.Location ones(mp1.Count, 1)];
xp = [mp2.Location ones(mp2.Count, 1)];

end

