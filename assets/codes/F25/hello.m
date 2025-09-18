function A = hello

% assembles HELLO matrix for Trefethen&Bau Exercise 9.3

bl = ones(8,6);  % solid block
H = bl;  H(1:3,3:4) = zeros(3,2);  H(6:8,3:4) = zeros(3,2);
E = bl;  E(3,3:6)   = zeros(1,4);  E(6,3:6)   = zeros(1,4); 
L = bl;  L(1:6,3:6) = zeros(6,4);
O = bl;  O(3:6,3:4) = zeros(4,2);

A = zeros(15,40);
A(2:9,2:7)    = H;
A(3:10,10:15) = E;
A(4:11,18:23) = L;
A(5:12,26:31) = L;
A(6:13,34:39) = O;
spy(A)
