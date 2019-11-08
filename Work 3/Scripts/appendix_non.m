function [x,approx_x,a_hat,b_hat,Lyapunov] = appendix_non()
global epsilon;
global theta_m;
global gamma;
theta_m = 5; epsilon = 0.01;
%a_start = -1.9999 + (-0.0001+1.9999)*rand; 
%b_start = 1.1 + (2-1.1)*rand; 
a_start = -1.95; % For plot_compare
b_start = 1.95;  % For plot_compare
time = 0:0.001:20; x0 =[0; 0; 0; a_start+theta_m; b_start]; gamma = 35;
 x = zeros(length(time),1);
phi = zeros(length(time),2);
a_hat = zeros(length(time),1);
b_hat = zeros(length(time),1);
approx_x = zeros(length(time),1);
Lyapunov = zeros(length(time),1);

options = odeset('RelTol',1e-9);
[~,solved] = ode45(@(t,x) solve_non(t,x),time,x0,options);

x(1:length(solved(:,1))) = solved(:,1);
phi(1:length(solved(:,2)),1) = solved(:,2);
phi(1:length(solved(:,3)),2) = solved(:,3);
a_hat(1:length(solved(:,4))) = solved(:,4);
b_hat(1:length(solved(:,5))) = solved(:,5);
    
theta = [a_hat b_hat];
for count = 1:length(time)
    approx_x(count) = theta(count,1) * phi(count,1) + theta(count,2) * phi(count,2);
end

a_hat = a_hat - theta_m ;
theta_tild = [a_hat+1.2 b_hat-1.55];
for count = 1:length(time)
    Lyapunov(count) = theta_tild(count,1)^2 /2 + theta_tild(count,2)^2 /2; % (2*gamma)  
end
fprintf('                       Without Projection        \n');
fprintf('For a_hat: Maximum value = %f , Mininum value = %f .\n',max(a_hat),min(a_hat));
fprintf('For b_hat: Maximum value = %f , Mininum value = %f .\n',max(b_hat),min(b_hat));
end