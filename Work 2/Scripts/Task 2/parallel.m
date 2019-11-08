function [x,approx_x,theta,Lyapunov] = parallel(flag)
time = 0:0.001:20; x0 = [0; 0; 0; 0];
gamma1 = 1; gamma2 = 1;
[~,par_solved] = ode45(@(t,x) solve_parallel(t,x,flag,gamma1),time,x0);
x = par_solved(:,1);
approx_x = par_solved(:,2);
theta = [par_solved(:,3) par_solved(:,4)];

theta_tild = [theta(:,1)-2 theta(:,2)-1];
error = x - approx_x;
for count = 1:length(time)
    Lyapunov(count) = error(count)^2/2 + theta_tild(count,1)^2 / (2 * gamma1) ...
            +theta_tild(count,2)^2 / (2 * gamma2);
end