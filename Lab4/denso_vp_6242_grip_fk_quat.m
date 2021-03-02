function rtrn = denso_vp_6242_grip_fk_quat(gamma)
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
r6from5 = [70;0;0];

T1 = rotzRad(theta1);
T2=T1*rotyRad(theta2);
T3=T2*rotyRad(theta3);
T4=T3*rotyRad(-pi/2)*rotxRad(theta4);
T5=T4*rotyRad(theta5);
T6=T5*rotxRad(theta6);

rB=rBfromI;
r1=rB+r1fromB;
r2=r1+T1*r2from1;
r3=r2+T2*r3from2;
r4=r3+T3*r4from3;
r5=r4+T4*r5from4;
r6=r5+T5*r6from5;
IIrG = r6+T6*[62.52;0;0];

q1 = [cos(theta1/2);0;0;sin(theta1/2)];
q2 = quaternion_product(q1,[cos(theta2/2);0;sin(theta2/2);0]);
q3 = quaternion_product(q2,[cos(theta3/2);0;sin(theta3/2);0]);
q4 = quaternion_product(q3,quaternion_product([cos(pi/4);0;sin(pi/4);0], [cos(theta4/2);sin(theta4/2);0;0]));
q5 = quaternion_product(q4,[cos(theta5/2);0;sin(theta5/2);0]);
q6 = quaternion_product(q5,[cos(theta6/2);sin(theta6/2);0;0]);
IqG = quaternion_product(q6,[1;0;0;0]);

rtrn = [IqG;IIrG];