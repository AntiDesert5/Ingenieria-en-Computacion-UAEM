clc%Curva parametrica
clear all
t=0:0.01:1;
x=sin(2*pi*t);
y=12*t.^3-2*t.^2;
z=exp(sin(-2*pi*t));
plot3(x,y,z);