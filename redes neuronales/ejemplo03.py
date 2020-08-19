# -*- coding: utf-8 -*-
"""
Created on Wed Aug 21 12:12:54 2019

@author: ico
"""

lista1=[8,7,4]
import numpy as np
np.array(lista1)#crea arreglo np a partir de una lista
np.arange(6)
v1 = np.arange(4)
v1.shape#dimensiones del arreglo
type(v1)#tipo de dato
v1.size#Numero elementos

v2 = np.zeros((4,1))#matriz de 0
v3 = np.ones((4,1))#matriz de 1
print(v2)
print(v3)

v4=np.full((4,1),5)#Crea arreglo con un valor dado
print(v4)
v5 = 15*np.random.random((4,1))
sigma2 = 0.8
mu = 7
v6 = np.sqrt(sigma2)*np.random.randn(15,1)+mu#
suma=np.add(v3,v4)#usa targeta grafica
np.subtract(v4,v3)
producto=np.multiply(v3,v4)
raiz=np.sqrt(v3)
