input_script;

pts_for_model = 7;  % change b/w 7 & 8 as necessary
[x,xp] = get_putative_matches(ip, pts_for_model);

min_correct_chance = 0.999;
tol = 1e-3;
[F,inds,trials,dur] = ransac_best_model(x,xp,pts_for_model,min_correct_chance,tol);
% disp(F);
inx = x(inds,:);
inxp = xp(inds,:);

[Fgold,indsgold] = estimateFundamentalMatrix(x(:,1:2),xp(:,1:2),...
    'Method','RANSAC',...
    'NumTrials',trials,...
    'DistanceType','Algebraic',...
    'DistanceThreshold',tol^2,...   % its actually sq dist
    'Confidence',100*min_correct_chance);
[indsgold,~] = find(indsgold == true);
inxgold = x(indsgold,:);
inxpgold = xp(indsgold,:);

figure;

subplot(131);
imshow(ip.im1);
hold on;
plot(inx(:,1), inx(:,2), 'rx');
plot(inxgold(:,1), inxgold(:,2), 'gx');

subplot(132);
imshow(ip.im2);
hold on;
plot(inxp(:,1), inxp(:,2), 'gx');
epiLines = epipolarLine(F,inx(:,1:2));
borderPts = lineToBorderPoints(epiLines,size(ip.im2));
line(borderPts(:,[1,3])',borderPts(:,[2,4])','Color','r');

subplot(133);
imshow(ip.im2);
hold on;
plot(inxpgold(:,1), inxpgold(:,2), 'gx');
epiLinesGold = epipolarLine(Fgold,inxgold(:,1:2));
borderPtsGold = lineToBorderPoints(epiLinesGold,size(ip.im2));
line(borderPtsGold(:,[1,3])',borderPtsGold(:,[2,4])','Color','r');