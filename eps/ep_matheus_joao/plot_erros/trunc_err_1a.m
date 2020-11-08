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

diff_25_err = [0.020533322986 0.00759069248 0.002244793942 0.000607375384 0.000157799511 0.000040206104];
diff_50_err = [0.041324133377 0.015210737519 0.004491838093 0.001214904206 0.000315609008 0.000080412845];

%%
% Plot
figure(1);
plot(N, diff_25_err, 'g', N, diff_50_err, 'm');
title('Evolução do erro de truncamento no exercício 1-a');
ylabel('Erro de truncamento');
xlabel('N (pontos de discretização da barra');
legend('Diferenças Finitas (lambda=0.25)','Diferenças Finitas (lambda=0.50)');