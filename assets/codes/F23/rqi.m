function [lam,v,lamseq] = rqi(A,v0)
% RQI  Do Rayleigh quotient iteration on a square Hermitian matrix
% A, using a nonzero initial vector v0.  Iterations stop when
% rcond(A - lam I) < 10 eps.  Returns the final eigenvalue lam, a
% normalized eigenvector v, and the sequence of Rayleigh quotient
% values lamseq.
% Usage:  >> [lam,v,lamseq] = rqi(A,v0)

m = size(A,1);
if (m ~= size(A,2)) | (norm(A'-A,1) ~= 0)
    error('only applies to square, Hermitian matrices')
end

v = v0 / norm(v0);
lamseq = [r(v)];
k = 1;
B = A - lamseq(k) * eye(m,m);
while rcond(B) > 10*eps
    if k >= 1000,  error('j=1000: not converging!'),  end
    v = B \ v;                       % apply  B^{-1}
    v = v / norm(v);
    lamseq = [lamseq r(v)];
    k = k+1;
    B = A - lamseq(k) * eye(m,m);
end
% v = B \ v;  v = v / norm(v);  % uncomment for better v, and warning
lam = lamseq(k);

    function z = r(x)
    % R Compute the Rayleigh quotient when |x|_2=1.
    z = x' * A * x;
    end
end
