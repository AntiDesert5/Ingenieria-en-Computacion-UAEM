clc%Recta parametrica
clear all
t=0:0.0025:1;
P=[-2,3;4,5];

for i=1:length(t)
  
  R(i,1)=(1-t(i))*P(1,1)+t(i)*P(2,1);
  R(i,2)=(1-t(i))*P(1,2)+t(i)*P(2,2);
  plot(R(i,1),R(i,2),'r:*')
  hold on
  axis([-2 12 2 8])
  pause(0.001)  
  
endfor

