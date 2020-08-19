%%------------------------------------------------------------------
%% (c) Juan Gonzalez-Gomez (Obijuan)  juan@iearobotics.com
%% Abril-2012
%%------------------------------------------------------------------
%%- Dibujar la pinza del robot en 3D
%%- Se pasa como parametro la matriz de transformacion
%%------------------------------------------------------------------

function pinza3D(T)

%%-- Factor de escalado
s = 1/8;

%%-- Calcular los puntos de la pinza, transformados
p1 = T*[0 s*2 s*1  1]';
p2 = T*[0 s*1 s*1  1]';
p3 = T*[0 0 0  1]';
p4 = T*[0 s*1 s*-1 1]';
p5 = T*[0 s*2 s*-1 1]';


x = [p1(1) p2(1) p3(1) p4(1) p5(1)];
y = [p1(2) p2(2) p3(2) p4(2) p5(2)];
z = [p1(3) p2(3) p3(3) p4(3) p5(3)];

plot3(x,y,z,'g','linewidth',4);
plot(x,y,'r');



