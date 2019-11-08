clear
time = 0:0.001:50;
ybar = cell(1,4); pole = [1 2 5 10];
error = cell(1,4);
input = u(time);
y = out(time,input);
for i = 1:length(pole)
    ybar{i} = least_squares_parametric(y,3,2,0.4,0.001,pole(i));
end
input = u_test(time);
y = out(time,input);
for i = 1:length(pole)
    error{i} = y - ybar{i};
end

figure('Name','Error for different pole','NumberTitle','off')
subplot(2,2,1)
plot(time,error{1})
title('Triple pole @ \lambda = 1')
legend('Error')
xlabel('Time [sec]')
ylabel('Error')

subplot(2,2,2)
plot(time,error{2})
title('Triple pole @ \lambda = 2')
legend('Error')
xlabel('Time [sec]')
ylabel('Error')

subplot(2,2,3)
plot(time,error{3})
title('Triple pole @ \lambda = 5')
legend('Error')
xlabel('Time [sec]')
ylabel('Error')

subplot(2,2,4)
plot(time,error{4})
title('Triple pole @ \lambda = 10')
legend('Error')
xlabel('Time [sec]')
ylabel('Error')