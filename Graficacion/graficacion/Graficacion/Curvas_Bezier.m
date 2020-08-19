 #curvas de Bezier 
 clear all
 clc
 T = 0:0.01:1;
 P=[1,5;5,14;-3,2;];
 Bx2=(1-T).^2*P(1,1)+2*(1-T).*T*P(2,1)+T.^2*P(3,1);
 By2=(1-T).^2*P(1,2)+2*(1-T).*T*P(2,2)+T.^2*P(3,2);
line(P(:,1),P(:,2),'linewidth',3,'color','k');
hold on 
plot(Bx2,By2,'linewidth',3,'color','r');