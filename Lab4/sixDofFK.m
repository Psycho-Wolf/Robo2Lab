function [o,phi] = sixDofFK(q) 
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
    
    T = A(:,:,1)* A(:,:,2)* A(:,:,3)* A(:,:,4)* A(:,:,5)* A(:,:,6);

    o = T(1:3,4);
    phi(1) = atan2(T(3,2),T(3,3));
    phi(2) = atan2(T(3,1)*-sin(phi(1)),T(3,2));
    phi(3) = atan2(T(2,1),T(1,1));
    phi = rad2deg(phi');
end