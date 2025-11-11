function x = newtonex(x0, NN)
% NEWTONEX  Newton's method to solve a nonlinear system of 3 eqns in
% 3 unknowns.  Input initial iterate and number of steps:
%   >> newtonex([1 -1 1], 6)
%   >> newtonex([1 -1 -1], 6)

x = x0(:);   % makes x a column vector
for n = 1:NN+1
  estimates(:,n) = x;
  f = [x'*x - 4, x(2) - cos(pi*x(3)), x(1) - x(3)^2]';
  residual_norms(n) = norm(f);
  if n == NN+1,  break,  end
  J = [  2*x(1),    2*x(2),          2*x(3); 
              0,         1, pi*sin(pi*x(3));
              1,         0          -2*x(3)];
  s = J \ (-f);
  x = x + s;
end

% show numbers and plot residual norms
format long,  estimates
semilogy(0:NN, residual_norms, '*')
xlabel('iteration  n'),  ylabel('residual norm')
