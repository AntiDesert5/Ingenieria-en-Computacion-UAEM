# -*- coding: utf-8 -*-
"""
@author: axel valenzuela
"""
import numpy as np
class MyKnn:
    #datos es una matriz de numpy
    #nuevo dato es un vector de numpy
    #K es el numero de vecinos mas cercano
    #distance es una cadena indicando la distancia a usar: euclidian,manhattan,mahalanobbis, cosine,etc
    def classify(self,datos,clases,nuevo_dato,K,distance):#self palabra reservada en ves de this
        N=datos.shape[0]
        x=nuevo_dato
        distancias=[]
        #calcula las distancias
        #argsort regresa los elementos ordenados conforme el indice 
        for m in range(0,N):
            y=datos.iloc[m,:]
            if distance=="euclidean":
                distancias.append(self.euclidianDistance(x,y))#agregar a lista append
            if distance=="manhattan":#se manda a llamar a la funcion manhattan
                distancias.append(self.manhattanDistance(x,y))
        #
        indices = np.argsort(distancias)
        #piensa acerca de esto
        uno=0
        cero=0
        for i in range(0,K):
            j=indices[i]
            if clases[j]==0:
               cero=cero +1
            elif clases[j]==1:
                uno=uno+1
        if cero > uno:
            return 0
        if uno> cero:
            return 1
               
    #x, y son vectores numpy
    def euclidianDistance(self,x,y):
       return np.sqrt(np.sum(np.power( np.subtract(x,y),2.0)))
   #funcion para calcular distancia manhattan
    def manhattanDistance(self,x,y):
        return np.sum(np.absolute(np.subtract(x,y)))
        