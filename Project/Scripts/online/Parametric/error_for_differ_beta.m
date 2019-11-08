clear
time = 0:0.001:50; beta = [1 0.9 0.8 0.7 0.6 0.5 0.4 0.3 0.2 0.1];
error = cell(1,10); ybar = cell(1,10);
input = u(time);
y = out(time,input);
for i = 1:10
    ybar{1,i} = least_squares_parametric(y,3,2,beta(i),0.001,2);
end

input = u_test(time);
y = out(time,input);

for i = 1:10
   error{1,i} = y - ybar{1,i};
end

figure('Name','Error for different values of n beta 1/2','NumberTitle','off')
subplot(2,3,1)
plot(time,error{1,1})
title(' \beta = 1 ' )
legend('Error')
xlabel('Time [sec]')
ylabel('Error')
subplot(2,3,2)
plot(time,error{1,2})
title(' \beta = 0.9 ' )
legend('Error')
xlabel('Time [sec]')
ylabel('Error')

subplot(2,3,3)
plot(time,error{1,3})
title(' \beta = 0.8 ' )
legend('Error')
xlabel('Time [sec]')
ylabel('Error')

subplot(2,3,4)
plot(time,error{1,4})
title(' \beta = 0.7 ' )
legend('Error')
xlabel('Time [sec]')
ylabel('Error')

subplot(2,3,5)
plot(time,error{1,5})
title(' \beta = 0.6 ' )
legend('Error')
xlabel('Time [sec]')
ylabel('Error')

subplot(2,3,6)
plot(time,error{1,6})
title(' \beta = 0.5 ' )
legend('Error')
xlabel('Time [sec]')
ylabel('Error')

figure('Name','Error for different values beta 2/2','NumberTitle','off')

subplot(2,2,1)
plot(time,error{1,7})
title(' \beta = 0.4 ' )
legend('Error')
xlabel('Time [sec]')
ylabel('Error')

subplot(2,2,2)
plot(time,error{1,8})
title(' \beta = 0.3 ' )
legend('Error')
xlabel('Time [sec]')
ylabel('Error')

subplot(2,2,3)
plot(time,error{1,9})
title(' \beta = 0.2 ' )
legend('Error')
xlabel('Time [sec]')
ylabel('Error')

subplot(2,2,4)
plot(time,error{1,10})
title(' \beta = 0.1 ' ) 
legend('Error')
xlabel('Time [sec]')
ylabel('Error')
