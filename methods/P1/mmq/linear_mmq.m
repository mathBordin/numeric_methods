%The following MATLAB function linlsqr.m constructs a least
%squares line y = ax + b that best fits a table of x and y values.
%INPUTS are x and y row vectors.
function linear_mmq(xe,ye,t)
% Construct a least square line y=ax+b
% that fits x and y row or column vectors.

x = round_n(xe, t);
y = round_n(ye, t);

disp('LINEAR MMQ');

n=length(x);
n=length(y);
sumx=round_n(sum(x),t);
sumy=round_n(sum(y),t);
sumx2=round_n(sum(x.*x),t);
sumxy=round_n(sum(x.*y),t);
a=round_n(round_n((round_n(n*sumxy,t)-round_n(sumx*sumy,t)),t)/round_n((round_n(n*sumx2,t)-round_n(sumx^2,t)),t),t);
b=round_n(round_n((round_n(sumx2*sumy,t)-round_n(sumxy*sumx,t)),t)/round_n((round_n(n*sumx2,t)-round_n(sumx^2,t)),t),t);
disp(' linear least squares');
fprintf('\n a =%12.12f\n',b);
fprintf(' b =%12.12f\n',a);
disp('______________________________________________');
disp(' x y a*x+b |y-(ax+b)| ');
disp('______________________________________________');
for i=1:n
    yl=round_n(round_n(a*x(i),t)+b,t);
    err(i)=round_n(abs(yl-y(i)),t);
    fprintf('%6.2f %6.2f %12.6f %12.6f\n',x(i),y(i),yl,err(i));
end
err=round_n(sum(err.*err),t);
fprintf('\n E(a,b) =%12.6f\n',round_n(sum(err),t));

end