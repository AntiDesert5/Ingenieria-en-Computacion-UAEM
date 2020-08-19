#circunferencia
for i=1:120
t=0:0.1:12*pi+0.1;
x=cos(t+i);
y=sin(t+i);
z=5*t/i;
plot3(x,y,z,'LineWidth',3)
pause(1/60)
end