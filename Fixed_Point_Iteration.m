clear;clc

g=input('Enter Function g(x)= ','s');
g=str2func(['@(x)',g]);
 %Asking the user to input initial approximation
x=input('Enter initial approximation of xo=');
tol=input('Input tolerence=');

iter=0;%Initialization
iterlimit = input('Enter maximum number of iterations:  ');
fprintf('iter. \t\t\t x \n');
fprintf('%d \t\t\t %2.9f \n',iter,x);
while iter<=iterlimit
    g_val=g(x);
    iter=iter+1; 
    fprintf('%d \t\t\t %2.9f \n',iter,g_val);
     
     if abs(g_val-x)<tol
        break;
    end
    x=g_val;
end
