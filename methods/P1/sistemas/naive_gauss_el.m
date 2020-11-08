%The following MATLAB function ngaussel.m finds the solution of a
%linear system using naive Gaussian elimination. INPUTS are an
%nxn matrix A and an n x 1 coefficient vector b.
function x = naive_gauss_el(Ae,be,t)
% Solve the system Ax=b using naive gaussian elimination

A=round_n(Ae,t);
b=round_n(be,t);

disp('NAIVE-GAUSS ELIMINATION');
n=length(b);
x=zeros(n,1);
fprintf('\n');
disp(' The augmented matrix is');
augm =[A b]
for k=1:n-1
    for i=k+1:n
        m=round_n(A(i,k)/A(k,k),t);
        for j=k+1:n
            A(i,j)=round_n(A(i,j)-round_n(m*A(k,j),t),t);
        end
        A(i,k)=m;
        b(i)=round_n(b(i)-round_n(m*b(k),t),t);
    end
end
x(n)=round_n(b(n)/A(n,n),t);
for i=n-1:-1:1
    S=b(i);
    for j=i+1:n
        S=round_n(S-round_n(A(i,j)*x(j),t),t);
    end
    x(i)=round_n(S/A(i,i),t);
end
% Print the results
fprintf('\n');
disp(' The transformed upper triangular augmented matrix C is =');
fprintf('\n');
for i=1:n
    for j=1:n
        if (j<i) A(i,j)=0; end
    end
end

C=[A b]
fprintf('\n');
disp(' The vector solution is =')
x

end