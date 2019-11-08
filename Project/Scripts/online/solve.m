function system = solve(t,x,y)
dt = 0.001; 
time = 0:dt:50; 
global n m; 
global A_y B_y C_y D_y; global A_u B_u C_u D_u; 
global P_size theta_size;
P_size = (n + m + 1) * (n + m + 1);
theta_size = (n + m + 1);
total_size = (n + m + 1);
beta = 0.4;
y_now = interp1(time,y,t);
for i = 1:n       %n order output
    dxydt(i) = A_y(i,:) * x(1:n) + B_y(i) * y_now; %each row of A_y for the first n elements of x
end
phiy = C_y * x(1:n) + D_y * y_now;
for i = 1:m+1       %m order input
    dxudt(i) = A_u(i,:) * x(n+1:total_size) + B_u(i) * u(t); %each row of A_u for the elements from n+1 to m+1 of x
end
phiu = C_u * x(n+1:total_size) + D_u * u(t);

phi = [phiy; phiu];
P = reshape(x(total_size+1:total_size+1+P_size-1),total_size,[])';
dP = beta * P - P * (phi * phi') * P ;
dP = reshape(dP,1, []);
theta = x(total_size+1+P_size:total_size+1+P_size+theta_size-1); 
dtheta_dt = P * (y_now - phi' * theta) * phi;
%%%%%% Create the output of odefun  %%%%%
for i = 1:n
    system(i,1) = dxydt(i);
end
for i = 1:m+1
    system(n+i,1) = dxudt(i);
end
for i = 1:P_size
    system(total_size+i,1) = dP(i);
end
for i = 1:theta_size
    system(total_size+P_size+i,1) = dtheta_dt(i);
end
