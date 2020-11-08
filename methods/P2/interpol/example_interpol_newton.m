%%
%Exemplo de interpolação utilizando o Método de Newton

x=[2.35 2.36 2.38 2.39]';
%Valores de y
y=1./((43/21).*x+(18/13));
%Interpolação dos valores
interpol_newton(x,y)