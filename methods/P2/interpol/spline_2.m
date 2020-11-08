% The following MATLAB function spline_2.m finds a quadratic spline that
% interpolates a table of values. INPUTS are a table of function values
% x and y; the number of intermediate points m at which S(x) is to be
% approximated.
function spline_2(x,y,m)
% Quadratic Spline
n=length(x);
% arbitary value for d1
d(1)=0;
for i=1:n-1
    d(i+1) = -d(i)+2* ((y(i+1)-y(i)) / (x(i+1)-x(i)) );
    t(i)=(x(i+1)-x(i))/(m+1);
end
disp(' Quadratic Spline ')
disp('____________________________')
disp(' x Q(x) ')
disp('____________________________')
for j=1:n-1
    r=(x(j):t(j):x(j+1)-t(j));
    for k=1:m+1
        r(k);
        spl2=y(j)+ d(j)*(r(k)-x(j))+((d(j+1)-d(j))/(2*(x(j+1)-x(j))))*(r(k)-x(j))^2;
        fprintf('%12.5f %17.5f \n',r(k),spl2);
    end
end
spl2=y(n);
fprintf('%12.5f %17.5f \n',x(n),spl2);