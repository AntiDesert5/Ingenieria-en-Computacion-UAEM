clear all
clc
x= 0:0.1:3;
y=-2:0.1:1;
[X,Y]=meshgrid(x,y);
Z=X.*Y.^2;
surf(X,Y,Z)