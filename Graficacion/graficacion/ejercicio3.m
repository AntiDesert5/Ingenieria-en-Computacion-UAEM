
clear all;
#t=0:0.1:2*pi+0.1;
#u=0:0.1:2*pi+0.1;
#R=3;
#[T,U]=meshgrid(t,u);
for i=1:30;
P=[6,-6];
Q=[-4,7];
R=[-3,-1];
t=[P+i;Q+i;R+i;P+i]
plot(t(:,1),t(:,2),'LineWidth',3)
pause(0.01);
end