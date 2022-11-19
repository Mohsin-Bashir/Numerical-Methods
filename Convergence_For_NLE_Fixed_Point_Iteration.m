clear;clc
%This script asks u only 3 things
%1-Number of Equations (Only for the system of 2 or 3 equations)
%2-Higher limit of domain 3-G vector

%This script tells you 1-if the solution exist in domain or not
%2-value of k 3-A cell array contaning partial derivative etc..
n= input('Enter the number of equations n= ');
r=input('Input Higher Limit of Domain= ');
if n==2
    g1= input('Enter Function g1(x1,x2)= ','s');
    g2=input('Enter Function g2(x1,x2)= ','s');
    
    g1=str2sym(g1);
    g2=str2sym(g2);
    
    syms x1 x2
    g1x1=diff(g1,x1);
    g1x1d=abs(double(subs(g1x1,[x1,x2],[r r])));
    g1x2=diff(g1,x2);
    g1x2d=abs(double(subs(g1x2,[x1,x2],[r r])));
    
    g2x1=diff(g2,x1);
    g2x1d=abs(double(subs(g2x1,[x1,x2],[r r])));
    g2x2=diff(g2,x2);
    g2x2d=abs(double(subs(g2x2,[x1,x2],[r r])));
    
    p=cell(4,3);
    p{1,1}='g1x1';p{2,1}='g1x2';
    p{3,1}='g2x1';p{4,1}='g2x2';
    
    p{1,2}=g1x1;p{2,2}=g1x2;
    p{3,2}=g2x1;p{4,2}=g2x2;
    
    p{1,3}=g1x1d;p{2,3}=g1x2d;
    p{3,3}=g2x1d;p{4,3}=g2x2d;
    p
    
    for o=1:4
        m(o,1)=p{o,3};
    end
    
    
elseif n==3
    g1= input('Enter Function g1(x1,x2,x3)= ','s');
    g2=input('Enter Function g2(x1,x2,x3)= ','s');
    g3=input('Enter Function g3(x1,x2,x3)= ','s');
    
    g1=str2sym(g1);
    g2=str2sym(g2);
    g3=str2sym(g3);
    
    syms x1 x2 x3
    g1x1=diff(g1,x1);
    g1x1d=abs(double(subs(g1x1,[x1,x2,x3],[r r r])));
    g1x2=diff(g1,x2);
    g1x2d=abs(double(subs(g1x2,[x1,x2,x3],[r r r])));
    g1x3=diff(g1,x3);
    g1x3d=abs(double(subs(g1x3,[x1,x2,x3],[r r r])));
    
    g2x1=diff(g2,x1);
    g2x1d=abs(double(subs(g2x1,[x1,x2,x3],[r r r])));
    g2x2=diff(g2,x2);
    g2x2d=abs(double(subs(g2x2,[x1,x2,x3],[r r r])));
    g2x3=diff(g2,x3);
    g2x3d=abs(double(subs(g2x3,[x1,x2,x3],[r r r])));
    
    g3x1=diff(g3,x1);
    g3x1d=abs(double(subs(g3x1,[x1,x2,x3],[r r r])));
    g3x2=diff(g3,x2);
    g3x2d=abs(double(subs(g3x2,[x1,x2,x3],[r r r])));
    g3x3=diff(g3,x3);
    g3x3d=abs(double(subs(g3x3,[x1,x2,x3],[r r r])));
    
    
    
    p=cell(9,3);
    p{1,1}='g1x1';p{2,1}='g1x2';p{3,1}='g1x3';
    p{4,1}='g2x1';p{5,1}='g2x2';p{6,1}='g2x3';
    p{7,1}='g3x1';p{8,1}='g3x2';p{9,1}='g3x3';
    
    p{1,2}=g1x1;p{2,2}=g1x2;p{3,2}=g1x3;
    p{4,2}=g2x1;p{5,2}=g2x2;p{6,2}=g2x3;
    p{7,2}=g3x1;p{8,2}=g3x2;p{9,2}=g3x3;
    
    p{1,3}=g1x1d;p{2,3}=g1x2d;p{3,3}=g1x3d;
    p{4,3}=g2x1d;p{5,3}=g2x2d;p{6,3}=g2x3d;
    p{7,3}=g3x1d;p{8,3}=g3x2d;p{9,3}=g3x3d;
    p
    for o=1:9
        m(o,1)=p{o,3};
    end
    
end
k=max(m)*n
if max(m)*n<1
    disp('G has a unique fixed point in Domain, and solution exists in Domain')
elseif    max(m)*n>=1
    disp('G don''t have a unique fixed point in Domain, and solution doesn''t exists in Domain')
end