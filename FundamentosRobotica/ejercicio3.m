 x=4.8
 y=6.3
 z=-9.2
 A=[x;y;z;1]
 B=[1,0,0,3.9;0,1,0,-5.7;0,0,1,9;0,0,0,1]
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
axis([0 4 -5 7 -11 10])
