time = 0:0.001:20;
theta_m = 5; 
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

figure('Name','Restrictions','NumberTitle','off')
line([-2 0], [2 2],'Color','red');
text(-1,2.05,'$$ g_3(\hat{\theta_2}) = 0 $$','Interpreter','latex','FontSize',15)
hold on
line([-2 0], [1.1 1.1],'Color','red');
text(-1,1.04,'$$ g_4(\hat{\theta_2}) = 0 $$','Interpreter','latex','FontSize',15)
line([-2 -2], [1.1 2],'Color','red','LineStyle','--');
text(-2.25,1.5,'$$ g_2(\hat{\theta_1}) = 0 $$','Interpreter','latex','FontSize',15)
line([0 0], [1.1 2],'Color','red','LineStyle','--');
text(0.005,1.5,'$$ g_1(\hat{\theta_1}) = 0 $$','Interpreter','latex','FontSize',15)
plot(a_hat,b_hat);
title('Convergence of $$\hat{a}$$, $$\hat{b}$$ and Restrictions rectangle ','Interpreter','Latex')
legend({'$$\hat{b}$$ = 2','$$\hat{b}$$ = 1.1','$$\hat{a}$$ = -2','$$\hat{a}$$ = 0','Convergence path'},'Interpreter','latex')
xlabel('$$\hat{a}$$ Values','Interpreter','Latex');
ylabel('$$\hat{b}$$ Values','Interpreter','Latex');
xlim([-2.5 0.5]);
ylim([0.5 2.5]);
