# -*- coding: utf-8 -*-
"""
Created on Thu Aug 29 14:40:57 2019

@author: Valenzuela
"""
import cv2
import numpy as np

img = cv2.imread('sodoku.png')
cap =  cv2.VideoCapture(1)
gray = cv2.cvtColor(cap,cv2.COLOR_RGB2GRAY)
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

    cv2.line(cap, (x1,y1), (x2,y2), (0, 0, 255), 1, cv2.LINE_AA)

cv2.imshow('Bordes de Imagen', edges)
cv2.imshow('Detector de Lineas', cap)
cv2.waitKey()