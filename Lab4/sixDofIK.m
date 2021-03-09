function [q,ep, eo] = sixDofIK(od, phid, q0) 
quatd = eul2quat(phid);
etad = quatd(1);
zetad = quat(2:4);

k = 5*ones(6,1);
K = diag(k);

q = q0;
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
    
end