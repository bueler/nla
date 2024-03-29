function [Q,R] = mgs(A);
% MGS Compute reduced QR decomposition by MODIFIED Gram-Schmidt,
% Trefethen & Bau Algorithm 8.1.  Compare CLGS and built-in QR
% (= Householder).  Usage:
%    [Q,R] = mgs(A)

[m n] = size(A);
if m < n,  error('only implemented for m >= n'),  end
R = zeros(n,n);
Q = A;                 % makes a copy (first loop in Alg. 8.1)
for i = 1:n
    r = norm(Q(:,i),2);
    R(i,i) = r;
    Q(:,i) = Q(:,i) / r;
    for j = i+1:n
        R(i,j) = Q(:,i)' * Q(:,j);
        Q(:,j) = Q(:,j) - R(i,j) * Q(:,i);
    end
end
