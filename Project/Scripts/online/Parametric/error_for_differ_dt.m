clear
ybar = cell(1,2); dt = [0.001 0.0001];
error = cell(1,2);
for i = 1:length(dt)
    time = 0:dt(i):50;
    input = u(time);
    y = out(time,input);
    ybar{i} = least_squares_parametric(y,3,2,0.4,dt(i),2);
end
for i = 1:length(dt)
    time = 0:dt(i):50;
    input = u_test(time);
    y = out(time,input);
    error{i} = y - ybar{i};
    fprintf(' For f = %d Hz, max error is %d .\n', 1/dt(i), max(abs(error{i})))
end
figure('Name','Error for different dt','NumberTitle','off')
subplot(1,2,1)
time = 0:dt(1):50;
plot(time,error{1})
title('Sampling at f = 1kHz')
legend('Error')
xlabel('Time [sec]')
ylabel('Error')

subplot(1,2,2)
time = 0:dt(2):50;
plot(time,error{2})
title('Sampling at f = 10kHz')
legend('Error')
xlabel('Time [sec]')
ylabel('Error')
