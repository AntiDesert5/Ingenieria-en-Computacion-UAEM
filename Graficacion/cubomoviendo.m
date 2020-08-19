clear
x=[1 5]; y=[1 5]; z=[1 5];
X=[x(1) x(2) x(2) x(1) x(1) x(1) x(1) x(2) x(2) x(1)]; 
Y=[y(1) y(1) y(2) y(2) y(1) y(1) y(2) y(2) y(1) y(1)];
Z=[z(1) z(1) z(1) z(1) z(1) z(2) z(2) z(2) z(2) z(2)];
figure(gcf)
plot3(X,Y,Z)
hold on
X1=[x(1) x(1) x(2) x(2) x(1) x(1) x(1) x(2) x(2) x(1)]; 
Y1=[y(1) y(1) y(1) y(1) y(1) y(2) y(2) y(2) y(2) y(2)];
Z1=[z(1) z(2) z(2) z(1) z(1) z(1) z(2) z(2) z(1) z(1)];
plot3(X1,Y1,Z1)
text(x(1), y(1), z(1),'F'), text(x(1), y(1), z(2),'B')
text(x(2), y(1), z(2),'A'), text(x(2), y(1), z(1),'E')
text(x(1), y(2), z(1),'G'), text(x(1), y(2), z(2),'C')
text(x(2), y(2), z(2),'D'), text(x(2), y(2), z(1),'H')


hold off
axis([ x(1)-1 x(2)+1 y(1)-1 y(2)+1 z(1)-1 z(2)+1])
ylabel('eje y')
zlabel('eje z')
xlabel('eje x')
axis('square')
view(66,34) % para ver el aguno de visualizacion.
