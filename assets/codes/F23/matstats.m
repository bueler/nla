% MATSTATS  Compute and plot functions of random matrices.

N = 10;           % number of tries
S = 8;            % maximum size is m = 2^S
mm = 2.^(1:S);    % yes, this works!

% compute values
for k = 1:S
    m = mm(k);
    for n = 1:N
        A = 10.0 * rand(m,m) - 5.0;  % [0,1] --> [-5,5]
        ranks(k, n) = rank(A);
        if ranks(k, n) ~= m
            fprintf('WARNING:  rank(A) is *not* m for size %d\n', m)
        end
        norms(k, n) = norm(A);
        absdets(k, n) = abs(det(A));
        if absdets(k, n) > 1.0e308
            fprintf('WARNING:  det(A) overflow for size %d\n', m)
        end
    end
end

% make plots; no need to plot ranks (see solutions)
figure(1),  loglog(mm, norms, 'ko', 'markersize', 12)
xlabel('m'),  ylabel('norm(A)'),  axis([1, 512, 1, 100])
xticks(mm),  xticklabels({'2','4','8','16','32','64','128','256'})
print('matstatsnorms.pdf')
figure(2),  loglog(mm, absdets, 'ko', 'markersize', 12)
xlabel('m'),  ylabel('|det(A)|'),  axis([1, 512, 1.0, 1.0e200])
xticks(mm),  xticklabels({'2','4','8','16','32','64','128','256'})
yticks(10.0.^(0:50:200))
print('matstatsdets.pdf')
