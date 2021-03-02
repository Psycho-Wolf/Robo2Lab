od = [];
phid = [theta,phi,psi];
R = rotzRad(psi)*rotyRad(phi)*rotxRad(theta);

ii = 1;
q = zeros(6,1);

quat = dcm2quat(R);
aeta = quat(1);
zeta = quat(2:4);

Kp = [5 0 0; 0 5 0; 0 0 5];
Ko = Kp;
K = [ Kp zeros(3,3); zeros(3,3) Ko];

