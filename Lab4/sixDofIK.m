function [q,ep, eo] = sixDofIK(od, phid, q0) 
quatd = eul2quat(phid.');
etad = quatd(1);
zetad = quatd(2:4);

k = 5*ones(6,1);
K = diag(k);

q = q0;
ii = 1;
dT = .005;


ep = [1;1;1];
eo = ep;
maxI = 100;

while (ii <= maxI) && (norm(ep) >= .01) && (norm(eo) >= .01)
    [o,R] = sixDofFK(q);
    J = sixDofJ(q);
    
    ep = od-o;
    
    quatd = eul2quat(R.');
    eta = quatd(1);
    zeta = quatd(2:4);
    
    eo = -etad*zeta + eta*zetad - cross(zetad,zeta);
    q = quatd+dT*J\K*[ep;eo.'];
    
    ii = ii+1;
end
    disp(ii);
end