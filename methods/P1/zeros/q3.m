syms x;
f(x) = x^3-6*x^2-15*x-8;
coef = [1 -6 -15 -8];
roots(coef);
phi(x) = (2*x^2-10*x+20)/(3*x-18);
x_zero = fixed_point(phi,7.5,0.0001,10)
vpa(f(x_zero ))
