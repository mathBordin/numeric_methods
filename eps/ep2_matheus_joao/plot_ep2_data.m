%%%
% Script para plotar os dados gerados pelo Exercício Programa 2 da
% disciplina MAP3121: Um problema inverso para a equaçao do calor.
%
% Matheus Bordin Gomes
% João Ferreira Cysne

close all; clear; clc;

% Lê arquivo de dados e salva na matriz U
filename = 'dados_ep2.txt';
delimiterIn = ' ';
headerlinesIn = 0;
U = importdata(filename, delimiterIn, headerlinesIn);
[N, ~] = size(U);

delta_x = 1/(N-1);
n = ((0:(N-1))*delta_x)';

% Plota tanto os dados de u_T(x) definido, quanto os dados de u_T(x)
% obtidos com o programa desenvolvido.
figure(1);
plot(n, U(:,1),n, U(:,2));
title('u_T(x)');
xlabel('Posição da barra normalizada entre 0 e 1');
ylabel('Temperatura na barra');
legend('Solução definida','Solução aproximada');