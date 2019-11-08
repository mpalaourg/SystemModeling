function [x,approx_x,a_hat,b_hat,Lyapunov] = appendix()
global epsilon;
global theta_m;
global gamma;
theta_m = 5; epsilon = 0.01;
%a_start = -1.9999 + (-0.0001+1.9999)*rand; 
%b_start = 1.1 + (2-1.1)*rand; 
a_start = -1.95; % For plot_compare
b_start = 1.95;  % For plot_compare

time = 0:0.001:20; x0 =[0; 0; 0; a_start+theta_m; b_start]; gamma = 35;
base = 1;
x = zeros(length(time),1);
phi = zeros(length(time),2);
a_hat = zeros(length(time),1);
b_hat = zeros(length(time),1);
approx_x = zeros(length(time),1);
Lyapunov = zeros(length(time),1);

while(1)
    options = odeset('Events', @(t,x) events(time,x),'RelTol',1e-9);
    [~,solved,te] = ode45(@(t,x) solve_appendix(t,x),time,x0,options);
    %%% I must save the previous state %%%
    x(base:base-1+length(solved(:,1))) = solved(:,1);
    phi(base:base-1+length(solved(:,2)),1) = solved(:,2);
    phi(base:base-1+length(solved(:,3)),2) = solved(:,3);
    a_hat(base:base-1+length(solved(:,4))) = solved(:,4);
    b_hat(base:base-1+length(solved(:,5))) = solved(:,5);
    
    time = te:0.001:20; %The new time, from te to the end
    x0 = [solved(end,1); solved(end,2); solved(end,3); solved(end,4); solved(end,5)]; %the new x0, is the final value
    size = length(solved(:,1)); base = base + size - 1;
    if (isempty(te))
        break;
    end
end
theta = [a_hat b_hat];
time = 0:0.001:20;
for count = 1:length(time)
    approx_x(count) = theta(count,1) * phi(count,1) + theta(count,2) * phi(count,2);
end

a_hat = a_hat - theta_m ;
theta_tild = [a_hat+1.2 b_hat-1.55];
for count = 1:length(time)
    Lyapunov(count) = theta_tild(count,1)^2 /2 + theta_tild(count,2)^2 /2; % (2*gamma)  
end
fprintf('                       Appendix_E        \n');
fprintf('For a_hat: Maximum value = %f , Mininum value = %f .\n',max(a_hat),min(a_hat));
fprintf('For b_hat: Maximum value = %f , Mininum value = %f .\n',max(b_hat),min(b_hat));
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Event function Decleration %%%
function [check, isterminal, direction] = events(~,x)
global epsilon; 
global g1 g2 g3 g4;
isterminal = 1; % Terminate at a zero of the event
condition_1 = ~(g1(x(4)) >= epsilon);
condition_2 = ~(g2(x(4)) <= epsilon);
condition_3 = ~(g3(x(5)) >= epsilon);
condition_4 = ~(g4(x(5)) <= epsilon);
check = double( condition_1 & condition_2 & condition_3 & condition_4); %If check == 0, event occured
direction = 1; %by default settings
end
