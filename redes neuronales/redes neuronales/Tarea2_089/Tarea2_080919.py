# -*- coding: utf-8 -*-
"""
@author: axel valenzuela
"""

from MyKnn import MyKnn
import numpy as np
import pandas as pd
K=0
#se pide un digito para saber de que manera se calculara la distancia
print("1.- Distancia euclidean")
print("2.- Distancia manhattan")
opc=input("Ingrese tipo de distancia: ")#se ingresa el tipo de distancia manhattan o euclidean
#Condiciones para saber cual distancia hacer
if(opc==1):
    dato="euclidean"
if(opc==2):
    dato="manhattan"
a=input("Ingrese coordenada x: ")
b=input("Ingrese coordenada y: ")
distance=dato
#nuevo_dato=np.array([1,-4])
nuevo_dato=np.array([1,-4])
datos=pd.read_csv('datosKnn.cvs')

X=datos.iloc[:,range(0,2)]
clases = datos.iloc[:,2]
K=int(np.round(len(datos)*0.3))#calculo valor de k sacando el tamaño de el dataframe y despues multiplicandolo por 0.3 para obtener el 30%
#es necesario redondear en este caso redondeare hacia arriba
clf=MyKnn()
pred=clf.classify(X,clases,nuevo_dato,K,distance)
print("prediccion es: ")
print(pred)
#no supe como sacar la precision profe , perdon xd