function [m,k,b,ybar] = least_squares(y)
%least_squares
%Inputs:
%y: a vector, which contains the discrete values of the unknown output.
%rerurn:
%m: the mass of the object
%k: the constant of the spring
%b: the constant of the damper
%ybar:a vector, which contains the -estimated- discrete values of the output
%
%Choose a -stable- filter 1/L(s), and generate all the transfer functions
%of the filters. Then, i simulated the -time- response of those filters with lsim
%and created the vactor phi.
%Solving the equation of least_squares method, theta=(y' * phi)*inv((phi' * phi))
%and finally, ybar = theta * phi.
%From the values of vector theta, i can solve for m, k, b.
%
L = conv([1 2],[1 1]);
time = 0:0.1:10;
num = [-1 0];
g = tf(num,L);
first = lsim(g,y,time);

num = -1;
g = tf(num,L);
second = lsim(g,y,time);

num = 1;
g = tf(num,L);
third = lsim(g,u(time),time);
phi = [first, second, third];
theta =(y' * phi) / ((phi' * phi));
ybar = theta * phi';
m = 1 / theta(3);
k = (2 + theta(2)) * m;
b = (3 + theta(1)) * m;