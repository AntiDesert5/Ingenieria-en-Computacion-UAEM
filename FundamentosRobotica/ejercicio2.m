 x=2.5
 y=4.9
 z=8.1
 A=[x;y;z;1]
 B=[0.9659,0,-0.2588,0;0,1,0,0;0.2588,0,0.9659,0;0,0,0,1]
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
