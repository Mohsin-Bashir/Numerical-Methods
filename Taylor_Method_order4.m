%Euler's Method
clear;clc
f=input('Enter Function f(t,y)= ','s');
f=str2func(['@(t,y)',f]);
f1=input('Enter Function f''(t,y)= ','s');
f1=str2func(['@(t,y)',f1]);

f2=input('Enter Function f''''(t,y)= ','s');
f2=str2func(['@(t,y)',f2]);

f3=input('Enter Function f''''''(t,y)= ','s');
f3=str2func(['@(t,y)',f3]);

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
y=y+f(t,y)*h+f1(t,y)*(h^2/2)+f2(t,y)*(h^3/6)+f3(t,y)*(h^4/24);
t=t+h;obs=obs+1;

fprintf('%2d \t  %f \t %f\n',obs,t,y);
end