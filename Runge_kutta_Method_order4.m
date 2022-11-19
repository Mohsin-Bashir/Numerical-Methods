clear;clc
f=input('Enter Function f(t,y)= ','s');
f=str2func(['@(t,y)',f]);

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

    k1=h*f(t,y);
    k2=h*f(t+h/2,y+k1/2);
    k3=h*f(t+h/2,y+k2/2);
    k4=h*f(t+h,y+k3);
    
    y=y+1/6*(k1+2*k2+2*k3+k4);
   
    t=t+h;obs=obs+1;
    K(obs,:)=[k1,k2,k3,k4];
    fprintf('%2d \t  %f \t %f\n',obs,t,y);

end
%To find the Values of K's(k1,k2,k3,k4)
%First row are the values of K's corresponding to w1 and so on
K