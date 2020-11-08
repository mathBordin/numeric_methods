%%
% Exemplo de resolução de sistema com decomposição LU (Ax = b)
clear; clc; close all;

%Matriz a ser decomposta
A = [2 -1 2 ; 2 -3 3 ; 6 -1 8];
%Vetor de igualdades
b = [-2 -5 0]';

%Resolve o sistema
LU_fact(A,b,2);
