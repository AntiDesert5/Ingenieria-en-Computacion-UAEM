clear all;
p=[2,3;1/2,7/2;-1,4;5,-2;2,3]
c=[1/2,7/2]

plot(p(:,1),p(:,2),'LineWidth',3)
hold on
plot(c(1,1),c(1,2),'r.*')