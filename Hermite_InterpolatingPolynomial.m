clear;clc
X=[0 .5];
Y=[1 2.71828];
Z=[2 5.43656];
n=length(X);
syms x
for i=1:n
  pr=1;
    for j=1:n
        if i~=j
            pr=pr*(x-X(j))/(X(i)-X(j));
        end
    end
    d(i,1)=(pr);
end
L_terms=d
dL_terms=diff(L_terms)

for j=1:n
    H(j,1)=(1-2*(x-X(j))*dL_terms(j))*(L_terms(j))^2;
    H1(j,1)=(x-X(j))*(L_terms(j))^2;
end


sm=0;
for i=1:n
    sm=sm+(Y(i)*H(i)+Z(i)*H1(i));
end



Simplified_Polynomial=simplify(sm);
Simplified_Polynomial=expand(Simplified_Polynomial)
Coefficients=sym2poly(sm)
in=input('Now enter a point at which to evaluate the polynomial, x = ');
H_terms=double(subs(H,x,in))
H_hat_terms=double(subs(H1,x,in))
out=subs(Simplified_Polynomial,x,in);
fprintf('f(%f)=%8.8f \n',in,out)


    
    