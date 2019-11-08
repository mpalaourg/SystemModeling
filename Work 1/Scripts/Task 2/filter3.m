function [system] = filter3(t,x,flag)
%filter3
%Inputs:
%t: the time, which i want the ode45() solve the differential equation
%x: the vector of the state variables
%flag: If the flag is 0 then the filter is for the first input, otherwise
%the filter is for the second input
%
%return:
%system: The system, which will be the third (or fourth) filter of phi vector.
%
if flag == 0
    input = @V1;
else
    input = @V2;
end
one = x(2) + input(t);
two = -12100*x(1)-220*x(2)-220*input(t);
system = [one; two];