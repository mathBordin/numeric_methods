function Variaveis=RK4(Variaveis,Derivadas,h,tempo)
%RK4 = Fun��o para executar o m�todo RK4 para um sistema de EDOs
%gen�rico.

for n=1:length(tempo)-1;
    disp('O passo em que estamos �:')
    passo=tempo(n)/h
    disp('E os valores dos Ks s�o:')
    disp(['K1=F(',num2str(tempo(n)),' ',num2str(Variaveis(:,n).'), ')'])
    K1=Derivadas(tempo(n),Variaveis(:,n))
    disp(['K2=F(',num2str(tempo(n)+0.5*h),' ',num2str((Variaveis(:,n)+0.5*h*K1).'), ')'])
    K2=Derivadas(tempo(n)+h/2,Variaveis(:,n)+h/2*K1)
    disp(['K3=F(',num2str(tempo(n)+0.5*h),' ',num2str((Variaveis(:,n)+0.5*h*K2).'), ')'])
    K3=Derivadas(tempo(n)+h/2,Variaveis(:,n)+h/2*K2)
    disp(['K4=F(',num2str(tempo(n)+h),' ',num2str((Variaveis(:,n)+h*K3).'), ')'])
    K4=Derivadas(tempo(n)+h,Variaveis(:,n)+h*K3)
    K=K1+2*K2+2*K3+K4
    disp('E as vari�veis ao fim s�o:')
    Variaveis(:,n+1)= Variaveis(:,n)+h/6*K;
    Variaveizinhas=Variaveis(:,length(Variaveis(1,:)))
end

end

