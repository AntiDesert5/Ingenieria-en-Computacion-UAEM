 x=35.3;
 y=32.1;
 z=40;
 ang=79;
 A=[x;y;z;1]
 B=[cos(ang),0,sin(ang),33.2;0,1,0,(9.3*cos(ang))-(17.4*sin(ang));-sin(ang),0,cos(ang),(9.3*sin(ang))+(17.4*cos(ang));0,0,0,1]
 Res=B * A
 Res(4,:)=[]
 Res1=[Res(1,:)]
 Res2=[Res(2,:)]
 Res3=[Res(3,:)]
 
 plot3([x,y,z],[Res1,Res2,Res3] ,".b")
# plot3(Res(3,:),".r","LineWidth",50)|
xlabel("X")
ylabel("Y")
zlabel("Z")

