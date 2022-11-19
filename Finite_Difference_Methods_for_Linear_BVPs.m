 clear;clc
 % Finite difference method 
 % Approximate the solution of y"=(-2/x)y'+(2/x^2)y+ sin(lnx)/x^2
 % for 1<=x<=2 with y(1)=1 and y(2)=2.
 
 p = @(x) (1);  
 q = @(x) (2);
 r = @(x) (cos(x));
 
 aa = 0; bb = pi/2; alpha = -.3; beta = -.1; n=3;      % h = (bb-aa)/(n+1);   h=0.1
  
 fprintf('   x           w   \n');
 h = (bb-aa)/(n+1);
 a = zeros(1,n+1);
 b = zeros(1,n+1);
 c = zeros(1,n+1);
 d = zeros(1,n+1);
 l = zeros(1,n+1);
 u = zeros(1,n+1);
 z = zeros(1,n+1);
 w = zeros(1,n+1);
 x = aa+h;
 a(1) = 2+h^2*q(x);
 b(1) = -1+0.5*h*p(x);
 d(1) = -h^2*r(x)+(1+0.5*h*p(x))*alpha;
 m = n-1;
 
 for i = 2 : m 
   x = aa+i*h;
   a(i) = 2+h^2*q(x);
   b(i) = -1+0.5*h*p(x);
   c(i) = -1-0.5*h*p(x);
   d(i) = -h^2*r(x);
 end
 
 x = bb-h;
 a(n) = 2+h^2*q(x);
 c(n) = -1-0.5*h*p(x);
 d(n) = -h^2*r(x)+(1-0.5*h*p(x))*beta;
 l(1) = a(1);
 u(1) = b(1)/a(1);
 z(1) = d(1)/l(1);
 
 for i = 2 : m 
   l(i) = a(i)-c(i)*u(i-1);
   u(i) = b(i)/l(i);
   z(i) = (d(i)-c(i)*z(i-1))/l(i);
 end
 
 l(n) = a(n)-c(n)*u(n-1);
 z(n) = (d(n)-c(n)*z(n-1))/l(n);
 w(n) = z(n);

 for j = 1 : m 
   i = n-j;
   w(i) = z(i)-u(i)*w(i+1);
 end
 i = 0;
 fprintf('%5.4f    %11.8f\n', aa, alpha);
 for i = 1 : n 
   x = aa+i*h;
   fprintf('%5.4f    %11.8f\n', x, w(i));
 end
 i = n+1;
 fprintf('%5.4f    %11.8f\n', bb, beta);


%For comparing with actual solution
disp('Wanna compare result to actual values?')
ask=input('Reply yes or no..... ','s');

if strcmpi(ask,'yes')
w(end)=beta;
 w=[alpha,w];
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