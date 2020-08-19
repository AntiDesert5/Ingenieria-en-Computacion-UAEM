function [q1,q2,q3]=robot2_1_inv(y,z,alpha)

#-- Geometria del robot
l1 = 1;
l2 = 1;

#-- Calcular la cinematica inversa: Angulos q1 y q2 a partir de (y,z)
Cq2 = (y^2 + z^2 - l1^2 - l2^2)/(2*l1*l2);
q2 = -acos(Cq2);
q1 = atan(z/y) - atan(-l2*sqrt(1-Cq2^2)/(l1+l2*Cq2) );

#-- Pasar a grados
q2 = q2*180/pi;
q1 = q1*180/pi;

q3 = alpha - q1 -q2;

#-- Cinematica Directa: Dibujar el robot a partir de los angulos
robot2_1(q1,q2,q3);

#-- Modificar los ejes para que se vea mejor
grid on
axis("on");
box off
axis([-1 2.5 0 2.5]);
axis("equal");



