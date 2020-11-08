%%%
% Script para visualizar os dados gerados pelo Exercício Programa 1 da
% disciplina MAP3121: Um problema inverso para obtenção da distribuição de
% Temperatura.
%
% Matheus Bordin Gomes
% João Ferreira Cysne

close all; clear; clc;

% Lê arquivo de dados e salva na matriz U
filename = 'dados_ep.txt';
delimiterIn = ' ';
headerlinesIn = 0;
U = importdata(filename, delimiterIn, headerlinesIn);
[M, N] = size(U);

delta_x = 1/(N-1);
n = (0:(N-1))*delta_x;

% Plota os dados
figure(1);
for k = 1:5
    hold on;
    plot(n,U(k,:));
end
title('Evolução da temperatura da barra de t = 0.0 a t = 0.4 ');
xlabel('Posição da barra normalizada entre 0 e 1');
ylabel('Temperatura na barra');
legend('t=0.0','t=0.1','t=0.2','t=0.3','t=0.4');

figure(2);
for k = 6:11
    hold on;
    plot(n,U(k,:));
end
title('Evolução da temperatura da barra de t = 0.5 a t = 1.0');
xlabel('Posição da barra normalizada entre 0 e 1');
ylabel('Temperatura na barra');
legend('t=0.5','t=0.6','t=0.7','t=0.8','t=0.9','t=1.0');
