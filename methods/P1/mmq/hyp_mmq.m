%The following MATLAB function hyplsqr.m constructs a least
%squares hyperbolic y = a + b/x that best fits a table of x and y
%values. INPUTS are x and y row vectors.
function hyp_mmq(x,y)
% Construct the least square hyperbolic y=a+b/x
% that fits x and y row or column vectors.
disp('HYPERBOLIC MMQ');
n=length(x);
n=length(y);
z=ones(size(x));
z=z./x;
sumz=sum(z);
sumy=sum(y);
sumz2=sum(z.*z);
sumzy=sum(z.*y);
b=(n*sumzy-sumz*sumy)/(n*sumz2-sumz^2);
a=(sumz2*sumy-sumzy*sumz)/(n*sumz2-sumz^2);
disp(' hyperbolic least squares');
fprintf('\n a =%12.6f\n',a);
fprintf(' b =%12.6f\n',b);
disp('_____________________________________________');
disp(' x y 1/xi a+b/x |y-(a+b/xi)| ');
disp('_____________________________________________');
for i=1:n
    yh=a+b/x(i);
    err(i)=abs(yh-y(i));
    fprintf('%6.2f %6.2f %6.2f %12.6f %12.6f\n',x(i),y(i),z(i),yh,err(i));
end

end