clear;clc

f=input('Enter Function f(x)= ','s');
f=str2func(['@(x)',f]);
 %Asking the user to input initial approximation
x0=input('Enter 1st approximation of xo=');
x1=input('Enter 2nd approximation of x1=');

tol=input('Input tolerence=');

iter=1;%Initialization
iterlimit = input('Enter maximum number of iterations:  ');
fprintf('iter. \t\t\t x \n');
fprintf('%2d \t\t\t %2.9f \n',0,x0);
fprintf('%2d \t\t\t %2.9f \n',1,x1);
while iter<iterlimit
    %Formula
    x2=(x0*f(x1)-x1*f(x0))/(f(x1)-f(x0));
    
    iter=iter+1; 
    fprintf('%2d \t\t\t %2.9f \n',iter,x2);
     
     if abs(x2-x1)<tol
        break;
     end
    x0=x1;
    x1=x2;
end
