 x=0;
 y=0;
 z=0;
 ang=-78;
 A=[x;y;z;1]
 B=[cos(ang),-sin(ang),0,31.3;sin(ang),cos(ang),0,51.2;0,0,1,98.3;0,0,0,1];
 C=B * A;
 D=[cos(120),0,sin(120),0;0,1,0,0;-sin(120),0,cos(120),0;0,0,0,1];
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

