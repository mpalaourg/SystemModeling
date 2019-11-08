%filters_different_implementation_plot
%Script ** no inputs **
%The filters of the vector phi, could be modelled at matlab with a variety
%of functions such as ode (ode45(), ode15s() etc) or just simulated the
%-time- response of those filters with lsim.
%This Script, plots the comparison of those 3 methods of implementation of
%the filters, when they were used to estimate VR and VC.
%

time = 0:0.00001:3; input1 = V1(time); input2 = V2(time);
y0 = [0 0];
[~,ybar,y] = least_squares_for_ex2(); 

VR = input1 + input2' - y;
VRbar = input1 + input2' - ybar;
figure('Name','Filters implementation with lsim','NumberTitle','off')
subplot(2,3,1)
plot(time,VR)
title('V_R')
legend('Real value')
subplot(2,3,2)
plot(time,VRbar,'r')
title('Estimated VR')
legend('Estimated value')
subplot(2,3,3)
plot(time,VR-VRbar)
title('Error in the modeling of VR')

subplot(2,3,4)
plot(time,y)
title('V_C')
legend('Real value')
subplot(2,3,5)
plot(time,ybar,'r')
title('Estimated V_C')
legend('Estimated value')
subplot(2,3,6)
plot(time,y-ybar)
title('Error in the modeling of VC')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%55
[~, first] = ode45(@filter1,time,y0);
[~, second] = ode45(@filter2,time,y0);
[~, third] = ode45(@(t,x) filter3(t,x,0),time,y0);
[~, fourth] = ode45(@(t,x) filter3(t,x,1),time,y0);
[~, fifth] = ode45(@(t,x) filter5(t,x,0),time,y0);
[~, sixth] = ode45(@(t,x) filter5(t,x,1),time,y0);
%y = VC;
phi = [first, second, third, fourth, fifth, sixth];
theta = (y * phi ) / (phi' * phi);
ybar = theta * phi';
VR = input1 + input2' - y;
VRbar = input1 + input2' - ybar;
figure('Name','Filters implementation with ode45','NumberTitle','off')
subplot(2,3,1)
plot(time,VR)
title('V_R')
legend('Real value')
subplot(2,3,2)
plot(time,VRbar,'r')
title('Estimated VR')
legend('Estimated value')
subplot(2,3,3)
plot(time,VR-VRbar)
title('Error in the modeling of VR')

subplot(2,3,4)
plot(time,y)
title('V_C')
legend('Real value')
subplot(2,3,5)
plot(time,ybar,'r')
title('Estimated V_C')
ylim([0 2])
legend('Estimated value')
subplot(2,3,6)
plot(time,y-ybar)
title('Error in the modeling of VC')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[~, first] = ode15s(@filter1,time,y0);
[~, second] = ode15s(@filter2,time,y0);
[~, third] = ode15s(@(t,x) filter3(t,x,0),time,y0);
[~, fourth] = ode15s(@(t,x) filter3(t,x,1),time,y0);
[~, fifth] = ode15s(@(t,x) filter5(t,x,0),time,y0);
[~, sixth] = ode15s(@(t,x) filter5(t,x,1),time,y0);
%y = VC;
phi = [first,second, third, fourth, fifth, sixth];
theta = (y * phi ) / (phi' * phi);
ybar = theta * phi';
VR = input1 + input2' - y;
VRbar = input1 + input2' - ybar;
figure('Name','Filters implementation with ode15s','NumberTitle','off')
subplot(2,3,1)
plot(time,VR)
title('V_R')
legend('Real value')
subplot(2,3,2)
plot(time,VRbar,'r')
title('Estimated VR')
legend('Estimated value')
subplot(2,3,3)
plot(time,VR-VRbar)
title('Error in the modeling of VR')

subplot(2,3,4)
plot(time,y)
title('V_C')
legend('Real value')
subplot(2,3,5)
plot(time,ybar,'r')
title('Estimated V_C')
ylim([0 2])
legend('Estimated value')
subplot(2,3,6)
plot(time,y-ybar)
title('Error in the modeling of VC')
