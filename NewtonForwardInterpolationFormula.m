x=input('Enter the values of x as a row vector, x= ');
while size(x,1)>1
 fprintf('Please enter x values as a row vector like [1 2 3] \n');
 x=input('Enter the values of x as a row vector, x= ');
end
y=input('Enter the values of y or f(x) as a row vector, f(x)= ');
while size(y,1)>1
 fprintf('Please enter f(x) values as a row vector like [1 2 3] \n');
 y=input('Enter the values of f(x) as a row vector, f(x)= ');
end
while length(x)~=length(y)
fprintf('Length of x and f(x) row vectors must be same.\n');
x=input('Enter the values of x as a row vector again, x= ');
    while size(x,1)>1
 fprintf('Please enter x values as a row vector like [1 2 3] \n');
 x=input('Enter the values of x as a row vector, x= ');
    end 
y=input('Enter the values of y or f(x) as a row vector, f(x)= ');
    while size(y,1)>1
 fprintf('Please enter f(x) values as a row vector like [1 2 3] \n');
 y=input('Enter the values of f(x) as a row vector, f(x)= ');
    end
end
[~,n]=size(x);
x0 = input('Now enter a point at which to evaluate the polynomial, x = ');
for i = 1:n
    D(i,1) = y(i);
 end

 for i = 2:n
    for j = 2:i
       D(i,j)=(D(i,j-1)-D(i-1,j-1))/(x(i)-x(i-j+1));
    end
 end

 fx0 = D(n,n);
 for i = n-1:-1:1
    fx0 = fx0*(x0-x(i)) + D(i,i);
 end
fprintf('Newtons iterated value: %11.8f \n', fx0)