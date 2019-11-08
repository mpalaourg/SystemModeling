function [x,approx_x,a_hat,b_hat,Lyapunov] = parallel_multi()
time = 0:0.001:50; x0 = zeros(1,10);
[~,par_multi_solved] = ode45(@solve_3,time,x0);
x = [par_multi_solved(:,1) par_multi_solved(:,2)];
approx_x = [par_multi_solved(:,3) par_multi_solved(:,4)];
a_hat = [par_multi_solved(:,5) par_multi_solved(:,6) par_multi_solved(:,7) par_multi_solved(:,8)];
b_hat = [par_multi_solved(:,9) par_multi_solved(:,10)];

A_tild = [a_hat(:,1)+0.25 a_hat(:,2)-3 a_hat(:,3)+5 a_hat(:,4)+1];
B_tild = [b_hat(:,1)-1 b_hat(:,2)-2.2];
error = x - approx_x;
for count = 1:length(time)
    Lyapunov(count) = (error(count,:) * error(count,:)')/2 + trace(A_tild(count,:)' * A_tild(count,:))/ 2 ...
            +trace(B_tild(count,:)' * B_tild(count,:))/ 2;
end