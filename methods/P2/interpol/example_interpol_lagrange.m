%%
%Exemplo de interpolação utilizando o Método de Lagrange

%Valores de x
x=[1 2 3 4 5]';
%Valores de y
y=x.^3-2*x.^2+x-3;
%Interpolação dos valores
interpol_lagrange(x,y,-0.5);