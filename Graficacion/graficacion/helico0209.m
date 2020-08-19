#curvas con dos parametros
clear all;

t=0:0.1:2*pi;
u=0:0.1:2*pi;
[T,U]=meshgrid(t,u);
for i=1:60;
x=cos(T+i).*U;
y=sin((U+i).*T);
z=2*T.*U;
#plot3(x,y,z,'LineWidth',3)
surf(x,y,z,'LineWidth',3)
pause(1/60);
end