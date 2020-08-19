clc
clear all
t=0:0.01:2*pi;
x=3*sin(t);
y=2*cos(t);
pt=[3*cos(pi/4),2*sin(pi/4)];

T=[-1.5*sin(pi/4),cos(pi/4)]
N=[-cos(pi/4),-sin(pi/4)];
t1=0:0.01:1;
it(:,1)=pt(:,1)+t1*T(:,1);
it(:,2)=pt(:,2)+t1*T(:,2);
in(:,1)=pt(:,1)+t1*N(:,1);
in(:,2)=pt(:,2)+t1*N(:,2);
plot(x,y,'b');
grid on 
hold on 
line(it(:,1),it(:,2),'Color','red')
plot(pt(1,1),pt(1,2),'r:o');
plot(in(1,1),in(1,2),'Color','black');