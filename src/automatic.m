input_script;

pts_for_model = 7;  % change b/w 7 & 8 as necessary
[x,xp] = get_putative_matches(ip, pts_for_model);

init_p = 0.1;
min_correct_chance = 0.99;
tol = 1e-6;
[F,inds,trials,dur] = ransac_best_model(x,xp,pts_for_model,init_p,min_correct_chance,tol);
disp(F);