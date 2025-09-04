function b = mymatvec(A, x)
% MYMATVEC  Computes  b = A * x.

if (size(x,2) ~= 1)
    error('x must be a column')
end
[m n] = size(A);
if (length(x) ~= n)
    error('length(x) must equal number of columns in A')
end

b = zeros(m,1);
for i = 1:m
    b(i) = A(i,1) * x(1);
    for j = 2:n
        b(i) = b(i) + A(i,j) * x(j);
    end
end
