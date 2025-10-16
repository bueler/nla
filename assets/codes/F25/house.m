function [W, R] = house(A);
% HOUSE a reduced QR decomposition A = QR.  Applies Householder
% triangularization, which is Trefethen & Bau Algorithm 10.1.
% It returns the vectors "v" in a matrix W which can be used to
% recover Q.  See also FORMQ.
% Usage:
%   >> [W,R] = house(A)
% Here W is lower triangular and R is upper triangular.  To get Q
% and Qhat, respectively, do
%   >> Q = formQ(W)
%   >> Qhat = formQ(W, 0)

[m n] = size(A);
if m < n,  error('the wide case (m<n) is not implemented'),  end

W = zeros(m,n);
for k = 1:n
    v = A(k:m,k);               % v is (m-k+1) x 1 column vector
    v(1) = sign(v(1)) * norm(v,2) + v(1);
    v = v / norm(v,2);
    A(k:m,k:n) = A(k:m,k:n) - 2 * v * (v' * A(k:m,k:n));
    W(k:m,k) = v;               % store v in W
end
R = triu(A(1:n,1:n));           % force exact zeros below diag
