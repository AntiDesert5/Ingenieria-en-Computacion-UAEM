 #curvas de Bezier Animado
 clear all
 clc
 T = 0:0.01:1;
 P=[1,7;5,4;-3,3];
 Q=[1,5;8,4;-3,2];
 Bx2=(1-T).^2*P(1,1)+2*(1-T).*T*P(2,1)+T.^2*P(3,1);
 By2=(1-T).^2*P(1,2)+2*(1-T).*T*P(2,2)+T.^2*P(3,2);
 
 B1=(1-T).^2*Q(1,1)+2*(1-T).*T*Q(2,1)+T.^2*Q(3,1);
 B2=(1-T).^2*Q(1,2)+2*(1-T).*T*Q(2,2)+T.^2*Q(3,2);
 
 hold on 
 for t=1:lenght(t)
   (1-i)*By2*(i,1)+i*
   plot(Bx2,By2,'linewidth',3,'color','k');
 endfor
 
 line(Bx2,By2,'linewidth',3,'color','k');
 hold on 
 line(B1,B2,'linewidth',3,'color','r');