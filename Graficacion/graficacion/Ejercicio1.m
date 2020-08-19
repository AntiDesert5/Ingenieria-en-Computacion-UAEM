clear all
P=[6,-6];
Q=[-4,7];
R=[-3,-1];
h=[P;Q;R;P];
plot(h(:,1),h(:,2),'LineWidth',3);
grid on

r=[6-2,-6+3];
l=[-4-2,7+3];
n=[-3-2,-1+3];
k=[r;l;n;r];


plot(k(:,1),k(:,2),'LineWidth',3)