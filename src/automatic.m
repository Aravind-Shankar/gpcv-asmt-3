input_script;

pts_for_model = 7;  % change b/w 7 & 8 as necessary
[x,xp] = get_putative_matches(ip, pts_for_model);

init_p = 0.2;
min_correct_chance = 0.999;
tol = eps;
[F,inds,trials,dur] = ransac_best_model(x,xp,pts_for_model,init_p,min_correct_chance,tol);