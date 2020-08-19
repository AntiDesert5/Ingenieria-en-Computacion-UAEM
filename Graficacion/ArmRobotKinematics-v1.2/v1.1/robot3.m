#-- Cinemática de un brazo robot de 3 grados de libertad
#-- Angulos en grados
function robot3(q0,q1,q2)

#-- Convertir angulos a radianes
q0= q0*pi/180;
q1= q1*pi/180;
q2= q2*pi/180;

#-- Geometria del robot: 2 eslabones de longitudes l1 y l2
l1 = 1; 
l2 = 1;

#-- Transformadas homogeneas entre los tres sistemas de referencia
A0 = Rotz(q0);
A1 = Rotx(q1)*Trasy(l1);
A2 = Rotx(q2)*Trasy(l2);

#-- Transformada homogenea completa
T = A0*A1*A2;

#-- Coordenadas de los origenes de los sistemas de refencia
P01 = A0*A1*[0 0 0 1]';
P02 = A0*A1*A2*[0 0 0 1]';

#-- Dibujar robot

x = [0 P01(1) P02(1)];
y = [0 P01(2) P02(2)];
z = [0 P01(3) P02(3)];

hold off;
plot3(x,y,z,"-o","linewidth",4);
hold on;

plot(x,y,"cr");

#-- Dibujar la pinza
pinza3D(T);

l = l1 + l2 + 0.5*l1;
axis([-l l -l l 0 l]);
axis("square");
axis("off");
view(110,30);


