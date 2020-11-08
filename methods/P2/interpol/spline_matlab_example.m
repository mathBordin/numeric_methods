%%
%Exemplo de interpolação utilizando a função spline do matlab

%Tabela com os valores de x
x = [0 10 20 30 40 50 60 70 80];
%Tabela com os valores de y
y = [100 118 125 136 114 105 98 104 92];
%Pontos em que a função será interpolada 
x_i = 0 : 1 : 80;
%Cálculo dos valores interpolados
y_i = spline(x,y,x_i);
%Plot dos valores originais e da função interpolada
plot(x,y,'o',x_i,y_i)