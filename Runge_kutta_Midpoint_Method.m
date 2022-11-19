clear;clc
f=input('Enter Function f(t,y)= ','s');
f=str2func(['@(t,y)',f]);

end_points=input('Input the end points of ''t'' as [a,b]= ');
to=end_points(1);tn=end_points(2);

fprintf('Input the value of y(%f)=',to);
ya=input(' ');
h=input('Input the value of h= ');
fprintf('Number of steps n=%d \n',(tn-to)/h)

%For Runge Kutta Midpoint Method
y=ya;obs=0;
for t=to:h:tn-h
    y=y+h*f(t+h/2, y+(h/2)*f(t,y));
    obs=obs+1;
    a(obs,1)=t+h; a(obs,2)=y;
end


%Now for Runge Kutta Modified Euler Method

y=ya; obs=0;
for t=to:h:tn-h
    y=y+(h/2)*(f(t,y)+f(t+h,y+h*f(t,y)));
    obs=obs+1;
    a(obs,3)=y;
end


%Now for Runge Kutta Heun's Method
 
 y=ya;obs=0;
for t=to:h:tn-h
    y=y+(h/4)*(f(t,y)+3*f(t+2*h/3,y+2*h/3*f(t,y)));
    obs=obs+1;
    a(obs,4)=y;
end
y=ya;
fprintf(' obs. \t ti \t Midpoint Method  Modified Euler   Heun''s Method \n')
fprintf(' \t                           \t  \t Method \n')
fprintf('%3d  \t%2.2f \t\t%2.8f \t\t%2.8f \t\t%2.8f\n',[0;to;y;y;y])
fprintf('%3d  \t%2.2f \t\t%2.8f \t\t%2.8f \t\t%2.8f\n',[1:obs;a(:,1)';a(:,2)';a(:,3)';a(:,4)'])