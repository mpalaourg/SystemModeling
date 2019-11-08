function [ybar] = least_squares(y)
%least_squares
%Inputs:
%y: a vector, which contains the discrete values of the unknown output.
%rerurn:
%ybar:a vector, which contains the -estimated- discrete values of the output
%
tic
global n m; 
n = 3;    % order of output
m = 2;    % order of input
dt = 0.001;
time = 0:dt:10;
prev = 1; theta_m = 1;
filter_output = {}; filter_input = {}; phi = zeros(length(time),n+m+1);
num = zeros(1,m+1); den = zeros(1,n+1);
for i = 1:n
    L = conv([1 theta_m],prev);
    prev = L;
end

for i = m:-1:0
    prev = 1;
    for j = i:-1:1
        current = conv([1 0], prev);
        prev = current;
    end
    filter_input{m-i+1} = tf(current, L);
end
filter_input{m+1} = tf(1, L);

for i = n-1:-1:0
    prev = 1;
    for j = i:-1:1
        current = conv([1 0],prev);
        prev = current;
    end
    filter_output{n-1-i+1} = tf(current, L);
end
filter_output{n-1+1} = tf(1, L);

for i = 1:n
    phi(:,i) = lsim(-filter_output{i}, y, time);
end
for i = 1:m+1
    phi(:,n+i) = lsim(filter_input{i}, u(time), time);
end

theta =(y' * phi) / ((phi' * phi));
for i = 1:n
    theta(i) = theta(i) + L(i+1);
end
fprintf(' For n = 3 and m = 2, theta is: \n')
disp(theta)
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
toc