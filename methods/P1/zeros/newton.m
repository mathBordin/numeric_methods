%The following MATLAB function newton.m approximates the
%solution of an equation using Newton's method. INPUTS are a
%function f and its derivative f'; an initial guess x0; a tolerance tol; the
%maximum number of iterations n. The input functions f(x) and f'(x)
%should be defined as M-files.
function x_zero = newton(f,x0,tol,n)
% Newton's method for solving the nonlinear equation f(x)=0.
syms x;
x_zero = NaN;

df = diff(f);

iter=0;
u=f(x0);
v=df(x0);
err=abs(u/v);
disp('NEWTON METHOD');
disp('______________________________________________');
disp(' iter x f(x) df(x) |xn+1-xn| ');
disp('______________________________________________');
fprintf('%2.0f %12.6f %12.6f %12.6f\n', iter, x0, u, v);
while (err>tol)&&(iter<=n)&&(v~=0)
    x1=x0-u/v;
    err=abs(x1-x0);
    x0=x1;
    u=f(x0);
    v=df(x0);
    iter=iter+1;
    fprintf('%2.0f %12.6f %12.6f %12.6f %12.6f\n',iter,x0,u,v,err);
end
if (v==0)
    disp('Division by zero');
end
if (iter>n)
    disp(' Method failed to converge');
else
    x_zero = vpa(x0)+tol;
end

end