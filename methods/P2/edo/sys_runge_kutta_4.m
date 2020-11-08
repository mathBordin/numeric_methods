% The following MATLAB function sys_runge_kutta_4.m solves the system 11.48
% using the Runge-Kutta method of order 4. INPUTS are functions
% f(t,x,y) and g(t,x,y); the initial and final values a, b of t; the initial
% conditions x0, y0 of x and y; the number of steps n. 
function sys_runge_kutta_4(f,g,a,b,x0,y0,n)
% Solve the system of differential equations x'=f(t,x,y), x(a)=x0 and
% y'=g(t,x,y), y(a)=y0 using the Runge-Kutta method of order 4.
fprintf('\n')
disp(' Solution of system of differential equations using RK4 ')
h=(b-a)/n;
x=x0;
y=y0;
disp('______________________________________________')
disp(' t x y x(t) y(t) |x-x(t)| |y-y(t)| ')
disp('______________________________________________')
fprintf('\n')
fprintf('%8.2f %10.3f %10.3f %10.3f %10.3f %8.2f %8.2f\n', a, x, y, x, y, 0, 0)
for i=1:n
    % RK of order 4
    t=a+(i-1)*h;
    k1=feval(f,t,x,y);
    c1=feval(g,t,x,y);
    k2=feval(f,t+h/2,x+h*k1/2,y+h*c1/2);
    c2=feval(g,t+h/2,x+h*k1/2,y+h*c1/2);
    k3=feval(f,t+h/2,x+h*k2/2,y+h*c2/2);
    c3=feval(g,t+h/2,x+h*k2/2,y+h*c2/2);
    k4=feval(f,t+h,x+h*k3,y+h*c3);
    c4=feval(g,t+h,x+h*k3,y+h*c3);
    x=x+h*(k1+2*k2+2*k3+k4)/6;
    y=y+h*(c1+2*c2+2*c3+c4)/6;
    %If the exact solution is not known set xs= and ys='n'.
    % For a system with two Eqns. write the exact solutions
    % if known as xs=xs(t) and ys=ys(t).
    % For a second order IVP write the exact solution
    % if known as ys=ys(t) and set xs='n'.
    t=t+h;
    xs='n';
    ys='n';
    if (xs=='n' && ys=='n')
        fprintf('%8.2f %10.3f %10.3f\n',t,x,y)
    elseif (ys~='n' && xs=='n')
        err2=abs(ys-y);
        fprintf('%8.2f %10.3f %10.3f %10.3f %10.1e\n', t,x,y,ys,err2)
    else
        err1=abs(xs-x);
        err2=abs(ys-y);
        fprintf('%8.2f %10.3f %10.3f %10.3f %10.3f %10.1e %10.1e\n', t, x, y, xs, ys, err1, err2)
    end
end