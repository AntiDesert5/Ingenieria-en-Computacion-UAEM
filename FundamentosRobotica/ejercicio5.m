 x=0;
 y=0;
 z=0;
 ang=-45;
 A=[x;y;z;1]
 B=[cos(ang),-sin(ang),0,4;sin(ang),cos(ang),0,6;0,0,1,10.5;0,0,0,1]
 C=[cos(50),0,sin(50),0;0,1,0,0;-sin(50),0,cos(50),0;0,0,0,1]
 S=B * A
 Res=C*S
 Res(4,:)=[]
 Res1=[Res(1,:)]
 Res2=[Res(2,:)]
 Res3=[Res(3,:)]
 
 plot3([x,y,z],[Res1,Res2,Res3] ,".b")
# plot3(Res(3,:),".r","LineWidth",50)
xlabel("X")
ylabel("Y")
zlabel("Z")

