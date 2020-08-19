clear all 
clc
clf
w=0:0.1:2*pi;
u=0:0.1:3*pi;
[U,W]=meshgrid(u,w);
x=(sin(U)).*W;
y=(cos(W)).*U;
z=U.*W;

W1=ones(1,length(w))*pi/4;
#W1=pi/4;
x1=sin(W1).*u;
y1=cos(u).*W1;
z1=W1.*u;
surf(x,y,z)
hold on
figure 
plot3(x1,y1,z1,'linewidth',3,'Color','r')
figure 

surf(x,y,z)
hold on
plot3(x1,y1,z1,'linewidth',3,'Color','r')