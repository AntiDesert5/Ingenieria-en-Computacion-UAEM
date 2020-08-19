%axel valenzuela
%08/03/2019
%UAEM Zumpango
clf
%proceso
I=input("cual es la imagen a procesar: ");
I=imread(I);
[r,c]=size(I);
%G=zeros(r,c);
P=(1/5)*[0,1,0;1,1,1;0,1,0];
O=[-1,-1,-1;-1,9,-1;-1,-1,-1];
%prosedimiento
i=2:r-1;
j=2:c-1;
    G(i,:)=  I(i-1,j-1)*P(1,1)+ I(i-1,j)*P(1,2)+ I(i-1,j+1)*P(1,3)+...
             I(i,j-1)  *P(2,1)+ I(i,j)  *P(2,2)+ I(i,j+1)  *P(2,3)+...
             I(i+1,j-1)*P(3,1)+ I(i+1,j)*P(3,2)+ I(i+1,j+1)*P(3,3);
             
    Y(i,:)=  I(i-1,j-1)*O(1,1)+ I(i-1,j)*O(1,2)+ I(i-1,j+1)*O(1,3)+...
             I(i,j-1)  *O(2,1)+ I(i,j)  *O(2,2)+ I(i,j+1)  *O(2,3)+...
             I(i+1,j-1)*O(3,1)+ I(i+1,j)*O(3,2)+ I(i+1,j+1)*O(3,3);


%Salidas
figure
subplot(1,3,1);imshow(G)



subplot(1,3,2);imshow(I)
subplot(1,3,3);imshow(Y)