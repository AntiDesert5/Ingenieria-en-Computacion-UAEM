# -*- coding: utf-8 -*-
"""
Created on Thu Sep 19 20:34:19 2019

@author: Valenzuela
"""
import numpy as np
import cv2
from matplotlib import pyplot as plt
img = cv2.imread('fut.jpg',0)
dft = cv2.dft(np.float32(img),flags = cv2.DFT_COMPLEX_OUTPUT)
dft_shift = np.fft.fftshift(dft)
magnitude_spectrum = 20*np.log(cv2.magnitude(dft_shift[:,:,0],dft_shift[:,:,1]))
plt.subplot(121),plt.imshow(img, cmap = 'gray')
plt.title('Imagen de entrada'), plt.xticks([]), plt.yticks([])
plt.subplot(122),plt.imshow(magnitude_spectrum, cmap = 'gray')
plt.title('FFT'), plt.xticks([]), plt.yticks([])
plt.show()
