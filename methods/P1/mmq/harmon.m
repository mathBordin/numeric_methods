function [a0,a,b] = harmon(y)

disp('ANALISE HARMONICA CONTINUA');

L = length(y);
N = L/2;

n=1:1:L;

a0 = (1/L)*sum(y);

for k=1:N-1
    f_cos = cos(k*pi*n/N);
    f_sen = sin(k*pi*n/N);
    a(k) = (1/N)*sum(y.*f_cos);
    b(k) = (1/N)*sum(y.*f_sen);
end
f_cos = cos(pi*n);
a(N) = (1/L)*sum(y.*f_cos);
b(N) = 0;

disp('k - ak - bk');
fprintf('0 %12.6f 0\n',a0);
for k=1:N
    fprintf('%2.0f %12.6f %12.6f \n', k, double(a(k)),double(b(k)));
end

end

