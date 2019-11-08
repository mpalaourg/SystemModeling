function result = u(time)
%u
%Inputs:
%time: The vector which contains the time-points of the simulation.
%
%return:
%result: The given function, evaluated at the
%       time-points, specified at vector time
%       

result = sin(time) + 0.1 * cos(2 * time) + 2 * cos(3 * time); % for n=3 and m = 2
