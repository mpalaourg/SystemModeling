function system = solve_appendix(t,x)
global epsilon;
global theta_m;
global gamma;
real_a = -1.2; real_b = 1.55;  
G = [gamma 0; 0 gamma];
global g1 g2 g3 g4;
g1 = @(s) s - theta_m;
g2 = @(s) -s -2 + theta_m;
g3 = @(s) s - 2;
g4 = @(s) -s +1.1;

dxdt = real_a*x(1) + real_b * V(t);
dphi_dt(1,1) = x(1) - theta_m*x(2);
dphi_dt(2,1) = V(t) - theta_m*x(3);
error = x(1) - x(4)*x(2) - x(5)*x(3);
dthe_dt(1,1) = gamma * error * x(2); %Inside set
dthe_dt(2,1) = gamma * error * x(3); %Inside set


if g1(x(4)) > 0 && g1(x(4)) < epsilon 
    gradG = [1; 0]; %Only ahat must be corrected
    c = min(1,g1(x(4))/epsilon);
    if (dthe_dt' * gradG > 0)
        temp = (gradG * gradG') / (gradG' * G * gradG);
        dthe_dt = dthe_dt - c * G * temp * dthe_dt;
        
    end
elseif g2(x(4)) > 0 && g2(x(4)) < epsilon 
    gradG = [-1; 0]; %Only ahat must be corrected
    c = min(1,g2(x(4))/epsilon);
    if (dthe_dt' * gradG > 0)
        temp = (gradG * gradG') / (gradG' * G * gradG);
        dthe_dt = dthe_dt - c * G * temp * dthe_dt;
        
    end
elseif g3(x(5)) > 0 && g3(x(5)) < epsilon 
    gradG = [0; 1]; %Only bhat must be corrected
    c = min(1,g3(x(5))/epsilon);
    if (dthe_dt' * gradG > 0)
        temp = (gradG * gradG') / (gradG' * G * gradG);
        dthe_dt = dthe_dt - c * G * temp * dthe_dt;
        
    end
elseif g4(x(5)) > 0 && g4(x(5)) < epsilon 
    
    gradG = [0; -1]; %Only bhat must be corrected
    c = min(1,g4(x(5))/epsilon);
    if (dthe_dt' * gradG > 0)  
        temp = (gradG * gradG') / (gradG' * G * gradG);
        dthe_dt = dthe_dt - c * G * temp * dthe_dt;
        
    end
end

system = [dxdt; dphi_dt(1); dphi_dt(2); dthe_dt(1); dthe_dt(2)];