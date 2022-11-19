clear;clc

%Here we supposed that y_prime is 'z'.
g=input('Enter Function f(x,y,z)= ','s');
g=str2sym(g);
syms f(x,y,z)
f(x,y,z)=g;
fy=diff(f,y);
dfy=diff(fy,x);

%Converting 'f','fy' and 'dfy' to function handle.
%Because it takes less time in calculations
f=matlabFunction(f);
fy=matlabFunction(fy);
dfy=matlabFunction(dfy);

EndPoints=input('Input Endpoints as [a,b] = ');
aa=EndPoints(1); bb=EndPoints(2);

alpha=input('Input Coundary Condition 1: alpha= ');
beta=input('Input Coundary Condition 1: beta= ');
h=input('Input step-size: h= ');
tol=input('Input Tolerance: tol= ');

iterlimit=100;

n=(bb-aa)/h-1;
 a = zeros(1,n);
 b = zeros(1,n);
 c = zeros(1,n);
 d = zeros(1,n);
 l = zeros(1,n);
 u = zeros(1,n);
 z = zeros(1,n);
 v = zeros(1,n);
 w = zeros(1,n);
 ya_matrix=zeros(1,n+2);
for i=1:n
    w(i)=alpha+i*((beta-alpha)/(bb-aa))*h;
end

iter=0;
while iter<iterlimit
    x=aa+h;
    t=(w(2)-alpha)/(2*h);
    a(1) =2+h^2*fy(x,w(1),t);
    b(1) =-1+0.5*h*dfy(x,w(1),t);
    d(1) =-(2*w(1)-w(2)-alpha+h^2*f(x,w(1),t));
    for i=2:n-1
        x=aa+i*h;
        t=(w(i+1)-w(i-1))/(2*h);
        a(i) =2+h^2*fy(x,w(i),t);
        
        b(i) =-1+0.5*h*dfy(x,w(i),t);
        c(i) =-1-0.5*h*dfy(x,w(i),t);
        d(i) =-(2*w(i)-w(i+1)-w(i-1)+h^2*f(x,w(i),t));
    end
    
    x=bb-h;
    t=(beta-w(n-1))/(2*h);
    a(n) =2+h^2*fy(x,w(n),t);
    c(n) =-1-0.5*h*dfy(x,w(n),t);
    d(n) =-(2*w(n)-w(n-1)-beta+h^2*f(x,w(n),t));
    %Step 8
    l(1) = a(1);
    u(1) = b(1)/a(1);
    z(1) = d(1)/l(1);
    %Step 9
    for i = 2 : n-1
        l(i) = a(i)-c(i)*u(i-1);
        u(i) = b(i)/l(i);
        z(i) = (d(i)-c(i)*z(i-1))/l(i);
    end
    %Step 10
    l(n) = a(n)-c(n)*u(n-1);
    z(n) = (d(n)-c(n)*z(n-1))/l(n);
    
    w_old=w;
    %Step 11
    v(n)=z(n);
    w(n)=w(n)+v(n);
    
    %Step 12
    for i =n-1:-1:1
        v(i)=z(i)-u(i)*v(i+1);
        w(i) = w(i)+v(i);
    end
   
    if max(abs(w-w_old))<=tol
        for i=0:n+1
            x=aa+i*h;
        end
        
        fprintf('\n\nConvergence after Number of iterations= %d \n',iter)
        break;
    end
    
    iter=iter+1;
    
    
end
if iter>iterlimit

    disp('/n/nDid''nt converge to the specified tolerance')
    fprintf('Number of iterations=%d \n',iter)
end
w=[alpha,w,beta];
fprintf('%4.8f \n',w)


%For comparing with actual solution
disp('Wanna compare result to actual values?')
ask=input('Reply yes or no..... ','s');

if strcmpi(ask,'yes')

fa=input('Enter Actual Function f(x)= ','s');
fa=str2func(['@(x)',fa]);

obs=0;
fprintf('\nobs. \t    x(i) \t w(approx) \t      w(Actual) \t\t Error \n');

for t=aa:h:bb
    ya=fa(t);
    
    obs=obs+1;
xi(1,obs)=t;    
ya_matrix(1,obs)=ya;
end
Error=abs(w-ya_matrix);

fprintf('%3d \t  %3.3f \t %3.8f \t %3.8f \t %1.4e \n',[(1:n+2);xi;w;ya_matrix;Error]);

elseif strcmpi(ask,'no')
    disp('Best of luck then........')
else
    disp('The keyword you entered is not correct.Run program again...')
end

