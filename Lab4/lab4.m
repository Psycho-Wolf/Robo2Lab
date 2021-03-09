% Redo
clear
clc

q = [-0.02,  0.00,  99.99 ,  0.02,  0.00,  0.03].'*(pi/180);

[o,R] = sixDofFK(q)