function result = u_test(time)
%u
%Inputs:
%time: The vector which contains the time-points of the simulation.
%
%return:
%result: The given function, evaluated at the
%       time-points, specified at vector time
%       

result = 4 * sin(8.3 * time) + 2.5 * cos(time) + 1.4 * sin(2.5 * time) + cos(7 * time);