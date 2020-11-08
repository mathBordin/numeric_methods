% The following MATLAB function edo_runge_kutta_2_4.m finds the solution of the
% initial-value problem 11.2 using the Rung e -Kutta methods. INPUTS
% are a function f(t,y); the initial and final values a, b of t; the initial
% condition y0; the number of steps n; the RK order 2 or 4.
function edo_runge_kutta_2_4(f,a,b,y0,n,order)
% solve the initial-value problem y'=f(t,y), y(a)=y0
% using the Runge-Kutta methods.
syms t y;
fprintf('\n')
disp([' Runge-Kutta method of order = ',num2str(order)])
h=(b-a)/n;
yc=y0;
if (order==2)
    disp('_____________________________________________')
    disp(' t k1 k2 y Exact error ')
    disp('_____________________________________________')
    fprintf('\n')
    fprintf('%6.2f ---- ---- %12.6f %12.6f %4.2f\n',a,yc,yc,0)
    for i=1:n
        tc=a+(i-1)*h;
        k1=f(tc,yc);
        k2=f(tc+h,yc+h*k1);
        yc=yc+h*(k1+k2)/2;
        tc=tc+h;
        % Enter the exact solution if known as g=g(t) otherwise set g='n'.
        g='n';
        if (g~='n')
            err=abs(g-yc);
            fprintf('%6.2f %12.6f %12.6f %12.6f %12.6f %8.2e\n',tc,k1,k2,yc, g, err)
        else
            fprintf('%6.2f %12.6f %12.6f %12.6f\n',tc,k1,k2,yc)
        end
    end
end
if (order==4)
    disp('_______________________________________________')
    disp(' t k1 k2 k3 k4 y Exact error ')
    disp('_______________________________________________')
    fprintf('\n')
    fprintf('%6.2f ---- ---- ---- ---- %12.6f %12.6f %4.2f\n',a,yc,yc,0)
    for i=1:n
        tc=a+(i-1)*h;
        k1=f(tc,yc);
        k2=f(tc+h/2,yc+h*k1/2);
        k3=f(tc+h/2,yc+h*k2/2);
        k4=f(tc+h,yc+h*k3);
        yc=yc+h*(k1+2*k2+2*k3+k4)/6;
        tc=tc+h;
        % Enter the exact solution if known as g=g(t) otherwise set g='n'.
        g='n';
        if (g~='n')
            err=abs(g-yc);
            fprintf('%6.2f %12.6f %12.6f %12.6f %12.6f %12.6f %12.6f %8.2e\n', tc, k1, k2, k3, k4, yc, g, err)
        else
            fprintf('%6.2f %12.6f %12.6f %12.6f %12.6f %12.20f\n',tc,k1,k2,k3, k4, yc)
        end
    end
end