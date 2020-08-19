clear all
t=0:0.01:2*pi;
r=2;
x=r*cos(t);
y=3*sin(t);
plot(x,y,"Linewidth",3,'Color','red')
grid on
pt=[2*cos(pi/4),3*sin(pi/4)];
T=[-2*sin(pi/4),3*cos(pi/4)];
t1=0:0.01:1;
it(:,1)=pt(:,1)+t1*T(:,1);
it(:,2)=pt(:,2)+t1*T(:,2);
hold on
plot(pt(1,1),pt(1,2),'g:*',"Linewidth",5)
line(it(:,1),it(:,2),"Linewidth",3,'color','b')

