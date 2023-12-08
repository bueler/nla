function [L, U] = luouter(A)
% LUOUTER  Compute LU factorization of A by Algorithm 20.1
% in Trefethen & Bau.  Implementation uses an outer product
% to replace a for loop.

    [m, n] = size(A);
    if n != m,  error('A must be square'),  end
    U = A;
    L = eye(m,m);
    for k = 1:m-1
        L(k+1:m,k) = U(k+1:m,k) / U(k,k);   % column vector
        U(k+1:m,k) = 0;                     % force zeros below diagonal
        % next: modify square block by subtracting an outer product
        U(k+1:m,k+1:m) = U(k+1:m,k+1:m) - L(k+1:m,k) * U(k,k+1:m);
    end
