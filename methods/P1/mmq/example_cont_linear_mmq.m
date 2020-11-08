%%
%Example linear MMQ
clear; clc; close all;

syms x;

%Function
f(x)=x^2+2;
%Interval
a = 0;
b = 1;
%Linear mmq
cont_linear_mmq(f, a, b);