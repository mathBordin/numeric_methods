syms x; 
f(x)=e^(x^2);
x1=-1:0.1:1;
y=double(vpa(f(x1)));
m_poly_mmq(x1,y,5,10)