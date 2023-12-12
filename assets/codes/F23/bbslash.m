function x = bbslash(A,b)
% BSLASH  Solve linear system Ax=b by in-place PA = LU factorization,
% i.e. Alg 21.1, Gauss elimination with partial pivoting.  Only
% extra memory is for p (permutation) vector.

m = size(A,1);
if size(A,2) ~= m,  error('only works on square matrices'),  end
if length(b) ~= m,  error('size mismatch'),  end
p = 1:m;                % initial order of rows
for k = 1:m-1
    [zzz, ip] = max(abs(A(p(k:m),k)));
    l = ip(1) + k - 1;  % includes rule for ties: use first
    tmp = p(k);  p(k) = p(l);  p(l) = tmp;  % exchange
    for j = k+1:m
        A(p(j),k) = A(p(j),k) / A(p(k),k);
        A(p(j),k+1:m) = A(p(j),k+1:m) - A(p(j),k) * A(p(k),k+1:m);
    end
end
%debug:  L=eye(m)+tril(A(p,:),-1),  U=triu(A(p,:)),
%        P = eye(m);  P = P(p,:)
% forward substitution to solve  L y = P b  (y=x here)
x = zeros(m,1);   % allocate for speed
x(1) = b(p(1));
for k = 2:m
    x(k) = b(p(k)) - A(p(k),1:k-1) * x(1:k-1);    %  note L(k,k) = 1
end
% back substitution (Alg 17.1) to solve  U x = y
x(m) = x(m) / A(p(m),m);
for k = m-1:-1:1
    x(k) = (x(k) - A(p(k),k+1:m) * x(k+1:m)) / A(p(k),k);
end
