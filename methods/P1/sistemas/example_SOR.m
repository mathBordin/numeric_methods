%%%%%%%%%%%%%%%%%%%%%%%%%% Entrada %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% A a matriz A do sistema:
A = [5 1 1; 3 4 1; 3 3 6];
% b o vetor coluna dos termos independentes:
b = [5; 6; 0];
% X0 a solução inicial:
X0 = [1; 1; -1];
% eps se abs(X(k)-X(k-1))< eps
tol = 0.01;
% max número máximo de iterações:
max = 20;
% w inicial:
w = 0.9;
[X delta Z] = SOR(A,b,X0,tol,max,w);