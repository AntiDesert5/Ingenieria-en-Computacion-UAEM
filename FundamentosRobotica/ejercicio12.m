 x=43.2
 y=65.4
 z=31.2
 ang=-17;
 A=[x;y;z;1]
 B=[1,0,0,0;0,cos(ang),-sin(ang),0;0,sin(ang),cos(ang),0;0,0,0,1]
 Res=B * A
 Res(4,:)=[]
 Res1=[Res(1,:)]
 Res2=[Res(2,:)]
 Res3=[Res(3,:)]
 
 plot3([x,y,z],[Res1,Res2,Res3],".b")
 #plot3(Res(3,:),".r","LineWidth",50)
xlabel("X")
ylabel("Y")
zlabel("Z")

