clear
clc
tTest = [-1/sqrt(2), -1/sqrt(2) 0; 1/sqrt(2), -1/sqrt(2), 0; 0, 0, 1];
rTest = [159.099; 384.099; 155];

[r,l] = scaraIK(rTest,tTest)

[rR,rT] = scaraFK(r)
[lR,lT] = scaraFK(l)
