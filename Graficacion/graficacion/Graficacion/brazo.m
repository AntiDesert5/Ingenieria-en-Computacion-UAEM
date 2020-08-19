clc
clear all
c =[0,0,0;0,0,1];
c2=[0,0,1;0,1,1]


for an=1:100000;
  Th=(pi/180)*an;
  Th2=(pi/180)*an;
  R=[cos(Th),sin(Th),0;-sin(Th),cos(Th),0;0,0,1];
  R2=[cos(Th),sin(Th),0;-sin(Th),cos(Th),0;0,0,1];
  T=c*R;
  T2=c2*R2;
  
  a=an*3
  t=(pi/180)*a;
  r=[1,0,0;0,cos(t),sin(t);0,-sin(t),cos(t)];
  T2=c2*r;
  axis([-2 2 -2 2 0 2])
  pause(0.000000001) 
  plot3(T(:,1),T(:,2),T(:,3),T2(:,1),T2(:,2),T2(:,3),'Color','b')
    
endfor

  xlabel("Eje X");
  ylabel("Eje Y");
  zlabel("Eje Z");
  