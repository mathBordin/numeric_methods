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

crank_err = [0 0 0 0 0 0];
euler_err = [0 0 0 0 0 0];
diff_25_err = [0.003674870452 0.000924181967 0.000231363203 0.000057861344 0.000014466606 0.000003616731];
diff_50_err = [0.007349771409 0.001848366156 0.000462726541 0.000115722697 0.000028933212 0.000007233462];

%%
% Plot
figure(1);
plot(N, crank_err, 'r', N, euler_err, 'b', N, diff_25_err, 'g', N, diff_50_err, 'm');
title('Evolução do erro absoluto no exercício 1-a (teste)');
ylabel('Erro absoluto');
xlabel('N (pontos de discretização da barra');
legend('Crank-Nicolson','Euler implícito','Diferenças Finitas (lambda=0.25)','Diferenças Finitas (lambda=0.50)');

figure(2);
plot(N, diff_25_err, 'g', N, diff_50_err, 'm');
title('Evolução do erro absoluto no exercício 1-a (teste)');
ylabel('Erro absoluto');
xlabel('N (pontos de discretização da barra');
legend('Diferenças Finitas (lambda=0.25)','Diferenças Finitas (lambda=0.50)');