# -*- coding: utf-8 -*-
"""
Created on Thu Aug 29 18:40:47 2019

@author: Valenzuela
"""

#deteccion de lineas
#se necesita convertir imagen a escala de grises y detectar bordes
import cv2
import numpy as np

img = cv2.imread('sodoku.png')
gray = cv2.cvtColor(img,cv2.COLOR_RGB2GRAY)
edges = cv2.Canny(gray, 50, 150, apertureSize = 3)

lines = cv2.HoughLines(edges, 1, np.pi/180, 200)

for line in lines:
    rho, theta = line[0]
    a = np.cos(theta)
    b = np.sin(theta)
    x0 = a*rho
    y0 = b*rho
    x1 = int(x0 + 1000*(-b))
    y1 = int(y0 + 1000*(a))
    x2 = int(x0 - 1000*(-b))
    y2 = int(y0 - 1000*(a))

    cv2.line(img, (x1,y1), (x2,y2), (0, 0, 255), 1, cv2.LINE_AA)

cv2.imshow('Bordes de Imagen', edges)
cv2.imshow('Detector de Lineas', img)
cv2.waitKey()