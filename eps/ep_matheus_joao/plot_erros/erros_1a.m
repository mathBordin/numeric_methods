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

crank_err = [0.00645311381 0.001568606604 0.000389339298 0.000097159295 0.000024278856 0.000006069029];
euler_err = [0.002078825408 0.001495879335 0.000878523015 0.000473698255 0.000245657229 0.000125053517];
diff_25_err = [0.001691344373 0.000427280687 0.000107097393 0.000026791666 0.000006698999 0.000001674817];
diff_50_err = [0.000810135075 0.000210666767 0.00005317088 0.000013351388 0.000003339744 0.000000835055];

%%
% Plot
figure(1);
plot(N, crank_err, 'r', N, euler_err, 'b', N, diff_25_err, 'g', N, diff_50_err, 'm');
title('Evolução do erro absoluto no exercício 1-a');
ylabel('Erro absoluto');
xlabel('N (pontos de discretização da barra');
legend('Crank-Nicolson','Euler implícitoo','Diferenças Finitas (lambda=0.25)','Diferenças Finitas (lambda=0.50)');

figure(2);
plot(N, diff_25_err, 'g', N, diff_50_err, 'm');
title('Evolução do erro absoluto no exercício 1-a');
ylabel('Erro absoluto');
xlabel('N (pontos de discretização da barra');
legend('Diferenças Finitas (lambda=0.25)','Diferenças Finitas (lambda=0.50)');


