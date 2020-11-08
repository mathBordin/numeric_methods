% The following MATLAB function gaussel.m finds the solution of a
% linear system using Gaussian elimination with scaled partial
% pivoting. INPUTS are an n x n matrix A and an n x 1 coefficient
% vector b.
function x = scaled_gauss_el(Ae,be,t)
A=round_n(Ae,t);
b=round_n(be,t);
% Solve the system Ax=b using Gaussian elimination with scaled
% partial pivoting.
disp('SCALED GAUSS ELIMINATION');
n=length(b);
x=zeros(n,1);
fprintf('\n');
disp(' The augmented matrix is =')
augm =[A b]
for i=1:n
    d(i)=i;
    smax=0;
    for j=1:n
        smax=max(smax,abs(A(i,j)));
    end
    c(i)=smax;
end
for k=1:n-1
    rmax=0;
    for i=k:n
        R=round_n(abs(A(d(i),k))/c(d(i)),t);
        if (R>rmax)
            j=i;
            rmax=R;
        end
    end
    dk=d(j);
    d(j)=d(k);
    d(k)=dk;
    for i=k+1:n
        m=round_n(A(d(i),k)/A(dk,k),t);
        for j=k+1:n
            A(d(i),j)=round_n(A(d(i),j)-round_n(m*A(dk,j),t),t);
        end
        A(d(i),k)=m;
    end
end
% Perform the back substitution.
for k=1:n-1
    for i=k+1:n
        b(d(i))=round_n(b(d(i))-round_n(b(d(k))*A(d(i),k),t),t);
    end
end
x(n)=round_n(b(d(n))/A(d(n),n),t);
for i=n-1:-1:1
    S=b(d(i));
    for j=i+1:n
        S=round_n(S-round_n(A(d(i),j)*x(j),t),t);
    end
    x(i)=round_n(S/A(d(i),i),t);
end
disp('The scale vector =')
c
disp('The index vector =')
d
fprintf('\n');
disp(' The transformed upper triangular augmented matrix C is =')
fprintf('\n');
for i=1:n
    M(i,:)=A(d(i),:);
end
for i=1:n
    for j=1:n
        if (j<i)
            M(i,j)=0;
        end
    end
end
C=[M b]
fprintf('\n');
disp(' The vector solution is =')
x

end