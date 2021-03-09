function Jacobian = sixDofJ(q)
    d =     [280, 0, 0, 210, 0, 70].';
    theta = [q(1)-pi, q(2)+pi/2, q(3)-pi/2, q(4), q(5)-pi, q(6)].';
    alpha = [pi/2, 0, -pi/2, pi/2, pi/2, 0].';
    a =     [0 210 75 0 0 0].';
   
    A = zeros(4,4,6);
    
    for ii = 1:6
        A(:,:,ii) = [   cos(theta(ii)), -sin(theta(ii))*cos(alpha(ii)), sin(theta(ii))*sin(alpha(ii)), a(ii)*cos(theta(ii));
                        sin(theta(ii)), cos(theta(ii))*cos(alpha(ii)), -cos(theta(ii))*sin(alpha(ii)), a(ii)*sin(theta(ii));
                        0, sin(alpha(ii)), cos(alpha(ii)), d(ii);
                        0, 0, 0, 1];
    end
    

Am(:,:,1) = A(:,:,1);
Am(:,:,2) = A(:,:,2)*A(:,:,1);
Am(:,:,3) = A(:,:,3)*A(:,:,2);
Am(:,:,4) = A(:,:,4)*A(:,:,3);
Am(:,:,5) = A(:,:,5)*A(:,:,4);
Am(:,:,6) = A(:,:,6)*A(:,:,5);



R = Am(1:3,4,6);
u = [0;0;1];

J(:,:,1) = [cross(u,R);u];

for ii = 2:6
    z = Am(1:3,3,ii);
    r = Am(1:3,4,ii);
    J(:,:,ii) = [cross(z,R-r);z];
end
Jacobian = [J(:,:,1),J(:,:,2),J(:,:,3),J(:,:,4),J(:,:,5),J(:,:,6)];