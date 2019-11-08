function [x,approx_x,a_hat,b_hat,Lyapunov] = exercise1()
theta_m = 0.5; 
time = 0:0.001:20; x0 =[0; 0; 0; 0; 0]; gamma = 35;
approx_x = zeros(length(time),1);
[~,solved] = ode45(@(t,x) solve(t,x,theta_m,gamma),time,x0);
theta = [solved(:,4) solved(:,5)];
phi = [solved(:,2) solved(:,3)];
for count = 1:length(time)
    approx_x(count) = theta(count,1) * phi(count,1) + theta(count,2) * phi(count,2);
end

x = solved(:,1);
a_hat = theta_m - solved(:,4);
b_hat = solved(:,5);
theta_tild = [a_hat-2 b_hat-1];
for count = 1:length(time)
    Lyapunov(count) = theta_tild(count,1)^2 /2 + theta_tild(count,2)^2 /2; 
end
