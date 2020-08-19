%circuferencia 
clear all
clc 
for i=0:50;
  t=0:0.01:12*pi+.01;;
  x=cos(t+i);
  y=sin(t+i);
  %z=ones(1,length(t))*5;
  z=1*(t/i);
  plot3(x,y,z,'LineWidth',3);
  axis([-2 1 -2 1 -2 3])
  pause(0.01)
endfor