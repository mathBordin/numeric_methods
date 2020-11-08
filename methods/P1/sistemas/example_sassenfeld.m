%%
% Exemplo de avaliação do critério de Sassenfled
clear; clc; close all;

% Matriz a ser avaliada
A = hilb(5);
% Avaliação do método de Sassenfeld
beta=sassenfeld(A,3)

fprintf('\n');
disp('--------------'); 
fprintf('\n');

% Matriz a ser avaliada
B = [7 -2 1 0 ; 1 -9 3 -1 ; 2 0 10 1 ; 1 -1 1 6];
% Avaliação do método de Sassenfeld
beta=sassenfeld(B,3)