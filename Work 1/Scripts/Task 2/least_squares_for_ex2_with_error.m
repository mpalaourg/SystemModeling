function [theta,ybar,y] = least_squares_for_ex2_with_error()
%least_squares_for_ex2
%Inputs: ** NONE **
%The necessary values of the output, will be supplied by the v.p file.
%rerurn:
%theta: the vector of the unknown parameters, which minimize the criteriom
%of least squares method
%ybar: the approximation of VC
%y:the real value of VC
%
%At first, at 3 random points of VC and VR insert 3 random values from 100
%to 1000, so we can check the method when some errors have benn occured.
%The, the procedure its the same. Choose a -stable- filter 1/L(s), and generate all the transfer functions
%of the filters. Then, i simulated the -time- response of those filters with lsim
%and created the vactor phi.
%Solving the equation of least_squares method, theta=(y' * phi)*inv((phi' * phi))
%and finally, ybar = theta * phi.
%From the values of vector theta, i can solve for RC and LC
%
t = 0;
time = 0:0.00001:3;
for count=1:length(time)
    temp = v(t);
    VC(count) = temp(1);
    VR(count) = temp(2);
    t = t + 0.00001;
end

VC(randi([1 length(time)])) = 100 + (1000-100)*rand();
VC(randi([1 length(time)])) = 100 + (1000-100)*rand();
VC(randi([1 length(time)])) = 100 + (1000-100)*rand();

VR(randi([1 length(time)])) = 100 + (1000-100)*rand();
VR(randi([1 length(time)])) = 100 + (1000-100)*rand();
VR(randi([1 length(time)])) = 100 + (1000-100)*rand();

y1 = VC;
L = conv([1 1],[1 2]);
num = [-1 0];
g = tf(num,L);
first = lsim(g,y1,time);

num = -1;
g = tf(num,L);
second = lsim(g,y1,time);

num = [1 0];
g = tf(num,L);
third = lsim(g,V1(time),time);

num = [1 0];
g = tf(num,L);
fourth = lsim(g,V2(time),time);

num = 1;
g = tf(num,L);
fifth = lsim(g,V1(time),time);

num = 1;
g = tf(num,L);
sixth = lsim(g,V2(time),time);

y = y1;
phi = [first,second, third, fourth, fifth, sixth];

theta = (y * phi) / (phi' * phi); % for b*inv(A), try b/A
ybar = theta * phi';
