 x=45.3
 y=34.6
 z=56.7
 ang=88;
 A=[x;y;z;1]
 B=[cos(ang),0,sin(ang),0;0,1,0,0;-sin(ang),0,cos(ang),0;0,0,0,1]
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
