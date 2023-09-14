% MANIPULATIONS  Do some manipulations on a matrix by left and right
% matrix multiplications.

% matrix with convenient integer entries
B = magic(4)

% build and apply each factor
R1 = [0 0 1 0; 0 1 0 0; 1 0 0 0; 0 0 0 1];                B*R1
L2 = [1 0 0 0; 0 0 0 1; 0 0 1 0; 0 1 0 0];             L2*B*R1
R3 = eye(4); R3(2,2)=2;                                L2*B*R1*R3
L4 = [1 0 1 0; 0 1 0 0; 0 0 1 0; 0 0 0 1];          L4*L2*B*R1*R3
L5 = [1 -1 0 0; 0 1 0 0; 0 -1 1 0; 0 -1 0 1];    L5*L4*L2*B*R1*R3
R6 = [1 0 0 0; 0 1 0 0; 0 0 0 0; 0 0 1 1];       L5*L4*L2*B*R1*R3*R6
L7 = [1 0 0 0; 0 0 1 0; 0 0 0 1];             L7*L5*L4*L2*B*R1*R3*R6

% print resulting left and right factors
A = L7 * L5 * L4 * L2
C = R1 * R3 * R6
