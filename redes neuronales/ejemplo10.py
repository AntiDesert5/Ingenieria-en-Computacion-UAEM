# -*- coding: utf-8 -*-
"""
Created on Wed Nov  6 13:02:16 2019

@author: ico

ejemplo funcionamiento de red neuronal ejemplo 10
Entradas:3
capas ocultas
 primera:2 
 Segunda:4
Salida: 3
Funcion de activacion: logica
"""
def funcAct(x):
    return 1/(1+np.exp(-x))    
    
    
import numpy as np
x=np.array([.5,1])
x_ext=np.append(1,x)
W1 = 2.1*np.random.random([2,3])
#W1 = np.random.randint(1,4,[2,3])
f=funcAct(np.dot(W1,x_ext))
f1 = np.append(1,f)

W2=np.random.randn(4,3)
f = funcAct(np.dot(W2,f1))
f2=np.append(1,f)

W3 = np.random.randn(3,5)
y = funcAct(np.dot(W3,f2))
print(W1)
print(x_ext)
print(y) #resultado

