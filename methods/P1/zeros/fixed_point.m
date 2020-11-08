% The following MATLAB function fixed.m finds the solution of an
% equation using the fixed-point iteration method. INPUTS are a
% function g; an initial approximation x0; a tolerance tol; the maximum
% number of iterations n.
function x_zero = fixed_point(g,x0,tol,n)
% The fixed-point iteration method for solving the nonlinear
% equation f(x)=0.

syms x;
x_zero = NaN;

iter=0;
u=g(x0);
err=abs(u-x0);
disp('FIXED POINT METHOD');
disp('_______________________________________________');
disp(' iter x g(x) |xn+1-xn| ');
disp('_______________________________________________');
fprintf('%2.0f %12.6f %12.6f\n',iter,x0,u);
while (err>tol)&&(iter<=n)&&(u~=0)
    x1=u;
    err=abs(x1-x0);
    x0=x1;
    u=g(x0);
    iter=iter+1;
    fprintf('%2.0f %12.6f %12.6f %12.8f\n',iter,x0,u,err);
end
if (iter>n)
    disp(' Method failed to converge');
else
    x_zero = x0;
end
end