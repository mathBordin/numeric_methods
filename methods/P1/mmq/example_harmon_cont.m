%%
%Analise harmonica continua
clear; clc; close all;

syms x;
%Function that you want to approximate
f(x) = cos(3*x)+sin(2*x)+2*cos(x)-2+sin(5*x);
%Number of coefficients
N = 5;
%Interval 
L = pi;
%Análise harmonica
harmon_cont(f,N,L);