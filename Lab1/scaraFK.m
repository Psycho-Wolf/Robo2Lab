function [r,t] = scaraFK(q)
    a1 = 225;
    a2 = 225;
    t1 = q(1);
    t2 = q(2);
    d3 = q(3);
    t4 = q(4);
    
t = [ cosd(t1+t2+t4), -sind(t1+t2+t4), 0; sind(t1+t2+t4), cosd(t1+t2+t4), 0; 0, 0, 1];
r = [ a1*cosd(t1) + a2*cosd(t1+t2); a1*sind(t1) + a2*sind(t1+t2); d3]';
