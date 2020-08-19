clear
imagen=input("Ingrese la imagen a procesar: \n");
I=imread(imagen);
[r,c]=size(I);
G=uint8(zeros(3,3));
%prosedimiento
for i=2:r-1;
for j=2:c-1;
for m=-1:1;
  for n=-1:1;
        G(m+2,n+2)= I(i+m,j+n);
        
   %G(1,1)= I(i-1,j-1);
   %G(1,2)= I(i-1,j);
   %G(1,3)=I(i-1,j+1);
    
   %G(2,1)= I(i,j-1);  
   % G(2,2)=I(i,j)   ;
   % G(2,3)=I(i,j+1);
    
   % G(3,1)=I(i+1,j-1);
   % G(3,2)=I(i+1,j);
   % G(3,3)=I(i+1,j+1);
 H(i,j)=max(max(G));
end 
end
end
end 
figure
subplot(1,2,1);imshow(I)
subplot (1,2,2);imshow(H)  