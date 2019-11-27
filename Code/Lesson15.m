# Project a point from 3D to 2D - image plane
# using matrix operation
disp('You cant start a script with a function keyword');
function p_img = project_point(p, f)
  matrix = [f 0 0 0; 
            0 f 0 0; 
            0 0 1 0];
  
  p(end+1) = 1;
  result = matrix * p.';
  p_img = [(result(1)/result(3)) (result(2)/result(3))]
endfunction

p = [200 100 120];
f = 50;
disp(project_point(p, f));
