function [Uhat, Shat, V] = mysvd(A)
% MYSVD is a possible way to compute the reduced singular value
% decomposition (SVD) of A.  This code calls EIG on A* A.
% Assumes A is m x n where m >= n.
% WARNING: The Matlab built-in method SVD is both faster and more
% stable.  Do not use this except for play and exploration!

B = A' * A;
[V, D] = eig(B);
[m, n] = size(A);
if m < n
    error('only implemented for tall or square matrices')
end
Shat = D;
for k = 1:n
    Shat(k, k) = sqrt(Shat(k, k));
end
[~, I] = sort(diag(Shat), 'descend');
Shat = Shat(I, I);
V = V(:, I);
Uhat = zeros(m, n);
for i = 1:n
    Uhat(:, i) = (A * V(:, i)) / Shat(i, i);  % fails if sigma_i = 0
end
