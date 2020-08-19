clc%Recta parametrica
clear all
P=[-2,3;4,5;7,-4;-2,3];
Q=P+12;


for t=0:100
  q=t/100;
  for i=1:4
    R(i,1)=(1-q)*P(i,1)+q*Q(i,1);
    R(i,2)=(1-q)*P(i,2)+q*Q(i,2);
  endfor
  line(R(:,1),R(:,2))
  pause(0.0001)  
  
endfor

