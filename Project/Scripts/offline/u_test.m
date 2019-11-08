function result = u_test(time)
%u
%Inputs:
%time: The vector which contains the time-points of the simulation.
%
%return:
%result: The given function, evaluated at the
%       time-points, specified at vector time
%       


result = cos(time) + 0.3 * sin(5 * time) + 1.4 * sin(2.5 * time); % for n=3 and m=2