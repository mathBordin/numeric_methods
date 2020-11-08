function beta=sassenfeld(Ae,t)

A=round_n(Ae,t);

% Avalia o critério de sassenfeld na matriz A, para saber se o método de
% Gauss-Seideliterativo de resolução de sistema irá convergir.(Critério
% suficiente, não necessária!)
[m, n]=size(A);
beta=zeros(m,1);
for i=1:m
    for j=1:i-1
        beta(i)=round_n(beta(i)+round_n(round_n(abs(A(i,j))/abs(A(i,i)),t)*beta(j),t),t);
    end
        for j=i+1:n
            beta(i)=round_n(beta(i)+round_n(abs(A(i,j))/abs(A(i,i)),t),t);
        end
end
max_beta = max(beta);   
fprintf('M = max(Beta) = %f\n',max_beta);
if max_beta < 1
    disp('O sistema irá convergir! O critério de Sassenfeld é satisfeito (M<1)'); 
else
    disp('O sistema pode não convergir! O critério de Sassenfeld não é satisfeito (M>=1)');
end

end
