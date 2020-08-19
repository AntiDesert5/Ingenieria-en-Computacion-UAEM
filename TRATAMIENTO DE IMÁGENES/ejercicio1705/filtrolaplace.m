
%tratamiento de imagenes detecciond e ejes
% Filtro Sobel
% Martin Marquez Cervantes


% Entradas
clear all;
disp("==================================================================")
disp("==========Filtro Sobel==========")
ar=input('cual es la imagen a procesar (entre apostrofos)?');
I=imread(ar);
B=[0,-1,0;-1,-5,-1;0,-1,0];
%[r,c]=size(I);

I1=I(:,:,1);
[m,n]=size(I1);
I2=I(:,:,2);
[s,e]=size(I2);
I3=I(:,:,3);
[r,c]=size(I3);
 
% Haciendola funcion


i=2:m-1;
j=2:n-1;
    G(i,j)= I1(i-1,j-1)*B(1,1)  + I1(i-1,j)*B(1,2) +  I1(i-1,j+1)*B(1,3)+...
            I1(i,j-1)*B(2,1)    + I1(i,j)*B(2,2)   +  I1(i,j+1)*B(2,3)+...
            I1(i+1,j-1)*B(3,1)  + I1(i+1,j)*B(3,2) +  I1(i+1,j+1)*B(3,3); 
           M1(i,j) =  5*I1(i,j)-[I1(i+1,j)+I1(i-1,j)+I1(i,j+1)+I1(i,j-1)];
i=2:s-1;
j=2:e-1;
    G(i,j)= I2(i-1,j-1)*B(1,1)  + I2(i-1,j)*B(1,2) +  I2(i-1,j+1)*B(1,3)+...
            I2(i,j-1)*B(2,1)    + I2(i,j)*B(2,2)   +  I2(i,j+1)*B(2,3)+...
            I2(i+1,j-1)*B(3,1)  + I2(i+1,j)*B(3,2) +  I2(i+1,j+1)*B(3,3); 
           M2(i,j) =  5*I2(i,j)-[I2(i+1,j)+I2(i-1,j)+I2(i,j+1)+I2(i,j-1)];
i=2:r-1;
j=2:c-1;          
    G(i,j)= I3(i-1,j-1)*B(1,1)  + I3(i-1,j)*B(1,2) +  I3(i-1,j+1)*B(1,3)+...
            I3(i,j-1)*B(2,1)    + I3(i,j)*B(2,2)   +  I3(i,j+1)*B(2,3)+...
            I3(i+1,j-1)*B(3,1)  + I3(i+1,j)*B(3,2) +  I3(i+1,j+1)*B(3,3); 
       M3(i,j) =  5*I3(i,j)-[I3(i+1,j)+I3(i-1,j)+I3(i,j+1)+I3(i,j-1)];
 Y=cat(3,M2,M1,M3);
% Aplicacion del filtro



% Salidas
subplot(1,2,1); imshow(I)
subplot(1,2,2);imshow(Y)