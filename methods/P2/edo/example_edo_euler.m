%%
% Resolução da equação diferencial ordinária y'=f(t,y) pelo Método de
% Euler. Caso queira que o erro seja calculado, deve escrever a solução na
% na linha 24 do arquivo 'edo_euler.m'
syms t y;
%Definição da função f(t,y)
f(t,y)=2*t-y;
%Resolução da EDO
a = 0; %Valor inicial de t
b = 1; %Valor final de t
y0 = -1; %Condição inicial y0
n = 10; %Número de passos
edo_euler(f,a,b,y0,n)
