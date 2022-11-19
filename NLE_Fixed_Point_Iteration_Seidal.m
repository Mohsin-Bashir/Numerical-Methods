clear;clc
%For system of non-linear equations using fixed point iteration method
%This script gives No. of iterations, Table of iterations & Table of
%maximum errors


n=input('Enter the number of equations n=');

if n==2
    i=input('Enter initial approximation of x1='); %Asking the user to input initial approximation
    j=input('Enter initial approximation of x2=');
    g1=input('Enter Function g1(x1,x2)= ','s')  ;
    g2=input('Enter Function g2(x1,x2)= ','s')  ;
    g1=str2func(['@(x1,x2)',g1]);
    g2=str2func(['@(x1,x2)',g2]);
    tol=input('Input tolerence=');
    
    iter=0;%Initialization
    iterlimit=100;
    
    while iter<=iterlimit
        x=[i j];
        i=g1(i,j);
        j=g2(i,j);
        iter=iter+1;
        xnew(iter,:)=[i j];
        Error(iter,:)=max(abs(xnew(end,:)-x));
        if max(abs(xnew(end,:)-x))<tol
            break;
        end
    end
    
elseif n==3
    i=input('Enter initial approximation of x1='); %Asking the user to input initial approximation
    j=input('Enter initial approximation of x2=');
    k=input('Enter initial approximation of x3=');
    
    g1=input('Enter Function g1(x1,x2,x3)= ','s');
    g2=input('Enter Function g2(x1,x2,x3)= ','s');
    g3=input('Enter Function g3(x1,x2,x3)= ','s');
    
    g1=str2func(['@(x1,x2,x3)',g1]);
    g2=str2func(['@(x1,x2,x3)',g2]);
    g3=str2func(['@(x1,x2,x3)',g3]);
    tol=input('Input tolerence=');
    
    %Initializations
    iter=0;
    iterlimit=100;
    
    while iter<=iterlimit
        x=[i j k];
        i=g1(i,j,k);
        j=g2(i,j,k);
        k=g3(i,j,k);
        iter=iter+1;
        xnew(iter,:)=[i j k];
        Error(iter,:)=max(abs(xnew(end,:)-x));
        if max(abs(xnew(end,:)-x))<tol
            break;
        end
    end
end
fprintf('\nNumber_of_iterations=%3.0f \n\n',iter)

if n==2
    fprintf('Table of Iterations \n')
    fprintf('  No. of         x1              x2 \niterations \n')
    fprintf('\t%2.0f \t\t %2.8f \t %2.8f\n',[1:iter;(xnew(:,1))';(xnew(:,2))'])
elseif n==3
    fprintf('Table of Iterations \n')
    fprintf('  No. of         x1              x2              x3 \niterations \n')
    fprintf('\t%2.0f \t\t %2.8f \t %2.8f \t %2.8f\n',[1:iter;(xnew(:,1))';(xnew(:,2))';(xnew(:,3))'])
end
fprintf('\nTable of Maximum Errors \n')
fprintf('  No. of      Max_Error \niterations \n')
fprintf('\t%2.0f \t\t %2.8E \n',[1:iter;Error'])

