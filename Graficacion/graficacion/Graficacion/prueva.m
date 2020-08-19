clc
clear all
c =[0,0,0;0,0,1]
c2=[0,0,1;0,1,1]


for an=1:1000;
  
  a=an*3;
  t=(pi/180)*a
  if t < 1.89
    r=[0,cos(t),sin(t);0,-sin(t),cos(t);0,0,1];
    T2=c2*r;
    axis([-2 2 -2 2 0 2])
    pause(0.000001) 
    plot3(T2(:,1),T2(:,2),T2(:,3),'Color','b')
  else
    i=0;
    i++;
    t=0.10472*2*1;
    r=[0,cos(t),sin(t);0,-sin(t),cos(t);0,0,1];
    T2=c2*r;
    axis([-2 2 -2 2 0 2])
    pause(0.000001) 
    plot3(T2(:,1),T2(:,2),T2(:,3),'Color','b')
  endif
endfor
    xlabel("Eje X");
    ylabel("Eje Y");
    zlabel("Eje Z");
    