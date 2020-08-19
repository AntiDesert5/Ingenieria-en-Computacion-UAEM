function [q0,q1,q2]=robot3_inv(x,y,z)

#-- Geometria del robot
l1 = 1;
l2 = 1;

Cq2 = (x^2 + y^2 + z^2 - l1^2 - l2^2)/(2*l1*l2);
q2 = -acos(Cq2);
q1 = atan(z/sqrt(x^2 + y^2)) - atan(-l2*sqrt(1-Cq2^2)/(l1+l2*Cq2) );
q0 = -atan(x/y);

#-- Pasar a grados
q2 = q2*180/pi;
q1 = q1*180/pi;
q0 = q0*180/pi;

robot3(q0,q1,q2);
axis("on");
grid on
box off


