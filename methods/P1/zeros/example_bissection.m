%%
%Exemplo do método da bissecçãod
clear; close all; clc;
%Variável em que a função deve ser definida
syms x;
%Função em que se deseja achar a raíz
%f(x) = x^2-4*x+cos(x);
 f(x) = sin(x) ;
%Intervalo de interesse
a = -1.0; 
b = 1.0;
%Tolerância de erro almejada
eps = 0.001;
%Cálculo da raíz pelo método da bissecção
bissection(f, a, b, eps)