%The following MATLAB function seidel.m finds the solution of a
%linear system using Gauss-Seidel iteration method. INPUTS are an
%n x n matrix A; an n x 1 coefficient vector b; an initial vector x0; a
%tolerance tol; the maximum number of iterations itmax.
function x = gauss_seidel(Ae,be,x0e,tol,itmax,t)

A=round_n(Ae,t);
b=round_n(be,t);
x0=round_n(x0e,t);

% Solve the system Ax=b using Gauss-Seidel iteration method.
disp('GAUSS-SEIDEL')
n=length(b);
x=zeros(n,1);
fprintf('\n');
disp(' The augmented matrix is =')
Augm=[A b]
Y=zeros(n,1);
Y=x0;
for k=1:itmax+1
    for i=1:n
        S=0;
        for j=1:i-1
            S=round_n(S+round_n(A(i,j)*x(j),n),n);
        end
        for j=i+1:n
            S=S+round_n(A(i,j)*x0(j),n);
        end
        if(A(i,i)==0)
            break
        end
        x(i)=round_n((-S+b(i)),t)/round_n(A(i,i),t);
    end
    err=abs(round_n(norm(round_n(x-x0,t)),t));
    rerr=round_n(err/round_n((norm(x)+eps),t),t);
    x0=x;
    Y=[Y x];
    if(rerr<tol)
        break
    end
end
% Print the results
if(A(i,i)==0)
    disp(' division by zero')
elseif (k==itmax+1)
    disp(' No convergence')
else
fprintf('\n');
disp(' The solution vectors are:')
fprintf('\n');
disp('iter # 0 1 2 3 4 ...')
fprintf('\n');
for i=1:n
    fprintf('x%1.0f = ',i)
    fprintf('%10.6f',Y(i,[1:k+1]))
    fprintf('\n');
end
fprintf('\n');
disp(['The method converges after ',num2str(k),' iterations to']);
x
end