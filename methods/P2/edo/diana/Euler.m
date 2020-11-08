function Variaveis=Euler(Variaveis,Derivadas,h,tempo)
%Euler = Fun��o para executar o m�todo de Euler para um sistema de EDOs
%gen�rico.

for n=1:length(tempo)-1;
    disp('O passo em que estamos �:')
    passo=tempo(n)/n
    disp(['F(',num2str(tempo(n)),' ',num2str(Variaveis(:,n).'), ')'])
    K1=Derivadas(tempo(n),Variaveis(:,n))
    disp('E as vari�veis finais s�o:')
    Variaveis(:,n+1)= Variaveis(:,n)+h*K1;
    Variaveizinhas=Variaveis(:,length(Variaveis(1,:)))
end

end
