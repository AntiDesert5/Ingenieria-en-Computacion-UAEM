#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Aug 29 14:06:45 2019

@author: AntonioLagunasHernandez
"""

import cv2
import numpy as np

cap =  cv2.VideoCapture(1)

while(1):
    _,frame = cap.read()
    grayImage = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
    output = frame.copy()
    circles = cv2.HoughCircles(grayImage, cv2.HOUGH_GRADIENT,2.400,
                               param1 = 50,
                               param2 = 30,
                               minradius = 100,
                               maxradius = 300)
circles = np.uint16(np.around(circles))

for cirucloActual in circles[0,:]:
    centroX = cirucloActual[0]
    centroY = cirucloActual[1]
    radio = cirucloActual[2]
    cv2.circle(output, (centroX, centroY), radio(0,255,255), 10)

cv2.imshow('Video', output)
k = cv2.waitKey(30) & 0xFF
if k==27:
   break
cap.release()
cv2.destroyAllWindows()