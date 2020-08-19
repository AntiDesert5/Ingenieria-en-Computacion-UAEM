#-- Cinematica de un brazo robot de dos grados de libertad
#-- Entradas: Angulos en grados
function robot2(q1,q2)

#-- Pasar los angulos a radianes
q1= q1*pi/180;
q2= q2*pi/180;

#-- Geometria del robot: 2 eslavones de longitudes l1 y l2
l1 = 1; 
l2 = 1;

#-- Transformadas homogeneas
A1 = Rotx(q1)*Trasy(l1);  #-- Del sistema 1 al 0
A2 = Rotx(q2)*Trasy(l2);  #-- Del sistema 2 al 1

#-- Transformada final
T = A1*A2;

#-- Calcular las coordenadas de los origenes de los sistemas 1 y 2
P01 = A1*[0 0 0 1]';
P02 = A1*A2*[0 0 0 1]';

#-- Dibujar robot

y = [0 P01(2) P02(2)];
z = [0 P01(3) P02(3)];

hold off;
plot(y,z,"-o","linewidth",4);
hold on;

#-- Dibujar la pinza
pinza(T);

l = l1 + l2 + 0.5*l1;
axis([0 l 0 l]);
axis("equal");
axis("off");


