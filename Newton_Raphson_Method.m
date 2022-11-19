clear;clc

f=input('Enter Function g(x)= ','s');
syms x
f=str2sym(f);
df=diff(f,x);
f=matlabFunction(f);
df=matlabFunction(df);


%Asking the user to input initial approximation
x=input('Enter initial approximation of xo=');
tol=input('Input tolerence=');

iter=0;%Initialization
iterlimit = input('Enter maximum number of iterations:  ');
fprintf('iter. \t\t\t x \n');
fprintf('%d \t\t\t %2.9f \n',iter,x);
while iter<iterlimit
    f_val=x-f(x)/df(x);
    iter=iter+1; 
    fprintf('%d \t\t\t %2.9f \n',iter,f_val);
     
     if abs(f_val-x)<tol
        break;
    end
    x=f_val;
end
