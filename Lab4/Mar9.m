maxI = 100;

q0 = [-1.7 1.2 1.5 0 .5 -.7].';

od = [ -77.52; -349.98; 126.32];

phid = [179.6 -.73 116.62].' *(pi/180);
k = 5*ones(6,1);
K = diag(k);

quatd = eul2quat(phid);
etad = quatd(1);
zetad = quat(2:4);

q = qd;
ii = 1;
dT = .005;


ep = [1;1;1];
eo = ep;

while (ii <= maxI) && (norm(ep) >= .01) && (norm(eo) >= .01)
    [o,R] = 6DofFk(q)
    J = 6DofJ(q);
    
    ep = od-o;
    
    quatd = dcm2quat(R);
    eta = quat(1);
    zeta = quat(2:4);
    
    eo = -etad*zeta + eta*zetad - cross(zetad,zeta);
    
    q = q+dT*inv(J)*K*[ep;eo];
    
    ii = ii+1;
end

disp(q)
    