function Q = formQ(W, reduced);
% FORMQ computes Q in a reduced QR decomposition A = QR, by using
% the result of HOUSE.  This is Algorithm 10.3 from Trefethen & Bau.
% If called as formQ(W, 0) then the returned Q is m x n when
% W is m x n.
% Usage:
%   >> [W,R] = house(A)
% Here W is lower triangular and R is upper triangular.  To get Q
% and Qhat, respectively, do
%   >> Q = formQ(W)
%   >> Qhat = formQ(W, 0)

[m n] = size(W);
if m < n,  error('the wide case (m<n) is not implemented'),  end

if nargin < 2 || reduced ~= 0
    Q = zeros(m, m);
else
    Q = zeros(m, n);
end
for i=1:size(Q, 2)
    e = zeros(m, 1);
    e(i) = 1;                  % e = e_i
    for k = n:-1:1             % apply Alg. 10.3 to build Q e_i
        v = W(k:m, k);
        e(k:m) = e(k:m) - 2 * v * (v' * e(k:m));
    end
    Q(:, i) = e;                % put Q e_i into Q
end
