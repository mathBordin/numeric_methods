%%
%Cálcula a integral de f(x) utilizando o Método dos Trapézios
syms x;
%Definição da função f(x)
f(x)=7+14*x^6;
%Cálculo da integral
a = 0;
b = 1;
n = 5;
int_trapez(f,a,b,n)
%Comparação com a função do matlab
exact = vpaintegral(f,a,b) %#ok<*NOPTS>