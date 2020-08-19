 x=12.4;
 y=32.1;
 z=9.8;
 ang=54;
 A=[x;y;z;1]
 B=[cos(ang),-sin(ang),0,(8.6*cos(ang))-(13.97*sin(ang));sin(ang),cos(ang),0,(8.6*sin(ang))+(13.97*cos(ang));0,0,1,65.8;0,0,0,1]
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

