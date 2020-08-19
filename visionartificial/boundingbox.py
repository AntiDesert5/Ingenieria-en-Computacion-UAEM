import cv2
import numpy as np
  
#Iniciamos la camara
captura = cv2.VideoCapture(0)
 
# Parametros para la funcion de Lucas Kanade
lk_params = dict( winSize  = (15,15),
                  maxLevel = 2,
                  criteria = (cv2.TERM_CRITERIA_EPS | cv2.TERM_CRITERIA_COUNT, 10, 0.03))
 
#Capturamos una imagen y la convertimos de RGB -> HSV
_, imagen = captura.read()
hsv = cv2.cvtColor(imagen, cv2.COLOR_BGR2HSV)
 
 
#Convertimos la imagen a gris para poder introducirla en el bucle principal
frame_anterior = cv2.cvtColor(imagen, cv2.COLOR_BGR2GRAY)
 
 
#El programa buscara automaticamente 25 puntos adecuados para trackear
punto_elegido = cv2.goodFeaturesToTrack(frame_anterior,25,0.01,10)
 
  
while(1):
      
    #Capturamos una imagen y la convertimos de RGB -> GRIS
    _, imagen = captura.read()
    frame_gray = cv2.cvtColor(imagen, cv2.COLOR_BGR2GRAY)
 
    #Se aplica el metodo de Lucas Kanade
    punto_elegido, st, err = cv2.calcOpticalFlowPyrLK(frame_anterior, frame_gray, punto_elegido, **lk_params)
 
    #Pintamos el centro (lo hacemos con un bucle por si, por alguna razon, decidimos pintar mas puntos)
    for i in punto_elegido:
          cv2.circle(imagen,tuple(i[0]), 3, (0,0,255), -1)
 
    #Se guarda el frame de la iteracion anterior del bucle
    frame_anterior = frame_gray.copy()
      
    #Mostramos la imagen original con la marca del centro
    cv2.imshow('Camara', imagen)
    tecla = cv2.waitKey(5) & 0xFF
    if tecla == 27:
        break
  
cv2.destroyAllWindows()