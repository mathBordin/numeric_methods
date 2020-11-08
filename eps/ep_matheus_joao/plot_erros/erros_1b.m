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

crank_err = [0.04777943808 0.011990054058 0.002992679792 0.000748755199 0.000187170604 0.000046791514];
euler_err = [0.044967731395 0.009371453936 0.006275526447 0.003609325826 0.001929231812 0.000996756666];
diff_25_err = [0.06769565226 0.016952861127 0.004226916766 0.001056958917 0.000264196197 0.000066047554];
diff_50_err = [0.085810832265 0.021494066145 0.005355065812 0.001338043505 0.000334498701 0.000083620215];

%%
% Plot
figure(1);
plot(N, crank_err, 'r', N, euler_err, 'b', N, diff_25_err, 'g', N, diff_50_err, 'm');
title('Evolução do erro absoluto no exercício 1-b');
ylabel('Erro absoluto');
xlabel('N (pontos de discretização da barra');
legend('Crank-Nicolson','Euler implícitoo','Diferenças Finitas (lambda=0.25)','Diferenças Finitas (lambda=0.50)');

figure(2);
plot(N, diff_25_err, 'g', N, diff_50_err, 'm');
title('Evolução do erro absoluto no exercício 1-b');
ylabel('Erro absoluto');
xlabel('N (pontos de discretização da barra');
legend('Diferenças Finitas (lambda=0.25)','Diferenças Finitas (lambda=0.50)');