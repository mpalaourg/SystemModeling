function system = solve_exercise1(t,x)
real_a = -1.2; real_b = 1.55; 
global theta_m; global gamma;

G = [gamma 0; 0 gamma];
dxdt = real_a*x(1) + real_b * V(t);
dphi_dt(1,1) = x(1) - theta_m*x(2);
dphi_dt(2,1) = V(t) - theta_m*x(3);
error = x(1) - x(4)*x(2) - x(5)*x(3);
dthe_dt(1,1) = gamma * error * x(2); %Inside set
dthe_dt(2,1) = gamma * error * x(3); %Inside set
if(round(x(4),5) == theta_m) 
    gradG = [1; 0]; %Only ahat must be corrected
    if (dthe_dt' * gradG >= 0)
        temp = (gradG * gradG') / (gradG' * G * gradG);
        dthe_dt = dthe_dt - G * temp * dthe_dt;
        
    end
elseif (round(x(4),5) == -2 + theta_m) 
    gradG = [-1; 0]; %Only ahat must be corrected
    if (dthe_dt' * gradG >= 0)
        temp = (gradG * gradG') / (gradG' * G * gradG);
        dthe_dt = dthe_dt - G * temp * dthe_dt;
        
    end
elseif (round(x(5),5) == 2) 
    gradG = [0; 1]; %Only bhat must be corrected
    if (dthe_dt' * gradG >= 0)
        temp = (gradG * gradG') / (gradG' * G * gradG);
        dthe_dt = dthe_dt - G * temp * dthe_dt;
        
    end
elseif (round(x(5),5) == 1.1)
    gradG = [0; -1]; %Only bhat must be corrected
    if (dthe_dt' * gradG >= 0)  
        temp = (gradG * gradG') / (gradG' * G * gradG);
        dthe_dt = dthe_dt - G * temp * dthe_dt;
   
    end
end

system = [dxdt; dphi_dt(1); dphi_dt(2); dthe_dt(1); dthe_dt(2)];
