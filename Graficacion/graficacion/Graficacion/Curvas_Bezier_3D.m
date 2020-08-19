#Ricardo Daniel Montiel Jacinto
clear all 
clc

t=0:0.01:1;

P=[10,0,0;0,4.5,6;10,9,0]

for y=0.01:100
  i=0.01*y
  
  
  B3(:,1)=(1-t).^2.*P(1,1)+i+(1-t).*t.*P(2,1)+i+t.^2*P(3,1)+i;
  B3(:,2)=(1-t).^2.*P(1,2)+i+(1-t).*t.*P(2,2)+i+t.^2*P(3,2)+i;
  B3(:,3)=(1-t).^2.*P(1,3)+i+(1-t).*t.*P(2,3)+i+t.^2*P(3,3)+i;
  
  pause(0.0001)
  hold on 
  
  plot3(B3(:,1),B3(:,2),B3(:,3),'linewidth',3)
  plot3(B3(:,1),B3(:,2),B3(:,3),'linewidth',3)

endfor

  axis(10,10,10,10,10,10)
xlabel('X');
ylabel('Y');
zlabel('Z');
