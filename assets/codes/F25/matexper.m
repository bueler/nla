% MATEXPER  Compute and plot functions of random matrices, as a
% numerical experiment.

N = 9;            % number of tries
S = 9;            % maximum size is m = 2^S
mm = 2.^(1:S);    % yes, this works to give the m values

% compute values
for k = 1:S
    m = mm(k);
    fprintf('m = %d ...\n', m)
    for n = 1:N
        A = 0.5 * rand(m,m);    % rand gives entries in [0,1]
        ranks(k, n) = rank(A);
        if ranks(k, n) ~= m
            fprintf('WARNING:  rank(A) is *not* m for size %d\n', m)
        end
        adets(k, n) = abs(det(A));
    end
end

% report largest and smallest abs(det(A))
maxad = max(max(adets));
minad = min(min(adets));
fprintf('max, min |det()| = %.3e, %.3e\n', maxad, minad)

% make plot of abs(det(A)); no need to plot ranks in fact!
figure(1),  loglog(mm, adets, 'k+', 'markersize', 12)
xlabel('m'),  ylabel('|det(A)|')
xticks(mm)
xticklabels({'2','4','8','16','32','64','128','256','512'})
yticks(10.0.^(-40:20:180))
axis([1, 1000, 1.0e-45, 1.0e185])
print('matexperdets.png')
