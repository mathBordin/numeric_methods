function err = err_gauss(A,xk,xk_1,t)
beta=sassenfeld(A,t);
M = max(beta);
dif = abs(xk_1-xk);
mod = max(dif);
err = (M/(1-M))*mod;
end

