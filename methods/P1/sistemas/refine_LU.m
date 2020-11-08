function x = refine_LU(b, A, xa, L,U, t)
    r = round_n(b-A*xa,t); 
    P = round((L*U)/A)
    r2 = P*r;
    y = scaled_gauss_el(L,r2,t);
    c = scaled_gauss_el(U,y,t) %#ok<NOPRT>
    x = round_n(xa+c,t) %#ok<NOPRT>
end
