
t=0:0.01:2*pi;
r=2;
x=r*cos(t);
y=r*sin(t);
plot(x,y,"Linewidth",3,'Color','blue')
grid on
#pt=[r*cos(pi/4),r*sin(pi/4);-sin(pi/4),cos(pi/4)]
pt=[r*cos(pi/4),r*sin(pi/4)];
T=[-sin(pi/4),cos(pi/4)];
t1=0:0.01:1;
N=[-cos(pi/4),-sin(pi/4)];#
it(:,1)=pt(:,1)+t1*T(:,1);
it(:,2)=pt(:,2)+t1*T(:,2);
ln(:,1)=pt(:,1)+t1*N(:,1);#
ln(:,2)=pt(:,2)+t1*N(:,2);#
#pt=[sqrt(2),sqrt(2)];
hold on
plot(pt(1,1),pt(1,2),'g:*',"Linewidth",5)
#line(pt(:,1),pt(:,2))
line(it(:,1),it(:,2),"Linewidth",3,'color','r')
line(ln(:,1),ln(:,2),"Linewidth",3,'color','g')#
#pt=[r*cos(pi/4),r*sin(pi/4),'r:*'];
#plot(pt(1,1),pt(1,2),'r:*')
#clf
#plot(x,y,"Linewidth",3,'Color','blue')