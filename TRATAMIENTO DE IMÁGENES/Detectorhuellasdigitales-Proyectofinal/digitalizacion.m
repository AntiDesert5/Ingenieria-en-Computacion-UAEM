% INICIO DE GUION EN MATLAB
%Cierra todas las ventanas emergentes, limpia la memoria y la pantalla
close all; clear; clc;
Ases = imread('aaa','jpeg'); %Lee la im�gen y la asocia a una matriz
G = fft2(Ases); %Calcula la transformada de fourier en 2D de la imagen
%[r,c]=size(G);
m(4) = mean(max(corr(G,G))); %Se compara la imagen consigo misma
% Con este for cargamos las imagenes, las procesamos y obtenemos un valor
% significativo
for n =1:3
nom_arch=['aaa', num2str(n)]; %esta cadena de caracteres cambia como lo hace n
Sosp =imread(nom_arch, 'jpeg'); %se carga la imagen a trabajar
F = fft2(Sosp); % se obtiene la trasformada de Fourier
m(n) = mean(max(corr(F,G))); % Se comparara la imagen con un est�ndar
%m(i).- Se guarda el valor del i-�simo sospechoso en la entrada m(i)
end

% Se define el contador x, para graficar
x = 1:4;
% Grafica de x, m. Utilizo puntos rojo y lineas verticales azules
h = stem(x,m,'fill','--');
set(get(h,'BaseLine'),'LineStyle',':')
set(h,'MarkerFaceColor','red')

%Formato de la gr�fica
xlabel('Etiqueta para el de sospechoso (n�mero)');
ylabel('Correlaci�n entre imagenes');
axis([0 14 0 1.1]);

% clear
% clc
%fin del script
