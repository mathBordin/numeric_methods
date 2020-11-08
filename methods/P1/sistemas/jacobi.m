%The following MATLAB function jacobi.m finds the solution of a
%linear system using the Jacobi iteration method. INPUTS are an n x
%n matrix A; an n x 1 coefficient vector b; an initial vector x0; a
%tolerance tol; the maximum number of iterations itmax.
function x = jacobi(Ae,be,x0e,tol,itmax,t)

A=round_n(Ae,t);
b=round_n(be,t);
x0=round_n(x0e,t);

% Solve the system Ax=b using the Jacobi iteration method.
n=length(b);
x=zeros(n,1);
fprintf('\n');
disp('JACOBI METHOD');
fprintf('\n');
disp(' The augmented matrix is =');
Augm=[A b]
Y=zeros(n,1);
Y=x0;
for k=1:itmax+1
    for i=1:n
        S=0;
        for j=1:n
            if (j~=i)
                S=round_n(S+round_n(A(i,j)*x0(j),t),t);
            end
        end
        if(A(i,i)==0)
            break
        end
        x(i)=round_n(round_n((-S+b(i)),t)/A(i,i),t);
    end
    err=round_n(abs(norm(x-x0)),t);
    rerr=round_n(err/(norm(x)+eps),t);
    x0=x;
    Y=[Y x];
    if(rerr<tol)
        break
    end
end
% Print the results
if(A(i,i)==0)
    disp(' division by zero');
elseif (k==itmax+1)
    disp(' No convergence');
else
fprintf('\n');
disp(' The solution vectors are:')
fprintf('\n');
disp('iter # 0 1 2 3 4 ...');
fprintf('\n');
for i=1:n
    fprintf('x%1.0f = ',i);
    fprintf('%10.6f',Y(i,[1:k+1])); %#ok<NBRAK>
    fprintf('\n');
end
fprintf('\n');
disp(['The method converges after ',num2str(k),' iterations to']);
x
end