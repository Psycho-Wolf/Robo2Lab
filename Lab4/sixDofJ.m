function J = sixDofJ(q)
    d =     [280, 0, 0, 210, 0, 70].';
    theta = [q(1)-pi, q(2)+pi/2, q(3)-pi/2, q(4), q(5)-pi, q(6)].';
    alpha = [pi/2, 0, -pi/2, pi/2, pi/2, 0].';
    a =     [0 210 75 0 0 0].';
   
    for ii = 1:6
        A(:,:,ii) = [   cos(theta(ii)), -sin(theta(ii))*cos(alpha(ii)), sin(theta(ii))*sin(alpha(ii)), a(ii)*cos(theta(ii));
                        sin(theta(ii)), cos(theta(ii))*cos(alpha(ii)), -cos(theta(ii))*sin(alpha(ii)), a(ii)*sin(theta(ii));
                        0, sin(alpha(ii)), cos(alpha(ii)), d(ii);
                        0, 0, 0, 1];
    end
    
    
T(:,:,1) = A(:,:,1);

for ii = 2:6
    T(:,:,ii) = A(:,:,ii-1)*A(:,:,ii);   
    
end

r6 = T(1:3,4,6);

J = zeros(6,6);

for ii = 1:6
    z = T(1:3,3,ii);
    r = T(1:3,4,ii);
    J(:,ii) = [cross(z,r6-r);z].';
end
    