%Ejercico para cualquier problema rotacion-traslación-rotación
beta = -41
rad2 = (beta*(2*pi))/360

tetha = 50
rad1 = (tetha*(2*pi))/360

%Matriz p = (4, 6, 10.5)
P = [4; 5.6; 10.5; 1]

Px = P(1,1)
Py = P(2,1)
Pz = P(3,1)

%Matriz Tzp
Tzp = [cos(rad2), -sin(rad2), 0, Px;...
    sin(rad2), cos(rad2), 0, Py;...
    0, 0, 0, Pz;...
    0, 0, 0, 1]

%multiplicación de Tzp * P

Mul = Tzp * P


%Definimos Matriz Tpy

Tpy = [cos(rad1), 0, sin(rad1), (Px*cos(rad1))+(Pz*cos(rad1));...
    0, 1, 0, Py;...
    -sin(rad1), 0, cos(rad1), (Pz*cos(rad1))-(Px*cos(rad1));...
    0, 0, 0, 1]

%Obtenemos el resultado final
res = Tpy * Mul

%Obtenermos los valores a graficar de la resultante
R1 = res(1,1)
R2 = res(2,1)
R3 = res(3,1)

%graficamos 
plot3(R1,R2,R3, "g*")