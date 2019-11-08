function result = u7(time)
%u
%Inputs:
%time: The vector which contains the time-points of the simulation.
%
%return:
%result: The given function *here 5sin(t)+10.5* evaluates at the
%       time-points, specified at vector time
%       

result = 4 * sin(8.3 * time) + 2.5 * cos(time) + 1.1 * cos(1.5 * time) + 5 * sin(6 * time) + 3 * sin(5.1 * time) + 6 * cos(4.3 * time) + 3.14 * cos(7.1 * time);