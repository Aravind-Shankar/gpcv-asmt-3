input_script;

pts_for_model = 7;  % change b/w 7 & 8 as necessary
title_format = 'Img %d - %d pts to match.';

[~,~,x] = read_points(ip.im1, sprintf(title_format, 1, pts_for_model));
[~,~,xp] = read_points(ip.im2, sprintf(title_format, 2, pts_for_model));

[F,~,~] = stack_and_solve(x,xp);
disp(F);