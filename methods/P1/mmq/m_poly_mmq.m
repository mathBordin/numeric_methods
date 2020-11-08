%The following MATLAB function polylsqr.m constructs a least
%squares polynomial of degree m that best fits a table of x and y
%values. INPUTS are x and y row vectors and the degree m of the
%polynomial.
function m_poly_mmq(xe,ye,m,t)
% Construct the least squares polynomial of degree m
% that fits x and y row or column vectors.

x = round_n(xe, t);
y = round_n(ye, t);

disp('Mth POLYNOMIAL MMQ');
n=length(x);
n=length(y);
for k=1:2*m+1
    c(k)=round_n(sum(x.^(k-1)),t);
end
%Find the coefficient vector b of normal equations
for k=1:m+1
    b(k)=round_n(sum(y.*x.^(k-1)),t);
end
% Find the coefficient matrix A of normal equations
for i=1:m+1
    for j=1:m+1
        A(i,j)=round_n(c(j+i-1),t);
    end
end
fprintf('\n');
disp(' The Augmented Matrix of the normal equations, [A b] =');
fprintf('\n');
disp([A b']);
z=round_n(A\b',t);
disp('The coeff. a0,...,an of the least squares polynomial are ');
fprintf('\n');
disp(z');
% Evaluate the polynomial at xi, i=1,..,n.
disp('_____________________________________________');
disp(' xi yi p(xi) |yi-p(xi)| ');
disp('_____________________________________________');
for i=1:n
    s=z(1);
    for k=2:m+1
        s=round_n(s+round_n(z(k)*round_n(x(i)^(k-1),t),t),t);
    end
    p(i)=s;
    err(i)=round_n(abs(y(i)-p(i)),t);
    fprintf('%6.2f %6.2f %12.6f %12.6f\n',x(i),y(i),p(i),err(i));
end
err=round_n(sum(err.*err),t);
fprintf('\n E(a0,...,an) =%12.6g\n',round_n(sum(err),t))
[x' y' p']

end