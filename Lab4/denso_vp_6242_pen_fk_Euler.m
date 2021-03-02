function rtrn = denso_vp_6242_pen_fk_Euler(gamma)

theta1 = gamma(1);
theta2 = gamma(2);
theta3 = gamma(3);
theta4 = gamma(4);
theta5 = gamma(5);
theta6 = gamma(6);

rBfromI = [0;0;0];
r1fromB = [0;0;155];
r2from1 = [0;0;123.5];
r3from2 = [0;0;210];
r4from3 = [-75;0;86];
r5from4 = [125;0;0];
rEfrom5 = [70;0;0];
rGfromE = [0;0;0];

T1 = rotzRad(theta1);
T2=T1*rotyRad(theta2);
T3=T2*rotyRad(theta3);
T4=T3*rotyRad(-pi/2)*rotxRad(theta4);
T5=T4*rotyRad(theta5);
TE=T5*rotxRad(theta6);
TG = TE;

rB=rBfromI;
r1=rB+r1fromB;
r2=r1+T1*r2from1;
r3=r2+T2*r3from2;
r4=r3+T3*r4from3;
r5=r4+T4*r5from4;
rE=r5+T5*rEfrom5;
rG=rE+TE*rGfromE;

rTip = rG + TG*[115;0;0];

phi = atan2(-TE(2,3),TE(2,3));
theta = atan2(TE(1,3),sqrt(TE(2,3)^2 + TE(3,3)^2));
psi = atan2(-TE(1,2),TE(1,1));

rtrn = [phi;theta;psi;rTip];

end