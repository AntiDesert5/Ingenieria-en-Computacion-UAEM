%%------------------------------------------------------------------
%% (c) Juan Gonzalez-Gomez (Obijuan)  juan@iearobotics.com
%% Abril-2012
%%------------------------------------------------------------------
%%-- Cinematica directa de un Robot de un grado de libertado (q1)
%%-- Angulo q1 en grados
%%------------------------------------------------------------------
function robot1(q1)

%%-- Pasar angulo a radianes
q1= q1*pi/180;

%%-- Geometria del robot. Segmento de longitud l1
l1 = 1; 

%%-- Matriz homogenea de transformacion: Rotacion alrededor del eje x
%%-- y traslacion a lo largo del eje y
A1 = Rotx(q1)*Trasy(l1);

%%-- Obtener las coordenadas del extremo
P01 = A1*[0 0 0 1]';

%%-- Dibujar robot

y = [0 P01(2) ];
z = [0 P01(3) ];

hold off;
plot(y,z,'-o','linewidth',4);
hold on;

%%-- Dibujar la pinza
pinza(A1);

l = l1 + 0.5*l1;
axis([0 l 0 l]);
axis('off');


