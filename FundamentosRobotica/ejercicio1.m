 x=3.5
 y=6.4
 z=9.1
 A=[x;y;z;1]
 B=[1,0,0,0;0,cos(75),-sin(75),0;0,sin(75),cos(75),0;0,0,0,1]
 Res=B * A
 Res(4,:)=[];
 Res1=[Res(1,:)];
 Res2=[Res(2,:)];
 Res3=[Res(3,:)];
 
 plot3(Res1,Res2,Res3,".b")
 #plot3(Res(3,:),".r","LineWidth",50)
xlabel("X")
ylabel("Y")
zlabel("Z")
