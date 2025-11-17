% LECTURE16COMMENTS  Do the experiment at the start of Lecture 16,
% adding some comments during Ed's lecture.  Run to see outputs
% from lines without semicolons.

R = triu(randn(50, 50));
[Q,X] = qr(randn(50, 50));

norm(Q'*Q-eye(50, 50))   % Q is accurately unitary

A = Q*R;  % A is 50x50 and has an accurately known QR decomposition

norm(A - Q*R)  % gives zero, of course

[Q2,R2] = qr(A);

norm(A - Q2*R2)  % MAIN IDEA: this is tiny

norm(Q-Q2)  % MAIN IDEA: not so tiny!

norm(R-R2)  % MAIN IDEA: not so tiny!

% compare some numbers in organized way
format long, [norm(A - Q2*R2); norm(Q-Q2); norm(R-R2)]

%    f: A --> (Q,R)   is the problem here
% observe backward stability:
%    tilde f(A) = f(tilde A)
% where Q2 * R2 = tilde A
% ... versus large forward error in Q2 and R2!

% quality of approximations:
% -------------------------
%
%   A ~~ tilde Q tilde R is very accurate
%   Q ~~ tilde Q is INaccurate
%   R ~~ tilde R is INaccurate

% part of the explanation: R is ill-conditioned

cond(R)   % large!
