%Euler's Method
clear;clc
f=input('Enter Function f(t,y)= ','s');
f=str2func(['@(t,y)',f]);
f1=input('Enter Function f''(t,y)= ','s');
f1=str2func(['@(t,y)',f1]);

end_points=input('Input the end points of ''t'' as [a,b]= ');
to=end_points(1);tn=end_points(2);
fprintf('Input the value of y(%f)=',to);
y=input(' ');
h=input('Input the value of h= ');

fprintf('Number of steps n=%d \n',(tn-to)/h)
obs=0;
fprintf('obs. \t  t \t y(Euler) \n');
fprintf('%2d \t  %f \t %f\n',obs,to,y);

for t=to:h:tn-h
y=y+f(t,y)*h+f1(t,y)*(h^2/2);
t=t+h;obs=obs+1;

fprintf('%2d \t  %.3f \t %.8f\n',obs,t,y);
end