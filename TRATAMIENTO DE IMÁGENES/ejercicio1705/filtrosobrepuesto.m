% Entradas
clear all;
disp("==================================================================")
disp("==========Filtro Sobel==========")
ar=input('cual es la imagen a procesar (entre apostrofos)?');
I=imread(ar);
J=imread(aj);
alpha=0.3;
B=[0,-1,0;-1,-5,-1;0,-1,0];
[r,c]=size(I);
i=2:r-1;
j=2:c-1;

C(i,:)= alpha*I(i,j)+(1-alpha)*J(i,j);

