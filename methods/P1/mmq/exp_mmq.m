%The following MATLAB function explsqr.m constructs a least
%squares exponential y = a*e^bx that best fits a table of x and y values.
%INPUTS are x and y row vectors.
function exp_mmq(x,y)
% Construct the least square exponential y=a*exp(b*x)
% that fits x and y row or column vectors.
disp('EXPONENTIAL MMQ')
n=length(x);
n=length(y);
z=log(y);
sumx=sum(x);
sumz=sum(z);
sumx2=sum(x.*x);
sumxz=sum(x.*z);
beta=(n*sumxz-sumx*sumz)/(n*sumx2-sumx^2);
b=beta;
alfa=(sumx2*sumz-sumxz*sumx)/(n*sumx2-sumx^2);
a=exp(alfa);
disp(' Exponential least squares');
fprintf('\n a =%12.6f\n',a);
fprintf(' b =%12.6f\n',b);
disp('_______________________________________________');
disp(' xi yi ln(yi) a*exp(b*xi) |yi-[a*exp(b*xi)]| ');
disp('_______________________________________________');
for i=1:n
    ye=a*exp(b*x(i));
    err(i)=abs(ye-y(i));
    fprintf('%6.2f %6.2f %6.2f %12.6f %12.6f\n',x(i),y(i),z(i),ye,err(i));
end

end