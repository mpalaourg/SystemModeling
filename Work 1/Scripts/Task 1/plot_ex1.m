%plot_ex1
%Script ** no inputs **
%Plots the comparison between y and ybar and the error of this comparison

y = get_y();
[~,~,~,ybar] = least_squares(y);
time = 0:0.1:10;

figure('Name','Comparison of y,ybar [Exercise 1]','NumberTitle','off')
subplot(1,2,1)
plot(time,y,time,ybar)
title('Output y')
legend('Output from solving y, with ode45', 'Estimated value, with lsim')
xlabel('time [sec]')
ylabel('y(time) [m]')
subplot(1,2,2)
plot(time,y-ybar')
title('Error (y - ybar)')