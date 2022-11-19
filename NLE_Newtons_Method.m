clear;clc
n=input('Enter the number of equations n=');
fprintf('\nEnter only the LHS of Equation F(x)=0 \n\n')
if n==2
    f1= input('Enter Function f1(x1,x2)= ','s');
    f2=input('Enter Function f2(x1,x2)= ','s');
    
    %Coverting functions to symbolic form from string
    syms x1 x2
    f1=str2sym(f1);
    f2=str2sym(f2);
    
    fx=[f1;f2];
    % Taking Partial Derivatives for Jacobian Matrix
    f1x1=diff(f1,x1);
    f1x2=diff(f1,x2);
    
    f2x1=diff(f2,x1);
    f2x2=diff(f2,x2);
    
    
    J=[f1x1 f1x2;f2x1 f2x2];
    
    %Asking the user to input initial approximation
    i=input('Enter initial approximation of x1=');
    j=input('Enter initial approximation of x2=');
    
    %Initial appproximation
    x=[i;j];
    
    tol=input('Input tolerence=');
    
    iter=0;%Initialization
    iterlimit=100;
    
    while iter<=iterlimit
        iter=iter+1;
        %Calculating the values of functions
        fxd=double(subs(fx(:,:),[x1 x2 ],x'));
        
        %Calculating the the values of Jacobi's matrix
        Jd=double(subs(J(:,:),[x1 x2],x'));
        if cond(Jd)==inf
            fprintf('\n\nSolution can not be computed since Jacobian Matrix is singular \n')
            return
        end
        
        xnew=x-Jd\fxd;
        Error(iter,:)=max(abs(xnew-x));
        t(iter,:)=xnew';
        if max(abs(xnew-x))<tol
            break;
        end
        x=xnew;
    end
    
elseif n==3
    f1= input('Enter Function f1(x1,x2,x3)= ','s');
    f2=input('Enter Function f2(x1,x2,x3)= ','s');
    f3=input('Enter Function f3(x1,x2,x3)= ','s');
    %Coverting functions to symbolic form from string
    syms x1 x2 x3
    f1=str2sym(f1);
    f2=str2sym(f2);
    f3=str2sym(f3);
    fx=[f1;f2;f3];
    % Taking Partial Derivatives for Jacobian Matrix
    f1x1=diff(f1,x1);
    f1x2=diff(f1,x2);
    f1x3=diff(f1,x3);
    
    f2x1=diff(f2,x1);
    f2x2=diff(f2,x2);
    f2x3=diff(f2,x3);
    
    f3x1=diff(f3,x1);
    f3x2=diff(f3,x2);
    f3x3=diff(f3,x3);
    
    J=[f1x1 f1x2 f1x3;f2x1 f2x2 f2x3;f3x1 f3x2 f3x3];
    
    %Asking the user to input initial approximation
    i=input('Enter initial approximation of x1=');
    j=input('Enter initial approximation of x2=');
    k=input('Enter initial approximation of x3=');
    %Initial appproximation
    x=[i;j;k];
    
    tol=input('Input tolerence=');
    
    iter=0;%Initialization
    iterlimit=100;
    
    while iter<=iterlimit
        iter=iter+1;
        %Calculating the values of functions
        fxd=double(subs(fx(:,:),[x1 x2 x3],x'));
        
        %Calculating the the values of Jacobi's matrix
        Jd=double(subs(J(:,:),[x1 x2 x3],x'));
        
        xnew=x-Jd\fxd;
        Error(iter,:)=max(abs(xnew-x));
        t(iter,:)=xnew';
        if max(abs(xnew-x))<tol
            break;
        end
        x=xnew;
    end
elseif n==4
f1= input('Enter Function f1(x1,x2,x3,x4)= ','s');
f2=input('Enter Function f2(x1,x2,x3,x4)= ','s');
f3=input('Enter Function f3(x1,x2,x3,x4)= ','s');
f4=input('Enter Function f4(x1,x2,x3,x4)= ','s');
%Coverting functions to symbolic form from string
syms x1 x2 x3 x4
f1=str2sym(f1);
f2=str2sym(f2);
f3=str2sym(f3);
f4=str2sym(f4);
fx=[f1;f2;f3;f4];
% Taking Partial Derivatives for Jacobian Matrix
f1x1=diff(f1,x1);
f1x2=diff(f1,x2);
f1x3=diff(f1,x3);
f1x4=diff(f1,x4);

f2x1=diff(f2,x1);
f2x2=diff(f2,x2);
f2x3=diff(f2,x3);
f2x4=diff(f2,x4);

f3x1=diff(f3,x1);
f3x2=diff(f3,x2);
f3x3=diff(f3,x3);
f3x4=diff(f3,x4);

f4x1=diff(f4,x1);
f4x2=diff(f4,x2);
f4x3=diff(f4,x3);
f4x4=diff(f4,x4);

J=[f1x1 f1x2 f1x3 f1x4;f2x1 f2x2 f2x3 f2x4;f3x1 f3x2 f3x3 f3x4;f4x1 f4x2 f4x3 f4x4];

%Asking the user to input initial approximation
i=input('Enter initial approximation of x1=');
j=input('Enter initial approximation of x2=');
k=input('Enter initial approximation of x3=');
l=input('Enter initial approximation of x4=');
%Initial appproximation
x=[i;j;k;l];

tol=input('Input tolerence=');

iter=0;%Initialization
iterlimit=100;

while iter<=iterlimit
    iter=iter+1;
    %Calculating the values of functions
    fxd=double(subs(fx(:,:),[x1 x2 x3 x4],x'));
    
    %Calculating the the values of Jacobi's matrix
    Jd=double(subs(J(:,:),[x1 x2 x3 x4],x'));
    
    xnew=x-Jd\fxd;
    Error(iter,:)=max(abs(xnew-x));
    t(iter,:)=xnew';
    if max(abs(xnew-x))<tol
        break;
    end
    x=xnew;
end
end
Jacobian_Matrix=J
fprintf('\nNumber_of_iterations=%3.0f \n\n',iter)
if n==2
    fprintf('Table of Iterations \n')
    fprintf('  No. of         x1              x2 \niterations \n')
    fprintf('\t%2.0f \t\t %2.8f \t %2.8f\n',[1:iter;(t(:,1))';(t(:,2))'])
    
elseif n==3
    fprintf('Table of Iterations \n')
    fprintf('  No. of         x1              x2              x3 \niterations \n')
    fprintf('\t%2.0f \t\t %2.8f \t %2.8f \t %2.8f\n',[1:iter;(t(:,1))';(t(:,2))';(t(:,3))'])
elseif n==4
    fprintf('Table of Iterations \n')
    fprintf('  No. of         x1              x2              x3               x4 \niterations \n')
    fprintf('\t%2.0f \t\t %2.8f \t %2.8f \t %2.8f \t %2.8f\n',[1:iter;(t(:,1))';(t(:,2))';(t(:,3))';(t(:,4))'])
end

fprintf('\nTable of Maximum Errors \n')
fprintf('  No. of      Max_Error \niterations \n')
fprintf('\t%2.0f \t\t %2.8E \n',[1:iter;Error'])


