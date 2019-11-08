function system = solve_3(t,x)
real_a11 = -0.25; real_a12 = 3; real_a21 = -5; real_a22 = -1; 
real_b1 = 1; real_b2 = 2.2; gamma1 = 1; gamma2 = 1;

dx1dt = real_a11 * x(1) + real_a12 * x(2) + real_b1 * V(t);
dx2dt = real_a21 * x(1) + real_a22 * x(2) + real_b2 * V(t);
daprox1dt = x(5) * x(3) + x(6) * x(4) + x(9) * V(t) ;
daprox2dt = x(7) * x(3) + x(8) * x(4) + x(10) * V(t) ;
da11dt = gamma1 * x(3) * (x(1) - x(3)); 
da12dt = gamma1 * x(4) * (x(1) - x(3));
da21dt = gamma1 * x(3) * (x(2) - x(4));
da22dt = gamma1 * x(4) * (x(2) - x(4));
db1dt  = gamma2 * V(t) * (x(1) - x(3));
db2dt  = gamma2 * V(t) * (x(2) - x(4));


system = [dx1dt; dx2dt; daprox1dt; daprox2dt; da11dt; da12dt; ...
    da21dt; da22dt; db1dt; db2dt];

