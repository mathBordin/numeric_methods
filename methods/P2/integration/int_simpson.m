% The following MATLAB function int_simpson.m computes the definite
% integral 10.1 using Simpson's composite rule. INPUTS are a function
% f; the values of a and b; the value of n (even). 
function int_simpson(f,a,b,n)
% Compute the integral of a f from a to b using Simpsonís
% composite rule. n must be even.
syms x;
format rat;
if n/2~=floor(n/2)
    disp(' n must be even')
    return
end
h=(b-a)/n;
disp('______________________________________________')
disp([' i xi f(xi) h=',num2str(h) ])
disp('______________________________________________')
S=f(a);
fprintf(' %2.0f %12.4f %14.6f\n',0,a,S);
for i=1:n/2
    m=2*i-1;
    w=a+h*m;
    g=f(w);
    S=S+4*g;
    fprintf(' %2.0f %12.4f %14.6f\n',m,w,g);
    m=2*i;
    w=a+h*m;
    g=f(w);
    if(i==n/2)
        S=S+g;
    else
        S=S+2*g;
    end
    fprintf(' %2.0f %12.4f %14.6f\n',m,w,g);
end
INT=h*S/3;
fprintf('\n The intergral of f(x) is =%16.8f\n',INT);