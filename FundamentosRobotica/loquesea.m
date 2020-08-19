%Declaramos matriz Tp con los valores del punto p(4.8, 6.3, -9.2) 
Tp = [1,0,0,4.8;...
    0,1,0,6.3;...
    0,0,1,-9.2;...
    0,0,0,1]

% Declaramos el vector ruvw(3.9, -5.7, 9)
Ruvw = [3.4; -5.7; 9; 1]

%Multipicamos Tp * Rxyz Para obtener la resultante
res = Tp * Ruvw

%Obtenermos los valores a graficar de la resultante
R1 = res(1,1)
R2 = res(2,1)
R3 = res(3,1)

%graficamos 
plot3(R1,R2,R3, "g*")