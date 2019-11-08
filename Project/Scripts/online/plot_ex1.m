time = 0:0.001:50;
[ybar, Lyapunov] = least_squares(y);
input = u_test(time);
y = out(time,input);
figure('Name','Comparison of y,ybar','NumberTitle','off')
subplot(1,2,1)
plot(time,y,time,ybar)
title('y, ybar comparison')
legend('Output from solving y {out.p}', 'Estimated value, with lsim')
xlabel('time [sec]')
ylabel('Output')
subplot(1,2,2)
plot(time,y-ybar)
title('Error (y - ybar)')
xlabel('time [sec]')
ylabel('Error')
fprintf('Max (absolute) value of error is: %d.\n',max(abs(y-ybar)))
figure('Name','Decrement of Lyapunov','NumberTitle','off')
plot(time,Lyapunov)
title('Decrement of Lyapunov')
xlabel('time [sec]')
ylabel('V')
