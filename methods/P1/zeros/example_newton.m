%%
%Exemplo do método de Newton
clear; close all; clc;
%Variável em que a função deve ser definida
syms x;
%Função em que se deseja achar a raíz tq. f(x)=g(x)-x=0
f(x) = x*sin(x)
%Ponto inicial
x0 = -0.3;
%Tolerância de erro almejada
eps = 0.001;
%Número máximo de iterações
N = 20;
%Cálculo da raíz pelo método da bissecção
newton(f,x0,eps,N);