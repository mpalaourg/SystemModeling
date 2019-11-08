function system = solve_parallel(t,x,flag,gamma)
real_a = 2; real_b = 1; gamma1 = gamma; gamma2 = gamma; 

dxdt = - real_a *x(1) + real_b * V(t); 
daproxdt = -x(3)*x(2) + x(4) * V(t);
dthe_1dt = -gamma1 * (x(1) + noise(t,flag)  - x(2)) * x(2);
dthe_2dt = gamma2 * (x(1) + noise(t,flag)  - x(2)) * V(t);

system = [dxdt; daproxdt; dthe_1dt; dthe_2dt];

