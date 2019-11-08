function [] = plots_for_ex2_parallel(flag)
time = 0:0.001:20;
[x,approx_x,theta,Lyapunov] = parallel(flag);
if flag == 0 % error free
    figure('Name','Compare outputs [Parallel Method] [Noise Free]','NumberTitle','off')
    subplot(2,1,1)
    plot(time,x,time,approx_x);
    title('Comparison between x and $$\hat{x}$$','Interpreter','Latex')
    legend('Real Value','Estimated Value');
    xlabel('Time [sec]');
    subplot(2,1,2)
    plot(time, x - approx_x)
    title('Error of the approximation','Interpreter','Latex');
    xlabel('Time [sec]');

    figure('Name','Convergence of parameters [Parallel Method] [Noise Free]','NumberTitle','off')
    subplot(2,1,1)
    plot(time,theta(:,1))
    title('Convergence of $$\hat{\theta_1}$$','Interpreter','Latex')
    xlabel('Time [sec]');
    subplot(2,1,2)
    plot(time,theta(:,2))
    title('Convergence of $$\hat{\theta_2}$$','Interpreter','Latex')
    xlabel('Time [sec]');
else
    figure('Name','Compare outputs [Parallel Method] [With Noise]','NumberTitle','off')
    subplot(2,1,1)
    plot(time,x,time,approx_x);
    title('Comparison between x and $$\hat{x}$$','Interpreter','Latex')
    legend('Real Value','Estimated Value');
    xlabel('Time [sec]');
    subplot(2,1,2)
    plot(time, x - approx_x)
    title('Error of the approximation','Interpreter','Latex');
    xlabel('Time [sec]');

    figure('Name','Convergence of parameters [Parallel Method] [With Noise]','NumberTitle','off')
    subplot(2,1,1)
    plot(time,theta(:,1))
    title('Convergence of $$\hat{\theta_1}$$','Interpreter','Latex')
    xlabel('Time [sec]');
    subplot(2,1,2)
    plot(time,theta(:,2))
    title('Convergence of $$\hat{\theta_2}$$','Interpreter','Latex')
    xlabel('Time [sec]');
end
figure('Name','Lyapunov descent [Parallel Method]','NumberTitle','off')
plot(time,Lyapunov)
title('Lyapunov','Interpreter','Latex')
xlabel('Time [sec]');
    