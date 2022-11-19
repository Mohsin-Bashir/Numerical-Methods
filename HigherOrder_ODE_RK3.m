clear;clc
eq=input('Input Number of First Order ODEs: ');
if eq==2
    f=input('Enter Function f(t,y,z)= ','s');
    f=str2func(['@(t,y,z)',f]);
    g=input('Enter Function g(t,y,z)= ','s');
    g=str2func(['@(t,y,z)',g]);
    
    
    end_points=input('Input the end points of ''t'' as [a,b]= ');
    to=end_points(1);tn=end_points(2);
    
    fprintf('Input the value of y(%f)=',to);
    y=input(' ');
    fprintf('Input the value of z(%f)=',to);
    z=input(' ');
    
    h=input('Input the value of h= ');
    
    fprintf('Number of steps n=%d \n',(tn-to)/h)
    obs=0;
    fprintf('obs. \t  t \t y(Euler) \t z(Euler) \n');
    fprintf('%2d \t  %f \t %f \t %f\n',obs,to,y,z);
    for t=to:h:tn-h
        
        k1=h*f(t,y,z);
        l1=h*g(t,y,z);
        
        k2=h*f(t+h/2,y+k1*(h/2),z+l1*(h/2));
        l2=h*g(t+h/2,y+k1*(h/2),z+l1*(h/2));
        
        k3=h*f(t+h/2,y-h*k1+2*h*k2,z-h*l1+2*h*l2);
        l3=h*g(t+h/2,y-h*k1+2*h*k2,z-h*l1+2*h*l2);
        
        y=y+1/6*(k1+4*k2+k3);
        z=z+1/6*(l1+4*l2+l3);
        
        t=t+h;obs=obs+1;
        K(obs,:)=[k1,k2,k3];
        L(obs,:)=[l1,l2,l3];
        
        fprintf('%2d \t  %f \t %f \t %f\n',obs,t,y,z);
        
        
        %To find the Values of K's(k1,k2,k3,k4)
        %First row are the values of K's corresponding to w1 and so on
        K;
        L;
    end
elseif eq==3
    f1=input('Enter Function f1(t,u1,u2,u3)= ','s');
    f1=str2func(['@(t,u1,u2,u3)',f1]);
    f2=input('Enter Function f2(t,u1,u2,u3)= ','s');
    f2=str2func(['@(t,u1,u2,u3)',f2]);
    f3=input('Enter Function f3(t,u1,u2,u3)= ','s');
    f3=str2func(['@(t,u1,u2,u3)',f3]);
    
    end_points=input('Input the end points of ''t'' as [a,b]= ');
    to=end_points(1);tn=end_points(2);
    
    fprintf('Input the value of u1(%f)=',to);
    u1=input(' ');
    fprintf('Input the value of u2(%f)=',to);
    u2=input(' ');
    fprintf('Input the value of u3(%f)=',to);
    u3=input(' ');
    
    h=input('Input the value of h= ');
    
    fprintf('Number of steps n=%d \n',(tn-to)/h)
    obs=0;
    fprintf('obs. \t  t \t u1(Euler) \t u2(Euler) \t u3(Euler) \n');
    fprintf('%2d \t  %f \t %f \t %f \t %f\n',obs,to,u1,u2,u3);
    for t=to:h:tn-h
        
        k1=h*f1(t,u1,u2,u3);
        l1=h*f2(t,u1,u2,u3);
        m1=h*f3(t,u1,u2,u3);
        
        k2=h*f1(t+h/2,u1+k1*(h/2),u2+l1*(h/2),u3+m1*(h/2));
        l2=h*f2(t+h/2,u1+k1*(h/2),u2+l1*(h/2),u3+m1*(h/2));
        m2=h*f3(t+h/2,u1+k1*(h/2),u2+l1*(h/2),u3+m1*(h/2));
        
        k3=h*f1(t+h/2,u1-h*k1+2*h*k2,u2-h*l1+2*h*l2,u3-h*m1+2*h*m2);
        l3=h*f2(t+h/2,u1-h*k1+2*h*k2,u2-h*l1+2*h*l2,u3-h*m1+2*h*m2);
        m3=h*f3(t+h/2,u1-h*k1+2*h*k2,u2-h*l1+2*h*l2,u3-h*m1+2*h*m2);
        
       
        u1=u1+1/6*(k1+4*k2+k3);
        u2=u2+1/6*(l1+4*l2+l3);
        u3=u3+1/6*(m1+4*m2+m3);
        
        t=t+h;obs=obs+1;
        K(obs,:)=[k1,k2,k3];
        L(obs,:)=[l1,l2,l3];
        M(obs,:)=[m1,m2,m3];
        
        fprintf('%2d \t  %f \t %f \t %f \t %f\n',obs,t,u1,u2,u3);
        
    end
    
    %To find the Values of K's(k1,k2,k3,k4)
    %First row are the values of K's corresponding to w1 and so on
    K;
    L;
    M;
end

