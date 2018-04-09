input_script;

pts_for_model = 7;  % change b/w 7 & 8 as necessary
[x,xp] = get_putative_matches(ip, pts_for_model);

min_correct_chance = 0.999;
tol = 1e-2;
[F,inds,err,trials,dur] = ransac_best_model(x,xp,pts_for_model,min_correct_chance,tol);
% disp(F);

Fgold = estimateFundamentalMatrix(x(:,1:2),xp(:,1:2),...
    'Method','RANSAC',...
    'NumTrials',trials,...
    'DistanceThreshold',tol,...
    'Confidence',100*min_correct_chance);