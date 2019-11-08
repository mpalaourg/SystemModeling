function [system] = myode(t,x)
%myode
%Inputs:
%t: the time, which i want the ode45() solve the differential equation
%x: the vector of the state variables
%
%return:
%system: The system, which ode45() will solve.
%
k = 2;
m = 15; 
b = 0.2;
a1 = b/m; a2 = k/m; b0 = 1/m;
system =[x(2); -a1*x(2)-a2*x(1)+b0*u(t)];

