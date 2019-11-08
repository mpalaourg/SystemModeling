time = 0:0.001:20;
[x,approx_x,a_hat,b_hat,Lyapunov] = exercise1;
figure('Name','Compare outputs','NumberTitle','off')
subplot(2,1,1)
plot(time,x,time,approx_x);
title('Comparison between x and $$\hat{x}$$','Interpreter','Latex')
legend('Real Value','Estimated Value');
xlabel('Time [sec]');
subplot(2,1,2)
plot(time, x - approx_x)
title('Error of the approximation','Interpreter','Latex');
xlabel('Time [sec]');

figure('Name','Convergence of parameters ','NumberTitle','off')
subplot(2,1,1)
plot(time,a_hat)
title('Convergence of $$\hat{a}$$','Interpreter','Latex')
xlabel('Time [sec]');
subplot(2,1,2)
plot(time,b_hat)
title('Convergence of $$\hat{b}$$','Interpreter','Latex')
xlabel('Time [sec]');

figure('Name','Lyapunov Descent','NumberTitle','off')
plot(time,Lyapunov);
title('Lyapunov','Interpreter','Latex')
xlabel('Time [sec]');
