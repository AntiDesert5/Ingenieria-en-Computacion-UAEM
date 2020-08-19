clear all
clc
R=5;
r=2;
v=0:0.1:2*pi+1;
u=0:0.1:2*pi+1;
[U,V]=meshgrid(u,v)
S1=(R+r*cos(U)).*cos(V);
S2=(R+r*cos(U)).*sin(V);
S3=R*sin(U);
surf(S1,S2,S3);