%%
%Example m-polynomial MMQ
clear; clc; close all;

%X data
x=[0:0.5:2.5];%#ok<NBRAK>
%Y data
y=[0 0.2 0.27 0.3 0.32 0.33];
%Polynomial ord
m = 3;
%Polynomial mmq
m_poly_mmq(x,y,m,3);
