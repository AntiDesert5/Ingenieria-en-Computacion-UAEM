c=[6,-6;-4,7;-3,-1;6,-6]
f=x+12;

for i=0:100
  m=i/100;
  for x=1:4
    R(x,1)=(1-m)*c(x,1)+m*(c+12)(x,1);
    R(x,2)=(1-m)*c(x,2)+m*(c+12)(x,2);
   
  endfor
   axis([-15 20 -15 20])
    pause(0.01)
    plot(R(:,1),R(:,2))
endfor
