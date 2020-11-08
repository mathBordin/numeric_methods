syms x; 
f(x) = x^3-3*x^2+4;
phi(x)=2/sqrt(3-x);
xi = -2:0.001:3;
plot(xi,f(xi));
coef = [1 -3 0 4];
zero=max(roots(coef))

fixed_point(phi,1,0.1,10)