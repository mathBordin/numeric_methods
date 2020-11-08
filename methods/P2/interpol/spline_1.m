%The following MATLAB function spline_1.m finds a first-degree spline
%that interpolates a table of values. INPUTS are a table of function
%values x and y; the value of c at which S(x) is to be approximated.
function spline_1(x,y,c)
% First-degree spline.
n=length(x);
for i=n-1:-1:2
    dis=c-x(i);
    if(dis>=0)
        break
    end
end
if(dis<0)
    i=1;
    dis=c-x(1);
end
m=(y(i+1)-y(i))/(x(i+1)-x(i));
spl1=y(i)+m*dis;
disp(' linear spline')
disp('_______________________________________________')
disp([' x y c = ',num2str(c),' '])
disp('_______________________________________________')
for j=1:n
    fprintf('%12.6f %12.6f ',x(j),y(j))
    if (j==i)
        fprintf('\n S(c)= %10.6f',spl1)
    end;
    fprintf('\n')
end