%%
%Exemplo de interpolação utilizando splines de ordem 2

%Tabela com os valores de x
x=0:0.2:1;
x = x';
%Tabela com os valores de y
y=x.^3+2;
%Interpolação dos valores
spline_2(x,y,2)