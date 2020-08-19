clc
clear all
c=[0,0,0;0,1,0;1,1,0;
   1,0,0;0,0,0;0,1,0.5;
   0,2,0.5;1,2,0.5;1,1,0.5;
   0,1,0.5;0,2,0.5;0,1,0;
   1,1,0;1,2,0.5;1,1,0.5;
   1,0,0;0,0,0;0,1,0];

an=0;%input('De el angulo de rotacion: ');
Th=(pi/180)*an;
R=[cos(Th),sin(Th),0;-sin(Th),cos(Th),0;0,0,1];
T=c*R;
plot3(c(:,1),c(:,2),c(:,3),'Color','b')
hold on
plot3(T(:,1),T(:,2),T(:,3),'Color','r')
xlabel("Eje X");
ylabel("Eje Y");
zlabel("Eje Z");