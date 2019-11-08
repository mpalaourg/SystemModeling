function [ybar] = least_squares_parametric(y,n,m,dt,theta_m)
%least_squares
%Inputs:
%y: a vector, which contains the discrete values of the unknown output.
%n: order of output
%m: order of input
%dt: the step for the time interval. 1/dt = sampling frequency.
%theta_m: the pole, for the stable filter (s + theta_m)^n
%rerurn:
%ybar:a vector, which contains the -estimated- discrete values of the output
%
time = 0:dt:10;
prev = 1;
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