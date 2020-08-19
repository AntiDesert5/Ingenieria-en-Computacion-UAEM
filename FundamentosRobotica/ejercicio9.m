 x=0;
 y=0;
 z=0;
 ang=-34;
 A=[x;y;z;1]
 B=[cos(ang),0,sin(ang),5.6;0,1,0,3.6;-sin(ang),0,cos(ang),5.9;0,0,0,1];
 C=B * A;
 D=[1,0,0,0;0,cos(78),-sin(78),0;0,sin(78),cos(78),0;0,0,0,1];
 Res=D*C
 Res(4,:)=[]
 Res1=[Res(1,:)]
 Res2=[Res(2,:)]
 Res3=[Res(3,:)]
 
 plot3([x,y,z],[Res1,Res2,Res3] ,".b")
#plot3(Res(3,:),".r","LineWidth",50)|
xlabel("X")
ylabel("Y")
zlabel("Z")

