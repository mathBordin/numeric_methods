A = [6 7 1;15 -5 -10;10 2 -13];
b = [-8; 10; 9];
Ap1 =  [-13 2 10;
        1 7 6;
        -10 -5 15];
    
Ap2 =  [-13 10 2;
        10 15 -5;
        1 6 7];    
    
beta=sassenfeld(A,10);
M1=max(sassenfeld(Ap1,10));
M2=max(sassenfeld(Ap2,10));
M = min([M1 M2]);
format rat;
M
format long g;
err_0 = 5.54*M/(1-M);
err = 0.00100;
k = log(err/err_0)/log(M)
k_int = ceil(k)
