%%
% Exemplo de resolução de sistema com eliminação de Neive-Gauss
clear; clc; close all;

%Matriz a ser decomposta
A=[1 1 1 1;2 3 1 5;-1 1 -5 3;3 1 7 -2];
%Vetor de igualdades
b=[10 31 -2 18]';

%Resolve o sistema
naive_gauss_el(A,b,3);
