%%%
% Script para visualizar os dados gerados pelo Exercício Programa 1 da
% disciplina MAP3121: Um problema inverso para obtenção da distribuição de
% Temperatura.
%
% Matheus Bordin Gomes
% João Ferreira Cysne

close all; clear; clc;

%%
% Dados
N = [10 20 40 80 160 320];

crank_err = [0.000000000116 0.000000000111 0.000000000457 0.000000002035 0.000000008224 0.000000042199];
euler_err =  [3.3E-11 8.5E-11 0.000000000327 0.000000002209 0.000000007604 0.000000043873];
diff_25_err = [998.750000000058 499.843749999884 249.980468749884 124.99755859212 62.499694823986 31.249961852096];
diff_50_err = [1994.99999999997 999.374999999942 499.921874999884 249.990234376164 124.998779296409 62.499847434927];

%%
% Plot
figure(1);
plot(N, crank_err, 'r', N, euler_err, 'b', N, diff_25_err, 'g', N, diff_50_err, 'm');
title('Evolução do erro de truncamento no exercício 1-c');
ylabel('Erro de truncamento');
xlabel('N (pontos de discretização da barra');
legend('Crank-Nicolson','Euler implícito','Diferenças Finitas (lambda=0.25)','Diferenças Finitas (lambda=0.50)');

figure(2);
plot(N, crank_err, 'r', N, euler_err, 'b');
title('Evolução do erro de truncamento no exercício 1-c');
ylabel('Erro de truncamento');
xlabel('N (pontos de discretização da barra');
legend('Crank-Nicolson','Euler implícito');