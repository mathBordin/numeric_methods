%%
%Example linear MMQ
clear; clc; close all;

%X data
x=[1:0.5:4];
%Y data
y=[25 31 27 28 36 35 32];
%Linear mmq
linear_mmq(x,y,3);