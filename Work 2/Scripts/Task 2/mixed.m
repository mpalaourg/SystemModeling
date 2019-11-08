function [x,approx_x,theta,Lyapunov] = mixed(flag)
time = 0:0.001:20; x0 = [0; 0; 0; 0];
gamma = 1; theta_m = 1;
[~,mix_solved] = ode45(@(t,x) solve_mixed(t,x,theta_m,flag,gamma),time,x0);
x = mix_solved(:,1);
approx_x = mix_solved(:,2);
theta = [mix_solved(:,3) mix_solved(:,4)];

theta_tild = [theta(:,1)-2 theta(:,2)-1];
error = x - approx_x;
for count = 1:length(time)
    Lyapunov(count) = error(count)^2/2 + theta_tild(count,1)^2 / (2 * gamma) ...
            +theta_tild(count,2)^2 / (2 * gamma);
end