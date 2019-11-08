function [system] = filter2(t,x)
%filter2
%Inputs:
%t: the time, which i want the ode45() solve the differential equation
%x: the vector of the state variables
%
%return:
%system: The system, which will be the second filter of phi vector.
%
vout = v(t);
one = x(2);
two = -12100*x(1)-220*x(2)-vout(1);
system = [one; two];