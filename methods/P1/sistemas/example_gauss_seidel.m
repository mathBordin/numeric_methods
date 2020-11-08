%%
% Exemplo de resolução de sistema com Gauss-Seidel
clear; clc; close all;

% Matriz a ser decomposta
A = [7 -2 1 0 ; 1 -9 3 -1 ; 2 0 10 1 ; 1 -1 1 6];
%Vetor de igualdades
b = [17 13 15 10]';
%Aproximação inicial
x0=[0 0 0 0]';
%Tolerência de erro na aproximação
eps = 10^(-3);
%Máximo número de iterações
N = 20;
%Resolve o sistema
gauss_seidel(A,b,x0,eps,N,3)
