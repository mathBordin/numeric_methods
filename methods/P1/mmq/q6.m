syms x;
syms a(x) b(x) c(x) d(x) e(x)
a(x) = x^2+(2/3)*x-(43/30);
b(x) = (10/11)*x-(251/100);
c(x) = (2/3)*x^2-(7/3)*x+(9/10);
d(x) = (15/11)*x^2+x+(9/10);
e(x) = (15/11)*x+(9/10);

EQ_a(x) = ((9/10)+((2/3)*x-(7/3))^(1/5)-a(x))^2;
EQ_b(x) = ((9/10)+((2/3)*x-(7/3))^(1/5)-b(x))^2;
EQ_c(x) = ((9/10)+((2/3)*x-(7/3))^(1/5)-c(x))^2;
EQ_d(x) = ((9/10)+((2/3)*x-(7/3))^(1/5)-d(x))^2;
EQ_e(x) = ((9/10)+((2/3)*x-(7/3))^(1/5)-e(x))^2;

a = 2;
b = 5;

EQs = [vpaintegral(EQ_a,x,a,b) vpaintegral(EQ_b,x,a,b) vpaintegral(EQ_c,x,a,b) vpaintegral(EQ_d,x,a,b) vpaintegral(EQ_e,x,a,b)];
min_eq = find(EQs == min(EQs))