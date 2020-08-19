%curvas con dos parametros


t=0:0.1:2*pi;

for i=1:100;
  x=cos(T+i).*U;
  y=sin(U+i).*cos(T);
  z=2*U.*T;
  pause(0.0005)
  surf(x,y,z,'LineWidth',3);
endfor