% TESTRQI  Test RQI on various-sized real, symmetric matrices.
m = 20;
for s = 1:10
    A = randn(m,m);  A = A+A';  nA = norm(A,1);
    [lam,v,lamseq] = rqi(A,randn(m,1));
    fprintf('%2d (m = %3d): %2d iters,  ew err %.2e,  ev res %.2e\n',...
            s, m, length(lamseq), min(abs(eig(A) - lam)) / nA, ...
            norm(A*v-lam*v,1) / nA)
    m = 2^randi(9) + 5*randi(10) + randi(10);  % random integer in [8,572]
end