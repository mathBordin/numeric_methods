% The following MATLAB function int_trapez.m computes the definite
% integral 10.1 using the composite trapezoidal rule. INPUTS are a
% function f; the values of a and b; the number of trapezoids n.
function int_trapez(f,a,b,n)
% Compute the integral of f(x) from a to b using the trapezoid rule
syms x;
h=(b-a)/n;
disp('_______________________________________________')
disp([' i xi f(xi) h=',num2str(h) ])
disp('_______________________________________________')
S=f(a);
fprintf(' %2.0f %12.4f %14.6f\n',0,a,S);
for i=1:n-1
    w=a+h*i;
    g=f(w);
    S=S+2*g;
    fprintf(' %2.0f %12.4f %14.6f\n',i,w,g);
end
S=S+f(b);
fprintf(' %2.0f %12.4f %14.6f\n',n,b,f(b));
INT=h*S/2;
fprintf('\n The intergral of f(x) is =%16.8f\n',INT);