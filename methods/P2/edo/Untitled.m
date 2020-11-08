%%
% Resolução da equação diferencial ordinária y'=f(t,y) pelo Método de
% Runge-Kutta de ordem 2 ou 4.Caso queira que o erro seja calculado, deve escrever a solução na
% na linha 26 ou 50 do arquivo 'edo_runge_kutta_2_4.m'
syms t y;
%Definição da função f(t,y)
f(t,y)=y*t^(-2);
%Resolução da EDO
a = 3/8; %Valor inicial de t
b = 7/8; %Valor final de t
y0 = -7/4; %Condição inicial y0
n = 2; %Número de passos
order = 2; %Ordem (deve ser 2 ou 4)
edo_runge_kutta_2_4(f,a,b,y0,n,order)