function Variaveis=RK2(Variaveis,Derivadas,h,tempo,RK)
%RK2 = Função para executar o método RK2 para um sistema de EDOs
%genérico.

if RK==1
    for n=1:length(tempo)-1;
        disp('O passo em que estamos é:')
        passo=tempo(n)/h
        disp('E os valores dos Ks são:')
        disp(['K1=F(',num2str(tempo(n)),' ',num2str(Variaveis(:,n).'), ')'])
        K1=Derivadas(tempo(n),Variaveis(:,n))
        disp(['K2=F(',num2str(tempo(n)+h),' ',num2str((Variaveis(:,n)+h*K1).'), ')'])
        K2=Derivadas(tempo(n)+h,Variaveis(:,n)+h*K1)
        K=K1+K2;
        disp('E as variáveis ao fim são:')
        Variaveis(:,n+1)= Variaveis(:,n)+h/2*K;
        Variaveizinhas=Variaveis(:,length(Variaveis(1,:)))
    end
else
    for n=1:length(tempo)-1;
        disp('O passo em que estamos é:')
        passo=tempo(n)/h
        disp('E os valores dos Ks são:')
        disp(['K1=F(',num2str(tempo(n)),' ',num2str(Variaveis(:,n).'), ')'])
        K1=Derivadas(tempo(n),Variaveis(:,n))
        disp(['K2=F(',num2str(tempo(n)+0.5*h),' ',num2str((Variaveis(:,n)+0.5*h*K1).'), ')'])
        K2=Derivadas(tempo(n)+0.5*h,Variaveis(:,n)+0.5*h*K1)
        disp('E as variáveis ao fim são:')
        Variaveis(:,n+1)= Variaveis(:,n)+h*K2;
        Variaveizinhas=Variaveis(:,length(Variaveis(1,:)))
    end    
end
end
