    # -*- coding: utf-8 -*-
"""
Created on Wed Oct  9 12:05:09 2019
Ejemplo de una neurona simple
@author: ico
"""
import numpy as np
import pandas as pd
class MyNeuron:
    def training(self,X,Y):
        W=np.array([np.random()])
        #inicializar w con valores pseudo-aleatorios
        #nota: Dimensiones de w son el numero de colunas
        #de X mas 1
        """
        2) agregar una columna de unos a la matriz X
        3) for i=1 to N (N vale 20)
            for cada elemento de X 
            calcular W'x
            if el producto anterior es positivo
                y=1
            else 
                y=0
            W=w+(yi-y)*x
        
        """
        
    W=np.array([-100,100/6])
    #constructor
    def __init__(self,funcActivation):
        self.funcAct=funcActivation
    #Predice si aprueba o no
    def predict(self,nuevaCalif):
        x=np.array([1, nuevaCalif])
        y=np.dot(self.W,x)
        if self.funcAct=="heaviside":
            return self.heaviside(y)
        if self.funcAct=="tanh":
            return self.tanh(y)
        if self.funcAct=="sigmoid":
            return self.sigmoid(y)
        clf.training(x,y)
        
    #funciones activación
    def heaviside(self,x):
        datos=pd.read_csv('datosKnn.cvs')
        if x>=0:
            return 1#aprobado
        else:
            return -1#no aprobado
    def tanh(self,x):
        return np.sinh(x)/np.cosh(x)
    def sigmoid(self,x):
        return 1/(1+np.exp(-x))
    
clf=MyNeuron("sigmoid")
for i in np.linspace(0,10,11):
    print ("Calificacion= "+str(i)+"prediccion: "+ str(clf.predict(i)))

