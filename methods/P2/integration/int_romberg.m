% The following MATLAB function int_romberg.m computes the definite
% integral 10.1 using the Romberg integration method. INPUTS are a
% function f; the values a and b; the number of rows n. 
function int_romberg(f,a,b,n)
% Compute the integral of f on [a,b] using the Romberg integration.
syms x;
fprintf('\n')
disp(' Romberg table')
disp('_______________________________________________')
disp(' i h Ri,1 Ri,2 Ri,3 ... ')
disp('_______________________________________________')
h=b-a;
R(1,1)=h*(f(a)+f(b))/2;
fprintf('%2.0f %8.4f %12.4f\n',1,h,R(1,1));
m=1;
for i=1:n-1
    h=h/2;
    S=0;
    for j=1:m
        w=a+h*(2*j-1);
        S=S+f(w);
    end
    R(i+1,1)=R(i,1)/2+h*S;
    fprintf('%2.0f %8.4f %12.4f',i+1,h,R(i+1,1));
    m=2*m;
    for k=1:i
        R(i+1,k+1)=R(i+1,k)+(R(i+1,k)-R(i,k))/(4^k-1);
        fprintf('%12.4f',R(i+1,k+1));
    end
    fprintf('\n');
end