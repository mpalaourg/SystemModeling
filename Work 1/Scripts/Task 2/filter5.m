function [system] = filter5(t,x,flag)
%filter5
%Inputs:
%t: the time, which i want the ode45() solve the differential equation
%x: the vector of the state variables
%flag: If the flag is 0 then the filter is for the first input, otherwise
%the filter is for the second input
%
%return:
%system: The system, which will be the fifth (or sixth) filter of phi vector.
%
if flag == 0
    input = @V1;
else
    input = @V2;
end
one = x(2);
two = -12100*x(1)-220*x(2)+input(t);
system = [one; two];