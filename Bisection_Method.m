
clear;clc
f=input('Enter Function f(x)= ','s');
f=str2func(['@(x)',f]);
end_points=input('Input the interval as [a,b]= ');
a=end_points(1);b=end_points(2);
ao=a;bo=b;
FA=f(a);
FB=f(b);
if FA*FB>0
    fprintf('Solution doesn''t exist in this interval=>[%d,%d] \n',a,b)
    return;
end

tol = input('Enter the tolerance, tol: ');
iterlimit = input('Enter maximum number of iterations:  ');

iter=0;
p_old=b;
fprintf('n \t\t a \t\t\t\t b \t\t\t\t p \t\t\t\t f(p) \n');

while iter<iterlimit
    
    iter=iter+1;
    p=(a+b)/2;
    FP=f(p);
   
                iter_col(iter)=iter;
                a_col(iter)=a;
                FA_col(iter)=FA;
                b_col(iter)=b;
                FB_col(iter)=FB;
                p_col(iter)=p;
                FP_col(iter)=FP;
    
    fprintf('%d \t %2.9f \t %2.9f \t %2.9f \t %2.9f \n',iter,a,b,p,FP);
    if abs((p-p_old))<tol
        break;
    end
    
    if FA*FP>0
        a=p;
        p_old=p;
    else
        b=p;
        p_old=p;
    end
    
end
fplot(f,[ao,bo]);
hold on;
xline(a_col);
yline(b_col);