function H = hessen(A,stages)
% HESSEN  Hessenberg reduction of A, namely Alg 26.1 in Trefethen
% & Bau.  Prints stages of calculation if stages==true.  Example:
%   >> A = randn(5,5)
%   >> H = hessen(A)
%   >> norm( sort(eig(A)) - sort(eig(H)) )

if nargin < 2,  stages = false;  end
m = size(A,1);
if size(A,2) ~= m,  error('only applies to square matrices'),  end
for k = 1:m-2
    v = A(k+1:m,k);
    v(1) = sign(v(1)) * norm(v) + v(1);
    v = v / norm(v);
    A(k+1:m,k:m) = A(k+1:m,k:m) - 2 * v * (v' * A(k+1:m,k:m));
    A(:,k+1:m) = A(:,k+1:m) - 2 * (A(:,k+1:m) * v) * v';
    if stages,  A,  end
end
H = triu(A,-1);  % force exact zeros below diagonal
