%Este programa procesa una imagen binarizandola
%axel valenzuela
%01/03/2019
%UAEM Zumpango
%%I=imread('ckt-board.jpg');
disp('binarizacion de imagenes')
disp('=====================\n')
I=input('Escriba el nombre y extencion de la imagen(entre apostrofes)')
I=imread(I);
[r,c]=size(I);
G=uint8(zeros(r,c));
for i=1:r;
  for j=1:c;
    if (I(i,j)<64||I(i,j)>192)
      G(i,j)=uint8(255);
    else
      G(i,j)=255-I(i,j)+1;
    end
  end
end

figure
subplot(1,2,1);imshow(I)

subplot(1,2,2);imshow(G)