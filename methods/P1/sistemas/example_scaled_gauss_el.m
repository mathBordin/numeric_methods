%%
% Exemplo de resolução de sistema com eliminação de Gauss escalada
clear; clc; close all;

%Matriz a ser decomposta
A=[1 3 -2 4;2 -3 3 -1;-1 7 -4 2;3 -1 6 2];
%Vetor de igualdades
b=[-11 6 -9 15]';

%Resolve o sistema
scaled_gauss_el(A,b,3);
