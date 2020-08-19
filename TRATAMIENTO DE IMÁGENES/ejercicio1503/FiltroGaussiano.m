%filtros gaussiano
%Axel valenzuela
%15/03/2019
%ICO
%UAEM Zumpango
%proceso
function FiltroGaussiano();
disp("==========================")
disp("=====FiltroGaussiano======")
archivo=input("nombre del archivo del la imagen:");
I=imread(archivo);
[r,c]=size(I);
G=zeros(5,5);
sig=1;
SUM=0;
for x=-2:2;
  for y=-2:2;
    G(x+3,y+3)=exp(-(x^2+y^2)/(2*sig^2));
    SUM=SUM+G(x+3,y+3);
  end
end

G=G/SUM;
%aplicacion del filtro
i=3:r-2;
  j=3:c-2;
  H(i,j)=I(i-2,j-2)*G(1,1)+I(i-2,j-1)*G(1,2)+I(i-2,j)*G(1,3)+I(i-2,j+1)*G(1,4)+I(i-2,j+2)*G(1,5)+...
         I(i-1,j-2)*G(2,1)+I(i-1,j-1)*G(2,2)+I(i-1,j)*G(2,3)+I(i-1,j+1)*G(2,4)+I(i-1,j+2)*G(2,5)+...
         I(i  ,j-2)*G(3,1)+I(i  ,j-1)*G(3,2)+I(i  ,j)*G(3,3)+I(i  ,j+1)*G(3,4)+I(i  ,j+2)*G(3,5)+...
         I(i+1,j-2)*G(4,1)+I(i+1,j-1)*G(4,2)+I(i+1,j)*G(4,3)+I(i+1,j+1)*G(4,4)+I(i+1,j+2)*G(4,5)+...
         I(i+2,j-2)*G(5,1)+I(i+2,j-1)*G(5,2)+I(i+2,j)*G(5,3)+I(i+2,j+1)*G(5,4)+I(i+2,j+2)*G(5,5)+...
subplot(1,2,1);imshow(I);
subplot(1,2,2);imshow(H);
imwrite(H,'clean.jpg');
