function [ybar] = least_squares_parametric(y,n,m,b,dt,theta_m)
%least_squares
%Inputs:
%y: a vector, which contains the discrete values of the unknown output.
%n: order of output
%m: order of input
%b: Rate of memory loss
%dt: the step for the time interval. 1/dt = sampling frequency.
%theta_m: the pole, for the stable filter (s + theta_m)^n
%rerurn:
%ybar:a vector, which contains the -estimated- discrete values of the output
%
global A_y B_y C_y D_y; global A_u B_u C_u D_u; 
global P_size;
Q0 = eye (n+m+1);
P0 = inv (Q0);
time = 0:dt:50;
prev = 1;
filter_output = {}; filter_input = {};
num = zeros(1,m+1); den = zeros(1,n+1); theta_0 = zeros(1, n+m+1);
total_size = n+m+1;
%%%% Compute the stable filter L %%%%
for i = 1:n
    L = conv([1 theta_m],prev);
    prev = L;
end
%%%% Compute the initial state of x0 %%%%
for i = 1:n+m+1
    x0(i) = 0;
end
temp = reshape(P0, 1, []);
x0 = [x0 temp];
x0 = [x0 theta_0];
%{
%%%% Compose the filters of input and output %%%%
for i = m:-1:0
    prev = 1;
    for j = i:-1:1
        current = conv([1 0], prev);
        prev = current;
    end
    filter_input{m-i+1} = tf(current, 1); % /L
end
filter_input{m+1} = tf(1, 1);  % /L

for i = n-1:-1:0
    prev = 1;
    for j = i:-1:1
        current = conv([1 0],prev);
        prev = current;
    end
    filter_output{n-1-i+1} = tf(current, 1); % /L
end
filter_output{n-1+1} = tf(1, 1);   % /L
%}
%%%% Get the filters in a form manageable by ode %%%%
H_1 = zeros(n);
for i = 1:n
    for j = 1:n
        if (i == j)
              H_1(i,j) = -1;
        end
    end
end
[A_y, B_y, C_y, D_y] = tf2ss(H_1,L);

H_2 = zeros(m+1);
for c_i = 1:m+1
    for c_j = 1:m+1
        if (c_i == c_j)
            H_2(c_i,c_j) = 1;
        end
    end
end
[A_u, B_u, C_u, D_u] = tf2ss(H_2,L);
A_u = A_u(1:m+1,1:m+1);
C_u = C_u(1:m+1,1:m+1);
%%%% Solve the system and get ...
[~,solved] = ode45(@(t,x) solve(t,x,y,n,m,b,dt),time,x0);

%%%% Processing data %%%%
theta = solved(end,n+m+1+P_size+1:end);
for i = 1:n
    theta(i) = theta(i) + L(i+1);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ybar %%%%%%%%%%%%%%%%%%%%%%
for i = 1:m+1
    num(i) = theta(n+i);
end
den(1) = 1;
for i = 1:n
    den(i+1) = theta(i);
end
g_transfer = tf(num,den);
ybar = lsim(g_transfer,u_test(time),time);