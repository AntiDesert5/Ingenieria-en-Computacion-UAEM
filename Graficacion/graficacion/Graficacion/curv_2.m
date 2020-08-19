%curvas con dos parametros
t=0:0.1:2*pi;
u=0:0.1:2*pi;
[T,U]=meshgrid(t,u);
x=cos(T).*U;
y=sin(U).*cos(T);
z=2*U.*T;
surf(x,y,z,'LineWidth',3);
hold on
plot3(x,y,z,'LineWidth',3);