clear
ybar = cell(1,4); dt = [0.001 0.0001 0.00001 0.000001];
error = cell(1,4);
for i = 1:length(dt)
    time = 0:dt(i):10;
    input = u(time);
    y = out(time,input);
    ybar{i} = least_squares_parametric(y,3,2,dt(i),1);
end

for i = 1:length(dt)
    time = 0:dt(i):10;
    input = u_test(time);
    y = out(time,input);
    error{i} = y - ybar{i};
    fprintf(' For f = %d Hz, max error is %d .\n', 1/dt(i), max(abs(error{i})))
end
figure('Name','Error for different dt','NumberTitle','off')
subplot(2,2,1)
time = 0:dt(1):10;
plot(time,error{1})
title('Sampling at f = 1kHz')
legend('Error')
xlabel('Time [sec]')
ylabel('Error')

subplot(2,2,2)
time = 0:dt(2):10;
plot(time,error{2})
title('Sampling at f = 10kHz')
legend('Error')
xlabel('Time [sec]')
ylabel('Error')

subplot(2,2,3)
time = 0:dt(3):10;
plot(time,error{3})
title('Sampling at f = 100kHz')
legend('Error')
xlabel('Time [sec]')
ylabel('Error')

subplot(2,2,4)
time = 0:dt(4):10;
plot(time,error{4})
title('Sampling at f = 1MHz')
legend('Error')
xlabel('Time [sec]')
ylabel('Error')
