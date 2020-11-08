function [X delta Z] = SOR(A,b,X0,tol,max,w)
%----------------------------Comentário-----------------------------------
% Implementa o método iterativo de SOR para determinar
%uma solução aproximada de Ax=b
%%%%%%%%%%%%%%%%%%%%%%%%%% Executar %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% [X,delta] = sor(A,b,X0,tol,max,w)
%%%%%%%%%%%%%%%%%%%%%%%%%%%% Gera %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% X o vetor com a solução
% delta a norma do vetor abs(X(k)-X(k-1))
% Z Matrix com todas as soluções (uma por linha)
%--------------------------------------------------------------------------
n = length(b);
Xant = X0; % inicializa Xant
X=X0; % inicializa X
Z = X0'; % inicializa Z
for k=1:max % iterar até max vezes
    for j = 1:n % para cada equação
        if j==1
            Sum = b(1) - A(1,2:n)*Xant(2:n);
        elseif j==n
            Sum = b(n) - A(n,1:n-1)*X(1:n-1);
        else
            Sum = b(j)-A(j,1:j-1)*X(1:j-1)-A(j,j+1:n)*Xant(j+1:n);
        end
            X(j) =(1-w)*X(j)+(w/A(j,j))*Sum;
            % X(j) = Sum/A(j,j);
    end
    Z = [Z;X']; % armazena a história
    delta = norm(abs(X-Xant),1);
    if (delta<eps) 
        break;
    end
    Xant = X % iteração anterior
end