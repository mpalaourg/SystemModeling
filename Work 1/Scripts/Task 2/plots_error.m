%plots_error
%Script ** no inputs **
%Plots the comparison between VR and VRbar and the error of this comparison
%and the same for VC and VCbar, when random errors have been inserted, at
%random points of VC.
%
[~,ybar,y] = least_squares_for_ex2_with_error();
time = 0:0.00001:3; input1 = V1(time); input2 = V2(time);
VR = input1 + input2' - y;
VRbar = input1 + input2' - ybar;
figure('Name','Filters implementation with lsim (Error)','NumberTitle','off')
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
