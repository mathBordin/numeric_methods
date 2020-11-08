%%%
% Script para visualizar os dados gerados pelo Exerc�cio Programa 1 da
% disciplina MAP3121: Um problema inverso para obten��o da distribui��o de
% Temperatura.
%
% Matheus Bordin Gomes
% Jo�o Ferreira Cysne

close all; clear; clc;

% L� arquivo de dados e salva na matriz U
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
title('Evolu��o da temperatura da barra de t = 0.0 a t = 0.4 ');
xlabel('Posi��o da barra normalizada entre 0 e 1');
ylabel('Temperatura na barra');
legend('t=0.0','t=0.1','t=0.2','t=0.3','t=0.4');

figure(2);
for k = 6:11
    hold on;
    plot(n,U(k,:));
end
title('Evolu��o da temperatura da barra de t = 0.5 a t = 1.0');
xlabel('Posi��o da barra normalizada entre 0 e 1');
ylabel('Temperatura na barra');
legend('t=0.5','t=0.6','t=0.7','t=0.8','t=0.9','t=1.0');
