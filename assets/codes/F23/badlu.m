function A = badlu(m)
% BADLU Generate matrices nearly of form (22.4) in Trefethen & Bau,
% and demonstrate that LU decomposition (with partial pivoting)
% really does generate instability.

A = eye(m,m) + tril(-ones(m,m) + 0.001 * rand(m,m), -1);
A(:,m) = 1;
[L,U,P] = lu(A);
if any(any(P != eye(m,m)))
    warning('P is not I')       % warn if a pivot happened
end
fprintf('result: growth factor           = %.3e\n', max(max(abs(U))))
fprintf('        norm(A - L*U) / norm(A) = %.3e\n', norm(A - L*U))
