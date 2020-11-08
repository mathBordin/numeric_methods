%The following MATLAB function linlsqr.m constructs a least
%squares line y = ax + b that best fits a table of x and y values.
%INPUTS are x and y row vectors.
function cont_linear_mmq(f, a, b)
% Construct a least square line y=ax+b
% that fits x and y row or column vectors.

disp('LINEAR MMQ');

syms x;

g0 = 1;
g1(x) = x;

g0_g0 = vpaintegral(g0*g0,x,a,b);
g1_g1 = vpaintegral(g1*g1(x),x,[a b]);
g0_g1 = vpaintegral(g0*g1(x),x,[a b]);
f_g0 = vpaintegral(f(x)*g0,x,[a b]);
f_g1 = vpaintegral(f(x)*g1,x,[a b]);

A = [g0_g0 g0_g1 ; g0_g1 g1_g1];
bs = [f_g0 f_g1]';

coef = linsolve(A,bs);
ag = coef(2);
bg = coef(1);

g(x) = bg+ag*x;

disp(' linear least squares');
fprintf('\n a =%12.6f\n',ag);
fprintf(' b =%12.6f\n',bg);
disp('______________________________________________');
disp(' x y a*x+b |y-(ax+b)| ');
disp('______________________________________________');
xi = a:0.1:b;
yi = f(xi);
gi = g(xi);
n = length(xi);
for i=1:n
    err(i)=abs(gi(i)-yi(i));
    fprintf('%6.2f %6.2f %12.6f %12.6f\n',xi(1,i),yi(1,i),gi(1,i),err(1,i));
end
err=sum(err.*err);
fprintf('\n E(a,b) =%12.6f\n',sum(err));

end