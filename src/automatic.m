input_script;

pts_for_model = 8;  % change b/w 7 & 8 as necessary
[x,xp] = get_putative_matches(ip, pts_for_model);

min_correct_chance = 0.999;
tol = 1e-3;
[F,inds,err,trials,dur] = ransac_best_model(x,xp,pts_for_model,min_correct_chance,tol);
disp(F);