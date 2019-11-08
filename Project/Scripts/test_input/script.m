time = 0:0.001:10;
input1 = u1(time); input2 = u2(time); input3 = u3(time); 
input4 = u4(time); input5 = u5(time); 
input6 = u6(time); input7 = u7(time);

y1 = out(time, input1); y2 = out(time, input2); y3 = out(time, input3); 
y4 = out(time, input4); y5 = out(time, input5); 
y6 = out(time, input6); y7 = out(time, input7);

%%%% Individual outputs %%%%
input21 = u1(time); input22 = u22(time);
input31 = u1(time); input32 = u22(time); input33 = u33(time);
input41 = u1(time); input42 = u22(time); input43 = u33(time); input44 = u44(time);
input51 = u1(time); input52 = u22(time); input53 = u33(time); input54 = u44(time); input55 = u55(time);
input61 = u1(time); input62 = u22(time); input63 = u33(time); input64 = u44(time); input65 = u55(time); input66 = u66(time);
input71 = u1(time); input72 = u22(time); input73 = u33(time); input74 = u44(time); input75 = u55(time); input76 = u66(time); input77 = u77(time);

y21 = out(time, input21); y22 = out(time, input22);
y31 = out(time, input31); y32 = out(time, input32); y33 = out(time, input33);
y41 = out(time, input41); y42 = out(time, input42); y43 = out(time, input43); y44 = out(time, input44);
y51 = out(time, input51); y52 = out(time, input52); y53 = out(time, input53); y54 = out(time, input54); y55 = out(time, input55);
y61 = out(time, input61); y62 = out(time, input62); y63 = out(time, input63); y64 = out(time, input64); y65 = out(time, input65); y66 = out(time, input66);
y71 = out(time, input71); y72 = out(time, input72); y73 = out(time, input73); y74 = out(time, input74); y75 = out(time, input75); y76 = out(time, input76); y77 = out(time, input77);
%%%% Plot the error %%%%
%{
figure('Name','Check for linearity','NumberTitle','off')
subplot(2,3,1)
plot(time, y2 - (y21 + y22))
legend('Error')
xlabel('Time [sec]')
subplot(2,3,2)
plot(time, y3 - (y31 + y32 + y33))
legend('Error')
xlabel('Time [sec]')
subplot(2,3,3)
plot(time, y4 - (y41 + y42 + y43 + y44))
legend('Error')
xlabel('Time [sec]')
subplot(2,3,4)
plot(time, y5 - (y51 + y52 + y53 + y54 + y55))
legend('Error')
xlabel('Time [sec]')
subplot(2,3,5)
plot(time, y6 - (y61 + y62 + y63 + y64 + y65 + y66))
legend('Error')
xlabel('Time [sec]')
subplot(2,3,6)
plot(time, y7 - (y71 + y72 + y73 + y74 + y75 + y76 + y77))
legend('Error')
xlabel('Time [sec]')
%}
figure('Name','Check for linearity 1/3','NumberTitle','off')
subplot(2,3,1)
plot(time, y2)
legend('y_2')
xlabel('Time [sec]')
ylabel('Output')
subplot(2,3,2)
plot(time, y21 + y22)
legend('y_{21} + y_{22}')
xlabel('Time [sec]')
ylabel('Output')
subplot(2,3,3)
plot(time, y2 - (y21 + y22))
legend('Error')
xlabel('Time [sec]')
ylabel('Error')

subplot(2,3,4)
plot(time, y3)
legend('y_3')
xlabel('Time [sec]')
ylabel('Output')
subplot(2,3,5)
plot(time, y31 + y32 + y33)
legend('y_{31} + y_{32} + y_{33}')
xlabel('Time [sec]')
ylabel('Output')
subplot(2,3,6)
plot(time, y3 - (y31 + y32 + y33))
legend('Error')
xlabel('Time [sec]')
ylabel('Error')

figure('Name','Check for linearity 2/3','NumberTitle','off')
subplot(2,3,1)
plot(time, y4)
legend('y_4')
xlabel('Time [sec]')
ylabel('Output')
subplot(2,3,2)
plot(time, y41 + y42 + y43 + y44)
legend('y_{41} + y_{42} + y_{43} + y_{44}')
xlabel('Time [sec]')
ylabel('Output')
subplot(2,3,3)
plot(time, y4 - (y41 + y42 + y43 + y44))
legend('Error')
xlabel('Time [sec]')
ylabel('Error')

subplot(2,3,4)
plot(time, y5)
legend('y_5')
xlabel('Time [sec]')
ylabel('Output')
subplot(2,3,5)
plot(time, y51 + y52 + y53 + y54 + y55)
legend('y_{51} + y_{52} + y_{53} + y_{54} + y_{55}')
xlabel('Time [sec]')
ylabel('Output')
subplot(2,3,6)
plot(time, y5 - (y51 + y52 + y53 + y54 + y55))
legend('Error')
xlabel('Time [sec]')
ylabel('Error')

figure('Name','Check for linearity 3/3','NumberTitle','off')
subplot(2,3,1)
plot(time, y6)
legend('y_6')
xlabel('Time [sec]')
ylabel('Output')
subplot(2,3,2)
plot(time, y61 + y62 + y63 + y64 + y65 + y66)
legend('y_{61} + y_{62} + y_{63} + y_{64} + y_{65} + y_{66}')
xlabel('Time [sec]')
ylabel('Output')
subplot(2,3,3)
plot(time, y6 - (y61 + y62 + y63 + y64 + y65 + y66))
legend('Error')
xlabel('Time [sec]')
ylabel('Error')

subplot(2,3,4)
plot(time, y7)
legend('y_7')
xlabel('Time [sec]')
ylabel('Output')
subplot(2,3,5)
plot(time, y71 + y72 + y73 + y74 + y75 + y76 + y77)
legend('y_{71} + y_{72} + y_{73} + y_{74} + y_{75} + y_{76} + y_{77}')
xlabel('Time [sec]')
ylabel('Output')
subplot(2,3,6)
plot(time, y7 - (y71 + y72 + y73 + y74 + y75 + y76 + y77))
legend('Error')
xlabel('Time [sec]')
ylabel('Error')

clear
clc