%%
%Analise harmonica continua
clear; clc; close all;

%Interval xj = (pi/N)*j, j = 1,...,2N
a = 1;
b = 10;
x=(pi/5).*(a:1:b); 
%Função
y = 0.2+0.62*cos(x)+4*sin(x)+5.5*sin(2*x)+4.5*cos(3*x);

%Análise harmonica
[a0,a,b] = harmon(y);