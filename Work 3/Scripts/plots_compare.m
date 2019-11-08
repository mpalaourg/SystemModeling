time = 0:0.001:20;
[x,approx_x,a_hat,b_hat,Lyapunov] = appendix;
[~,~,a_h,b_h] = appendix_non;
[~,~,a_h_ex,b_h_ex] = exercise1;
global epsilon;
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
plot([-2-epsilon -2-epsilon 0+epsilon 0+epsilon -2-epsilon],[1.1-epsilon 2+epsilon 2+epsilon 1.1-epsilon 1.1-epsilon], 'Color', 'magenta')
plot(a_h_ex,b_h_ex,'Color','green')
plot(a_hat,b_hat,'Color','blue');
plot(a_h,b_h,'Color','yellow')
title('Convergence of $$\hat{a}$$, $$\hat{b}$$ and Restrictions rectangle ','Interpreter','Latex')
legend({'$$\hat{b}$$ = 2','$$\hat{b}$$ = 1.1','$$\hat{a}$$ = -2','$$\hat{a}$$ = 0','Epsilon',...
    'Convergence path With Projection','Convergence path With Projection and $$\epsilon$$', ...
    'Convergence path Without Projection'},'Interpreter','latex')
xlabel('$$\hat{a}$$ Values','Interpreter','Latex');
ylabel('$$\hat{b}$$ Values','Interpreter','Latex');
xlim([-2.5 0.5]);
ylim([0.5 2.5]);
