#pseudoesfera
clear all;
t=0:0.1:2*pi+0.1;
u=0:0.1:2*pi+0.1;
R=3;
[T,U]=meshgrid(t,u);
for i=1:120;
x=R*cos(T+i).*sin(U);
y=R*sin(T*i).*sin(U+i);
z=R*cos(U+i);
#plot3(x,y,z,'LineWidth',3)
surf(x,y,z,'LineWidth',3)
pause(1/60);
end