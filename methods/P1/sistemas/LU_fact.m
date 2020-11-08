%The following MATLAB function lufact.m finds the solution of a
%linear system using Crout's LU decomposition. INPUTS are an
%n x n matrix A and an n x 1 coefficient vector b.
function [x, L, U] = LU_fact(Ae,be,t)
% Solve the system Ax=b using the LU decomposition.

A=round_n(Ae,t);
b=round_n(be,t);

disp('LU FACTORATION');
n=length(b);
y=zeros(n,1);
x=zeros(n,1);
fprintf('\n');
for i=1:n
    U(i,i)=1;
end
L(1,1)=round_n(A(1,1)/U(1,1),t);
for j=2:n
    L(j,1)=round_n(A(j,1)/U(1,1),t);
    U(1,j)=round_n(A(1,j)/L(1,1),t);
end
for i=2:n-1
    S=0;
    for k=1:i-1
        S=round_n(S+round_n(U(k,i)*L(i,k),t),t);
    end
    L(i,i)=round_n(round_n((A(i,i)-S),t)/U(i,i),t);
    for j=i+1:n
        S=0;
        for k=1:i-1
            S=round_n(S+round_n(U(k,i)*L(j,k),t),t);
        end
        L(j,i)=round_n(round_n((A(j,i)-S),t)/U(i,i),t);
        S=0;
        for k=1:i-1
            S=round_n(S+round_n(U(k,j)*L(i,k),t),t);
        end
        U(i,j)=round_n((A(i,j)-S),t)/round_n(L(i,i),t);
    end
end
S=0;
for k=1:n-1
    S=round_n(S+round_n(U(k,n)*L(n,k),t),t);
end
L(n,n)=round_n(round_n((A(n,n)-S),t)/U(n,n),t);
% Perform the forward substitution.
y(1)=b(1)/L(1,1);
for i=2:n
    S=b(i);
    for j=1:i-1
        S=round_n(S-round_n(L(i,j)*y(j),t),t);
    end
    y(i)=round_n(S/L(i,i),t);
end
% Perform the back substitution.
x(n)=y(n)/U(n,n);
for i=n-1:-1:1
    S=y(i);
    for j=i+1:n
        S=round_n(S-round_n(U(i,j)*x(j),t),t);
    end
    x(i)=round_n(S/U(i,i),t);
end
L
disp(' The forward substitution gives')
y
U
disp(' The vector solution is =')
x

end