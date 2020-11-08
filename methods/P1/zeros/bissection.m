% The following MATLAB function bisect.m finds the solution of an
% equation using the Bisection method. INPUTS are a function f(x);
% the endpoints a and b; a tolerance tol; 
function x_zero = bissection(f,a,b,tol)
% Bisection method for solving the nonlinear equation f(x)=0.

syms x;
x_zero = NaN;
  
n = ceil(log((b-a)/tol)/log(2)-1);
a0=a; b0=b;
iter=0;
u=f(a);
v=f(b);
c=(a+b)*0.5;
err=abs(b-a)*0.5;
disp('BISSECTION METHOD');
fprintf('Required number of interations for eps (N) = %2.0f\n', n);
disp('_______________________________________________');
disp(' iter a b c f(c) |b-a|/2 ');
disp('_______________________________________________');
fprintf('\n');
if (u*v<=0)
    w = NaN;
    while (err>tol)&&(iter<=n)&&(w~=0)
        w=f(c);
        fprintf('%2.0f %10.4f %10.4f %12.6f %10.6f %10.6f\n', iter, a, b, c, w, err);
        if (w*u<0)
            b=c;
            v=w;
        end
        if (w*u>0)
            a=c;u=w;
        end
        iter=iter+1;
        c=(a+b)*0.5;
        err=abs(b-a)*0.5;
    end
    if (iter>n)
        disp(' Method failed to converge');
    else
        % Plot f(x) in the interval [a,b].
        divisions = (b0-a0)/200;
        y = f(a0:divisions:b0);
        x = a0:divisions:b0;
        figure;
        plot(x,y,'b',c,f(c),'r*');
        title('Função f(x) no intervalo I');
        xlabel('X');
        ylabel('f(x)');
        grid
        x_zero = c;
    end
    
else
    disp(' The method cannot be applied f(a)f(b)>0');
end
end