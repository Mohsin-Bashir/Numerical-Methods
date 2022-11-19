clear;clc
X=input('Enter the values of x as a row vector, x= ');
while size(X,1)>1
 fprintf('Please enter x values as a row vector like [1 2 3] \n');
 X=input('Enter the values of x as a row vector, x= ');
end
Y=input('Enter the values of y or f(x) as a row vector, f(x)= ');
while size(Y,1)>1
 fprintf('Please enter f(x) values as a row vector like [1 2 3] \n');
 Y=input('Enter the values of f(x) as a row vector, f(x)= ');
end
while length(X)~=length(Y)
fprintf('Length of x and f(x) row vectors must be same.\n');
X=input('Enter the values of x as a row vector again, x= ');
    while size(X,1)>1
 fprintf('Please enter x values as a row vector like [1 2 3] \n');
 X=input('Enter the values of x as a row vector, x= ');
    end 
Y=input('Enter the values of y or f(x) as a row vector, f(x)= ');
    while size(Y,1)>1
 fprintf('Please enter f(x) values as a row vector like [1 2 3] \n');
 Y=input('Enter the values of f(x) as a row vector, f(x)= ');
    end
end

[~,n]=size(X);
for i = 1:n
    D(i,1) = Y(i);
 end

 for i = 2:n
    for j = 2:i
       D(i,j)=(D(i,j-1)-D(i-1,j-1));
    end
 end
 
 y= (D(end,:))';
h=X(2)-X(1);
x0=X(end);
syms x p P 
p=(x-x0)/h;
P=Y(end);
%Formula here
for k=1:n-1
   upper=prod([p:1:p-(-k+1)]);   
c=upper/factorial(k);
 f=sum(c*y(k+1));
P=P+f;
end
polynomial=P
Difference_Table=D
polynomial=sym2poly(P);
SimplePoly=poly2sym(polynomial)
  
in=input('Now enter a point at which to evaluate the polynomial, x = ');
out=subs(SimplePoly,x,in);
fprintf('f(%f)=%8.8f \n',in,out)
plot(X(1):0.1:X(end),polyval(sym2poly(SimplePoly),X(1):0.1:X(end)))
grid on
