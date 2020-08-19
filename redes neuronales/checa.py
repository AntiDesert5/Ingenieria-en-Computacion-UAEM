# -*- coding: utf-8 -*-
"""
Created on Fri Aug 23 19:49:23 2019

@author: Valenzuela
"""

import numpy as np
#creo numeros aleatorios
B=10*np.random.random((10,2))
import matplotlib.pyplot as plt
pr=10*np.random.random((1,1))

for i in range(0,10):
    d=np.sqrt(np.sum(np.power(np.subtract(B[i],pr),2.0)))  
    if(i==0):
        ro=[[d,i]]       
    if(i!=0):
        ro+=[[d,i]]
        
ro.sort()#ordena los datos para saber el mas cercano
print("los tres puntos mas cercanos son:")
for i in range(0,3):
    print("*",i+1,B[(ro[i][1]),:])#imprimo el arreglo original en el orden dado por sort 
#grafico
plt.plot(B[:,1],B[:,0],'ro')
plt.plot(pr[0],pr[0],'b*')
plt.axis([0,10,0,10])
plt.grid(True)
plt.show()