R=3;
v=pi/2:0.1:2*pi/2;
u=0:0.1:(2*pi)+0.1;
[U,V]=meshgrid(u,v);

Su=(-R*sin(u)*cos(v),R*cos(u)*cos(v),0)
Sv=(-R*cos(u)*sin(v),-R*sin(u)*sin(v),R+cos(v))