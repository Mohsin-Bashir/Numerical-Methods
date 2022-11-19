%Euler's Method
clear;clc
f=input('Enter Function f(t,y,z)= ','s');
f=str2func(['@(t,y,z)',f]);
g=input('Enter Function g(t,y,z)= ','s');
g=str2func(['@(t,y,z)',g]);

end_points=input('Input the end points of ''t'' as [a,b]= ');
to=end_points(1);tn=end_points(2);
fprintf('Input the value of y(%f)=',to);
y=input(' ');
fprintf('Input the value of z(%f)=',to);
z=input(' ');
h=input('Input the value of h= ');

fprintf('Number of steps n=%d \n',(tn-to)/h)
obs=0;
fprintf('\nobs. \t  t \t y(Euler) \t z(Euler) \n');
fprintf('%2d \t  %f \t %2.8f \t %2.8f\n',obs,to,y,z);
y_matrix(1,1)=y;
z_matrix(1,1)=z;
for t=to:h:tn-h
    
    y=y+f(t,y,z)*h;
    z=z+g(t,y_matrix(obs+1),z)*h;
    
    
    t=t+h;obs=obs+1;
     y_matrix(obs+1,1)=y;z_matrix(obs+1,1)=z;
    fprintf('%2d \t  %f \t %2.8f \t %2.8f\n',obs,t,y,z);
end


disp('Wanna compare result to actual values?')
ask=input('Reply yes or no..... ','s');

if strcmpi(ask,'yes')

fa=input('Enter Actual Function y(t)= ','s');
fa=str2func(['@(t)',fa]);

obs=0;
fprintf('\nobs. \t  t \t y(Actual) \n');

for t=to:h:tn
    ya=fa(t);
    fprintf('%2d \t  %f \t %2.8f\n',obs,t,ya);
    
    obs=obs+1;
ya_matrix(obs,1)=ya;
end

Error=abs(y_matrix-ya_matrix);
fprintf('\nobs. \t Error \n');
fprintf('%2.0f \t   %2.8f\n',[0:obs-1;Error'])

elseif strcmpi(ask,'no')
    disp('Best of luck then........')
else
    disp('The keyword you entered is not correct.Run program again...')
end

