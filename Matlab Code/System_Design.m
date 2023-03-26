clear; clc;

mc = 10;
m1 = 1;
m2 = 0.5;

l1 = 1;
l2 = 0.5;

g = 9.8;

I1 = (m1*l1^2/2)/12;
I2 = (m2*l2^2/2)/12;

E = [
    mc+m1+m2  -m1*l1       -m2*l1;
      -m1*l1   I1+m1*l1^2      0  ;
      -m2*l2    0          (I2 + m2*l2^2);
];

E = [
    eye(3) zeros(3)
    zeros(3) E
];
    
A_bar = [
    0   0       0
    0 m1*g*l2   0
    0   0      m2*g*l2
];

A_bar = [ 
    zeros(3)  eye(3) 
    A_bar zeros(3)
];

B_bar = [
    0
    0
    0
    1
    0
    0
];

A = inv(E)*A_bar;
B = inv(E)*B_bar;

C = eye(3, 6);
D = 0;

sys = ss(A,B,C,D);

Q = diag([1 1 1 0.5 0.5 0.5]);
R = 1;

K = lqr(sys, Q,R);

Q = 1;
R = 1;
[kalmf,L,~,Mx,Z] = kalman(sys,Q,R);
L