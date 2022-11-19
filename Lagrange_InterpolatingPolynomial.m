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
n=input('Enter the degree of Lagrange Polynomial n= ');
while n>=length(X)
    fprintf('Degree of polynomial exceeds the nummber of terms of x \n Degree must be <%2.0f \n',length(X))
n=input('Enter the degree of Lagrange Polynomial again n= ');
end
syms x
sm=0;
for i=1:n+1
  pr=1;
    for j=1:n+1
        if i~=j
            pr=pr*(x-X(j))/(X(i)-X(j));
        end
    end
    d(i,1)=pr;
    sm=sm+Y(i)*pr;
end
L_terms=d
Polynomial=sm
Simplified_Polynomial=simplify(Polynomial);
Simplified_Polynomial=expand(Simplified_Polynomial)
Coefficients=sym2poly(Simplified_Polynomial)
in=input('Now enter a point at which to evaluate the polynomial, x = ');
out=subs(Simplified_Polynomial,x,in);
fprintf('f(%f)=%8.8f \n',in,out)
