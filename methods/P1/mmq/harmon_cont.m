function [a0,a,b] = harmon_cont(f,N,L)

disp('ANALISE HARMONICA CONTINUA');

syms x;

a0 = (1/(2*L))*vpaintegral(f,x,-L,L);

for k=1:N
    f_cos(x) = cos(k*pi*x/L);
    f_sen(x) = sin(k*pi*x/L);
    a(k) = (1/L)*vpaintegral(f*f_cos,x,-L,L);
    b(k) = (1/L)*vpaintegral(f*f_sen,x,-L,L);
end

disp('k - ak - bk');
fprintf('0 %12.6f 0\n',a0);
for k=1:N
    fprintf('%2.0f %12.6f %12.6f \n', k, double(a(k)),double(b(k)));
end

end

