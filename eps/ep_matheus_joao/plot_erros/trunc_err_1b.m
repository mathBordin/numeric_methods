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

crank_err = [0 0 1E-12 3E-12 16E-12 10E-11];
euler_err =  [0 0 1E-12 5E-12 16E-12 7.5E-11];
diff_25_err = [0.393473664065 0.102757950647 0.029099757328 0.007641627585 0.001952116036 0.000492972732];
diff_50_err = [0.784076402301 0.205372996721 0.058189020328 0.015282560505 0.003904187639 0.000985942763];

%%
% Plot
figure(1);
plot(N, crank_err, 'r', N, euler_err, 'b', N, diff_25_err, 'g', N, diff_50_err, 'm');
title('Evolução do erro de truncamento no exercício 1-b');
ylabel('Erro de truncamento');
xlabel('N (pontos de discretização da barra');
legend('Crank-Nicolson','Euler implícito','Diferenças Finitas (lambda=0.25)','Diferenças Finitas (lambda=0.50)');

figure(2);
plot(N, crank_err, 'r', N, euler_err, 'b');
title('Evolução do erro de truncamento no exercício 1-b');
ylabel('Erro de truncamento');
xlabel('N (pontos de discretização da barra');
legend('Crank-Nicolson','Euler implícito');

figure(3);
plot(N, diff_25_err, 'g', N, diff_50_err, 'm');
title('Evolução do erro absoluto no exercício 1-b');
ylabel('Erro absoluto');
xlabel('N (pontos de discretização da barra');
legend('Diferenças Finitas (lambda=0.25)','Diferenças Finitas (lambda=0.50)');