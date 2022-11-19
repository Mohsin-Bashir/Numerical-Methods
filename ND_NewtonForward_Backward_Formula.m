%Numerical Differentiation (Newton Forward Difference Formula)
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
fprintf('\nBy Forward-Difference Formula: \n')
h=X(2)-X(1);
for i=1:length(X)-1
f=(Y(i+1)-Y(i))/(h);
fprintf('f''(%.4f)=%.5f \n',X(i),f)
end

fprintf('\nBy Backward-Difference Formula: \n')
for i=1:length(X)-1
f=(Y(i)-Y(i+1))/(-h);
fprintf('f''(%.4f)=%.5f \n',X(i+1),f)
end

