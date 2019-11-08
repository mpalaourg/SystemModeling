%%% m < n %%%
clear
time = 0:0.001:50;
error = cell(5,5); ybar = cell(5,5);
input = u(time);
y = out(time,input);
for n = 1:5
    for m = 1:n-1
        ybar{n,m} = least_squares_parametric(y,n,m,0.4,0.001,2);
    end
end

input = u_test(time);
y = out(time,input);
for n = 2:5
    for m = 1:n-1
        error{n,m} = y - ybar{n,m};
    end
end
figure('Name','Error for different values of n and m 1/2','NumberTitle','off')
subplot(2,3,1)
plot(time,error{2,1})
title(' n = 2 && m = 1 ' )
legend('Error')
xlabel('Time [sec]')
ylabel('Error')
subplot(2,3,2)
plot(time,error{3,1})
title(' n = 3 && m = 1 ' )
legend('Error')
xlabel('Time [sec]')
ylabel('Error')

subplot(2,3,3)
plot(time,error{3,2})
title(' n = 3 && m = 2 ' )
legend('Error')
xlabel('Time [sec]')
ylabel('Error')

subplot(2,3,4)
plot(time,error{4,1})
title(' n = 4 && m = 1 ' )
legend('Error')
xlabel('Time [sec]')
ylabel('Error')

subplot(2,3,5)
plot(time,error{4,2})
title(' n = 4 && m = 2 ' )
legend('Error')
xlabel('Time [sec]')
ylabel('Error')

subplot(2,3,6)
plot(time,error{4,3})
title(' n = 4 && m = 3 ' )
legend('Error')
xlabel('Time [sec]')
ylabel('Error')

figure('Name','Error for different values of n and m 2/2','NumberTitle','off')

subplot(2,2,1)
plot(time,error{5,1})
title(' n = 5 && m = 1 ' )
legend('Error')
xlabel('Time [sec]')
ylabel('Error')

subplot(2,2,2)
plot(time,error{5,2})
title(' n = 5 && m = 2 ' )
legend('Error')
xlabel('Time [sec]')
ylabel('Error')

subplot(2,2,3)
plot(time,error{5,3})
title(' n = 5 && m = 3 ' )
legend('Error')
xlabel('Time [sec]')
ylabel('Error')

subplot(2,2,4)
plot(time,error{5,4})
title(' n = 5 && m = 4 ' ) 
legend('Error')
xlabel('Time [sec]')
ylabel('Error')
