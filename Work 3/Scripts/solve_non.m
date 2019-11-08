function system = solve_non(t,x)
global theta_m;
global gamma;
real_a = -1.2; real_b = 1.55;  

dxdt = real_a*x(1) + real_b * V(t);
dphi_dt(1,1) = x(1) - theta_m*x(2);
dphi_dt(2,1) = V(t) - theta_m*x(3);
error = x(1) - x(4)*x(2) - x(5)*x(3);
dthe_dt(1,1) = gamma * error * x(2); %Inside set
dthe_dt(2,1) = gamma * error * x(3); %Inside set

system = [dxdt; dphi_dt(1); dphi_dt(2); dthe_dt(1); dthe_dt(2)];