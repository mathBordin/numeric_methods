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

crank_err = [0 0 1E-12 3E-12 9E-12 5E-11];
euler_err = [0 0 0 2E-12 9E-12 5.2E-11];
diff_25_err = [0.085 0.023125 0.006015625 0.001533203125 0.000386962891 0.000097198486];
diff_50_err = [0.17 0.04625 0.01203125 0.00306640625 0.000773925781 0.000194396973];

%%
% Plot
figure(1);
plot(N, crank_err, 'r', N, euler_err, 'b', N, diff_25_err, 'g', N, diff_50_err, 'm');
title('Evolução do erro de truncamento no exercício 1-a (teste)');
ylabel('Erro de truncamento');
xlabel('N (pontos de discretização da barra');
legend('Crank-Nicolson','Euler implícito','Diferenças Finitas (lambda=0.25)','Diferenças Finitas (lambda=0.50)');

figure(2);
plot(N, crank_err, 'r', N, euler_err, 'b');
title('Evolução do erro de truncamento no exercício 1-a (teste)');
ylabel('Erro de truncamento');
xlabel('N (pontos de discretização da barra');
legend('Crank-Nicolson','Euler implícito');

figure(3);
plot(N, diff_25_err, 'g', N, diff_50_err, 'm');
title('Evolução do erro absoluto no exercício 1-a (teste)');
ylabel('Erro absoluto');
xlabel('N (pontos de discretização da barra');
legend('Diferenças Finitas (lambda=0.25)','Diferenças Finitas (lambda=0.50)');