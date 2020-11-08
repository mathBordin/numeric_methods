function c = refine(b, A, xa, t)
    r = round_n(b-A*xa,t);  
    c = scaled_gauss_el(A,r,t)
end

