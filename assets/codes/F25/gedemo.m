% GEDEMO  Demonstrate the begining matrices from the
% first example in Lecture 20.

A = [2 1 1 0; 4 3 3 1; 8 7 9 5; 6 7 9 8]

L1 = eye(4, 4);  L1(2:4,1) = [-2; -4; -3]
L2 = eye(4, 4);  L2(3:4,2) = [-3; -4]
L3 = eye(4, 4);  L3(4,3) = -1
