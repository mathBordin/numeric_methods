% The following MATLAB function edo_euler.m finds the solution of the
% initial-value problem 11.2 using Eulerís method. INPUTS are a
% function f(t,y); the initial and final values a, b of t; the initial
% condition y0; the number of steps n. 
function edo_euler(f,a,b,y0,n)
% Solve the initial-value problem y'=f(t,y), y(a)=y0
% using Euler's method.
syms t y;
format rat;
fprintf('\n')
disp(' Euler method')
disp('______________________________________________')
disp(' ti f(ti,yi) yi Exact error ')
disp('______________________________________________')
fprintf('\n')
h=(b-a)/n;
yc=y0;
fprintf('%6.2f       ----   %12.6f %12.6f %4.2f\n',a,yc,yc,0)
for i=1:n
    tc=a+(i-1)*h;
    m=f(tc,yc);
    yc=yc+h*m;
    % Write the exact solution g if known as g=g(t) otherwise set g='n'.
    tc=tc+h;
    g='n';
    if (g~='n')
        err=abs(g-yc);
        fprintf('%6.2f %12.6f %12.6f %12.6f %8.2e\n',tc,m,yc,g,err)
    else
        fprintf('%6.2f %12.6f %12.6f\n',tc,m,yc)
    end
end