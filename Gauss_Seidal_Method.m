clc;clear
a=input('Input the cofficients in the form of a matrix a=')
[r,c]=size(a);
while r~=c %% As 'a' must be a square matrix
    disp('a is not a square matrix.Please enter a square matrix')
    a=input('Input the cofficients in the form of a matrix a=')
    [r,c]=size(a);
end

%Checking if the matrix is diagonally dominant or not
i=1;
while i<=r
    if abs(a(i,i))<max(abs(a(i,:)))
        disp('''a'' is not a diagonally dominant matrix.')
        disp('Make it diagonally dominant and enter again....')
        a=input('Input the cofficients in the form of a matrix a=')
    else
        i=i+1;
    end
end

b=input('Input constants in the form of a column matrix b=')
[row,col]=size(b);
while col~=1 %'b' must be a column vector
    disp('b is not a column matrix.Please enter a column matrix')
    b=input('Input constants in the form of a column matrix b=')
    [row,col]=size(b);
end


while r~=row %%avoiding the error of unequal no of rows of 'a' and 'b'
    disp('No. of Rows of ''a'' are not equal to No of Rows of ''b''')
    a=input('Input the cofficients in the form of a matrix a=')
    [r,c]=size(a);
    while r~=c %% As 'a' must be a square matrix
        disp('a is not a square matrix.Please enter a square matrix')
        a=input('Input the cofficients in the form of a matrix a=')
        [r,c]=size(a);
    end
    %Checking if the matrix is diagonally dominant or not
    i=1;
    while i<=r
        if abs(a(i,i))<max(abs(a(i,:)))
            disp('''a'' is not a diagonally dominant matrix.')
            disp('Make it diagonally dominant and enter again...')
            a=input('Input the cofficients in the form of a matrix a=')
        else
            i=i+1;
        end
    end
    
    b=input('Input constants in the form of a column matrix b=')
    [row,col]=size(b);
    while col~=1 %'b' must be a column vector
        disp('b is not a column matrix.Please enter a column matrix')
        b=input('Input constants in the form of a column matrix b=')
        [row,col]=size(b);
    end
    
end


n=length(b);
x=[87.891,87.695,62.695,62.598];
xnew=[87.891,87.695,62.695,62.598];

iterlimit=100;
tol=input('Input tolerence=');

for iteration=1:iterlimit
    convergence=true;
    for i=1:n       %loop of equations
        sum=0;
        for j=1:n   %loop of summation
            if j~=i
                sum=sum+a(i,j)*x(j);
            end
        end
        xnew(i)=-1/a(i,i)*(sum-b(i));
        % For storing Relative Error in a matrix
        Error(iteration,i)=(abs((xnew(i))'-(x(i))'));
        
        if abs(xnew(i)-x(i))>tol
            convergence=false;
        end
        
        x=xnew;
        H(iteration,:)=xnew';
        col1(iteration,1)=iteration;
    end
    
    if convergence
        break
    end
end
iteration
xnew
Table=[0,zeros(1,n);col1 H];
fprintf('Table of Iterations \n')
if n==2
    fprintf('  No. of         x1              x2 \niterations \n')
    fprintf('\t%2.0f \t\t %2.8f \t %2.8f \n',[(Table(:,1))';(Table(:,2))';(Table(:,3))'])
elseif n==3
    fprintf('  No. of         x1              x2              x3 \niterations \n')
    fprintf('\t%2.0f \t\t %2.8f \t %2.8f \t %2.8f\n',[(Table(:,1))';(Table(:,2))';(Table(:,3))';(Table(:,4))'])
elseif n==4
    fprintf('  No. of         x1              x2              x3              x4 \niterations \n')
    fprintf('\t%2.0f \t\t %2.8f \t %2.8f \t %2.8f \t %2.8f \n',[(Table(:,1))';(Table(:,2))';(Table(:,3))';(Table(:,4))';(Table(:,5))'])
elseif n==5
    fprintf('  No. of         x1              x2              x3              x4              x5 \niterations \n')
    fprintf('\t%2.0f \t\t %2.8f \t %2.8f \t %2.8f \t %2.8f \t %2.8f \n',[(Table(:,1))';(Table(:,2))';(Table(:,3))';(Table(:,4))';(Table(:,5))';(Table(:,6))'])
elseif n==6
    fprintf('  No. of         x1              x2              x3              x4              x5              x6 \niterations \n')
    fprintf('\t%2.0f \t\t %2.8f \t %2.8f \t %2.8f \t %2.8f \t %2.8f \t %2.8f \n',[(Table(:,1))';(Table(:,2))';(Table(:,3))';(Table(:,4))';(Table(:,5))';(Table(:,6))';(Table(:,7))'])
else
    disp('Please change script to get the Table of Iterations')
end
fprintf('\nTable of Relative Error \n')
if n==2
    fprintf('  No. of         x1              x2 \niterations \n')
    fprintf('\t%2.0f \t\t %2.8f \t %2.8f \n',[col1';(Error(:,1))';(Error(:,2))'])
elseif n==3
    fprintf('  No. of         x1              x2              x3 \niterations \n')
    fprintf('\t%2.0f \t\t %2.8f \t %2.8f \t %2.8f\n',[col1';(Error(:,1))';(Error(:,2))';(Error(:,3))'])
elseif n==4
    fprintf('  No. of         x1              x2              x3              x4 \niterations \n')
    fprintf('\t%2.0f \t\t %2.8f \t %2.8f \t %2.8f \t %2.8f \n',[col1';(Error(:,1))';(Error(:,2))';(Error(:,3))';(Error(:,4))'])
elseif n==5
    fprintf('  No. of         x1              x2              x3              x4              x5 \niterations \n')
    fprintf('\t%2.0f \t\t %2.8f \t %2.8f \t %2.8f \t %2.8f \t %2.8f \n',[col1';(Error(:,1))';(Error(:,2))';(Error(:,3))';(Error(:,4))';(Error(:,5))'])
elseif n==6
    fprintf('  No. of         x1              x2              x3              x4              x5              x6 \niterations \n')
    fprintf('\t%2.0f \t\t %2.8f \t %2.8f \t %2.8f \t %2.8f \t %2.8f \t %2.8f \n',[col1';(Error(:,1))';(Error(:,2))';(Error(:,3))';(Error(:,4))';(Error(:,5))';(Error(:,6))'])
else
    disp('Please change script to get the Table of Iterations')
end

fprintf('\nTable of Maximum Error \n')
fprintf('  No. of      Max_Error \niterations \n')
fprintf('\t%2.0f \t\t %2.8f \n',[col1';(max(Error,[],2))'])


