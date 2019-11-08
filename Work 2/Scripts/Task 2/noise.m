function result = noise(t,flag)
%noise
%Inputs:
%t: the time, which i want to calculate the noise
%flag: Determine, if i have a noise free  (flag =0) or not (flag = 1)
%      calculation
%Output:
%result: Either 0, for every t (At noise free calculation)
%        or the given function *here 0.155sin(2* pi* 20* t) evaluated at the
%        time t.
if flag == 0
    result = 0 * t; %error free
else
    result = 0.15 * sin(2*pi*20*t);
end