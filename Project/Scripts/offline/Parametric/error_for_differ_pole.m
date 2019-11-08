clear
time = 0:0.001:10;
ybar = cell(1,6); pole = [1 10 25 50 100 1000];
error = cell(1,6);
input = u(time);
y = out(time,input);
for i = 1:length(pole)
    ybar{i} = least_squares_parametric(y,3,2,0.001,pole(i));
end
input = u_test(time);
y = out(time,input);
for i = 1:length(pole)
    error{i} = y - ybar{i};
end
figure('Name','Error for different pole','NumberTitle','off')
subplot(2,3,1)
plot(time,error{1})
title('Triple pole @ \lambda = 1')
legend('Error')
xlabel('Time [sec]')
ylabel('Error')

subplot(2,3,2)
plot(time,error{2})
title('Triple pole @ \lambda = 10')
legend('Error')
xlabel('Time [sec]')
ylabel('Error')

subplot(2,3,3)
plot(time,error{3})
title('Triple pole @ \lambda = 25')
legend('Error')
xlabel('Time [sec]')
ylabel('Error')

subplot(2,3,4)
plot(time,error{4})
title('Triple pole @ \lambda = 50')
legend('Error')
xlabel('Time [sec]')
ylabel('Error')

subplot(2,3,5)
plot(time,error{5})
title('Triple pole @ \lambda = 100')
legend('Error')
xlabel('Time [sec]')
ylabel('Error')

subplot(2,3,6)
plot(time,error{6})
title('Triple pole @ \lambda = 1000')
legend('Error')
xlabel('Time [sec]')
ylabel('Error')
