function [system] = filter1(t,x)
%filter1
%Inputs:
%t: the time, which i want the ode45() solve the differential equation
%x: the vector of the state variables
%
%return:
%system: The system, which will be the first filter of phi vector.
%
vout = v(t);
one = x(2) - vout(1);
two = -12100*x(1)-220*x(2)+220*vout(1);
system = [one; two];