%plot_ex1
%Script ** no inputs **
%Plots the comparison between y and ybar and the error of this comparison
ybar = least_squares(y);
input = u_test(time);
y = out(time,input);
figure('Name','Comparison of y,ybar','NumberTitle','off')
subplot(1,2,1)
plot(time,y,time,ybar)
title('Output y')
legend('Output from solving y {out.p}', 'Estimated value, with lsim')
xlabel('time [sec]')
ylabel('y(time) [m]')
subplot(1,2,2)
plot(time,y-ybar)
title('Error (y - ybar)')
fprintf('Max absolute error is: %d\n',max(abs(y-ybar)));