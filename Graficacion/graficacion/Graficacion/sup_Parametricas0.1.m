clear all 
clc
w=0:0.001:2*pi;
u=0:0.001:3*pi;
[U,W]=meshgrid(u,w);
x=(sin(U)).*W;
y=(cos(W)).*U;
z=U.*W;

surf(x,y,z)