%%
%Resolução de um sistema de EDOs pelo método de Runge-Kutta de ordem 4.
%Caso queira que o erro seja calculado, deve escrever as soluções nas
%linhas 37 e 38 do arquivo 'sys_runge_kutta_4.m'

%Definir a função f1(t,x,y) no arquivo 'f1.m' 
%Definir a função g1(t,x,y) no arquivo 'g1.m'
a = 0; %Valor inicial de t
b = 1; %Valor final de t
x0 = -1; %Condição inicial x0
y0 = 1; %Condição inicial y0
n = 10; %Número de passos
sys_runge_kutta_4('f1','g1',a,b,x0,y0,n);