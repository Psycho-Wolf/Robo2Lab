function [Qr,Ql] = scaraIK(r,T)
    % Link Lengths
    a1 = 225;
    a2 = 225;
    
    % Breaking up the Pos Mat
    x = r(1);
    y = r(2);
    z = r(3);
    
    d3 = z;
    
    % EE Theta Calculations
    D = (x^2 + y^2 - a1^2 - a2^2)/(2 * a1 * a2);
    theta2R = atan2d(sqrt(1-D^2),D);
    theta1R = atan2d(y,x) - atan2d(a1 * sind(theta2R), a1 + a2 * cosd(theta2R));
    
%     theta2L = -atan2d(sqrt(1-D^2),D);
%     theta1L = atan2d(y,x) - atan2d(a1 * sind(theta2L), a1 + a2 * cosd(theta2L));
%     
    theta4r = atan2d(T(2,1),T(1,1))-theta1R - theta2R;
%     theta4l = atan2d(T(2,1),T(1,1))-theta1L - theta2L;
    
    Qr = [theta1R, theta2R, d3, theta4r]';
%     Ql = [theta1L, theta2L, d3, theta4l]';
    
    
    
