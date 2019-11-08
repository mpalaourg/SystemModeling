time = 0:0.001:50;
[x,approx_x,a_hat,b_hat,Lyapunov] = parallel_multi;
figure('Name','Compare outputs','NumberTitle','off')
subplot(2,2,1)
plot(time,x(:,1),time,approx_x(:,1))
title('Comparison between $$x_1$$ and $$\hat{x_1}$$','Interpreter','Latex')
legend('Real Value','Estimated Value');
xlabel('Time [sec]');
subplot(2,2,3)
plot(time, x(:,1) - approx_x(:,1))
title('Error of the approximation ( $$x_1$$ - $$\hat{x_1}$$ )','Interpreter','Latex');
xlabel('Time [sec]');
subplot(2,2,2)
plot(time,x(:,2),time,approx_x(:,2))
title('Comparison between $$ x_2$$ and $$\hat{x_2}$$','Interpreter','Latex')
legend('Real Value','Estimated Value');
xlabel('Time [sec]');
subplot(2,2,4)
plot(time, x(:,2) - approx_x(:,2))
title('Error of the approximation ( $$ x_2$$ - $$\hat{x_2}$$ )','Interpreter','Latex');
xlabel('Time [sec]');

figure('Name','Convergence of parameters ','NumberTitle','off')
subplot(3,2,1)
plot(time,a_hat(:,1))
title('Convergence of $$\hat{a_{11}}$$','Interpreter','Latex')
xlabel('Time [sec]');
subplot(3,2,2)
plot(time,a_hat(:,2))
title('Convergence of $$\hat{a_{12}}$$','Interpreter','Latex')
xlabel('Time [sec]');
subplot(3,2,3)
plot(time,a_hat(:,3))
title('Convergence of $$\hat{a_{21}}$$','Interpreter','Latex')
xlabel('Time [sec]');
subplot(3,2,4)
plot(time,a_hat(:,4))
title('Convergence of $$\hat{a_{22}}$$','Interpreter','Latex')
xlabel('Time [sec]');

subplot(3,2,5)
plot(time,b_hat(:,1))
title('Convergence of $$\hat{b_1}$$','Interpreter','Latex')
xlabel('Time [sec]');
subplot(3,2,6)
plot(time,b_hat(:,2))
title('Convergence of $$\hat{b_2}$$','Interpreter','Latex')
xlabel('Time [sec]');

figure('Name','Lyapunov Descent','NumberTitle','off')
plot(time,Lyapunov);
title('Lyapunov','Interpreter','Latex')
xlabel('Time [sec]');
