clear all
clc
g=0:pi/30:2*pi;
  x=cos(g)
  y=sin(g);
for z=-4:4
  hold on 
  plot3(x,y,z,'Color','b')
  
endfor

xlabel("Eje X");
ylabel("Eje Y");
zlabel("Eje Z");