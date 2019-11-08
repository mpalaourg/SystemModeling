function output = get_y()
%get_y
%** No Inputs **
%
%return:
%output: The value of y, after solving the differential equation with
%       ode45()
%
%Ode45() will solve the differential equation at the time interval, defined
%by the lower and upper limit of vector time. However, when time pass to
%ode45() as a vector, ode45() evaluates y at its point defined by time.
%yo is the initial state.
%
time = 0:0.1:10; y0 = [0 0];
[~,y] = ode45(@myode,time,y0);

output = y(:,1);
