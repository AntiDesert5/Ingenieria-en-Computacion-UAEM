x=0:0.1:2*pi;
y=-pi:0.1:pi;
r=5;
[X,Y]=meshgrid(x,y)
s1=r*cos(X).*cos(Y);
s2=r*sin(X).*cos(Y);
s3=r*sin(Y);
#surf(s1,s2,s3)

X1=0:0.1:2*pi
Y1=-pi:0.1:pi
r=5

s11=r*sin(X1);
s21=r*sin(X1);
s31=r*cos(X1)

#figure
##plot3(s11,s21,s31,'linewidth',3,'Color','r')


for an=1:100;
  Th=(pi/180)*an;
  R=[cos(Th),sin(Th),0;-sin(Th),cos(Th),0;0,0,1];
  s4=s31.*R;
  pause(0.000000001) 
  plot3(s4(:,1),s4(:,2),s4(:,3),'Color','b')
    
endfor

#for i=0:0.1:1
#  zr=[cos(i),-sen(i),0;sin(i),cos(i),0;0,0,1];
#  s11=r*sin(X1)*z1;
#  s21=r*sin(X1)*z1;
#  s31=r*cos(X1)*z1;
#  figure
#  pause(0.01)
#  surf(s1,s2,s3)
#  hold on
#  plot3(s11,s21,s31,'linewidth',3,'Color','r')
#endfor


