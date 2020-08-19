%Revolucion 
clear all 
clc
t=0:0.01:1;
P=[0,1,0;1,1,0;2,2,0;1.5,3,0;1.5,5,0];
X=4*t-6*t.^3+2*t.^2+(7/2)*t.^4;
Y=-4*(t-1).^3.*t+12*(t-1).^2.*t.^2*2-12*(t-1).*t.^3+5*t.^4+(t-1).^4;
Z=zeros(length(t),1);
Pt=[X',Y',Z]
%plot(X,Y,Z)
for th=0:0.01:2*pi
  hold on
  Ry=[cos(th),0,sin(th);0,1,0;-sin(th),0,cos(th)];
  S=Pt*Ry;
  pause(0.01)
  plot3(S(:,1),S(:,2),S(:,3),'Color','k');
endfor
