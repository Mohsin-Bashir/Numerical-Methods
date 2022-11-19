%Numerical Differentiation (Newton 5 Point Formula)
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
fprintf('\nBy 5 Point Formula: \n')
h=X(2)-X(1);

% For 5 Point Formula
for i=[1 2]
f=(-25*Y(i)+48*Y(i+1)-36*Y(i+2)+16*Y(i+3)-3*Y(i+4))/(12*h);
fprintf('f''(%.4f)=%.6f \n',X(i),f)
end

% For 5 Point (End-Point) Formula
for i=[length(X)-1 length(X)]
f=(-25*Y(i)+48*Y(i-1)-36*Y(i-2)+16*Y(i-3)-3*Y(i-4))/(-12*h);
fprintf('f''(%.4f)=%.6f \n',X(i),f)
end

% For 5 Point Mid-Point Formula
fprintf('\nBy 5 Point Mid-Point Formula: \n')
for i=[3 4]
f=(Y(i-2)-8*Y(i-1)+8*Y(i+1)-Y(i+2))/(12*h);
fprintf('f''(%.4f)=%.6f \n',X(i),f)
end
