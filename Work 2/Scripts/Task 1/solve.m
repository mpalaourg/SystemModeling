function system = solve(t,x,theta_m,gamma)
real_a = 2; real_b = 1; 

dxdt = - real_a*x(1) + real_b * V(t);
dphi_1dt = x(1) - theta_m*x(2);
dphi_2dt = V(t) - theta_m*x(3);
dthe_1dt = gamma * (x(1) - x(4)*x(2) - x(5)*x(3)) * x(2);
dthe_2dt = gamma * (x(1) - x(4)*x(2) - x(5)*x(3)) * x(3);

system = [dxdt; dphi_1dt; dphi_2dt; dthe_1dt; dthe_2dt];
