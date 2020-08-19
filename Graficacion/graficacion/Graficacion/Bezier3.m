#Ricardo Daniel Montiel Jacinto
clear all 
clc
clf
grid on 
#P=[-2,5;7,1;-4,-9;6,12]
t=0:0.01:1;
[P(:,1),P(:,2)]=ginput(4);
B3(:,1)=(1-t).^3*P(1,1)+(1-t).^2.*t*P(2,1)+(1-t).*t.^2*P(3,1)+t.^3+P(4,1)
B3(:,2)=(1-t).^3*P(1,2)+(1-t).^2.*t*P(2,2)+(1-t).*t.^2*P(3,2)+t.^3+P(4,2)
plot(B3(:,1),B3(:,2),'linewidth',3,'color','b')