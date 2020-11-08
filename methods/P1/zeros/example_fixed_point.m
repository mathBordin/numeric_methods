%%
%Exemplo do método do ponto fixo
clear; close all; clc;
%Variável em que a função deve ser definida
syms x;
%Função em que se deseja achar a raíz tq. f(x)=g(x)-x=0
g(x) = (5/(x^2))+2; 
%Ponto inicial
x0 = 2.5;
%Tolerância de erro almejada
eps = 0.001;
%Número máximo de iterações
N = 20;
%Cálculo da raíz pelo método da bissecção
fixed_point(g,x0,eps,N);