# -*- coding: utf-8 -*-
"""
Created on Sun Oct 13 20:45:35 2019

@author: Valenzuela
"""

import numpy as np
import pandas as pd
class MyNeuron:
    def training(self,x,Y,k,c):
        W=np.array(np.random.random((k+1,1)))
        Wt=np.transpose(W)
        b = np.ones((23,1))
        l=np.append(b,x,axis = 1)#se agrego columna de 1 al principio en b
        l[1,range(0,3)]#metemos la primer fila en d
        np.dot(Wt,l[0,range(0,3)])
        for i in range(1,20):
            for j in range(0,22):
                if(np.dot(Wt,l[j,range(0,3)])>=0):
                    y=1
                else:
                    y=0
                Wt=Wt+((c[j]-y)*l[j,range(0,3)])
                print (Wt)
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
        datos=pd.read_csv('training.csv')
        N=int(np.round(len(datos)))#numero de filas
        datos1=np.zeros((N, 1))
        #x=datos.iloc[:,range(0,1)]
        #y=datos.iloc[:,range(1,2)]
        clases = datos.iloc[:,2]#metemos la ultima columna
        x=datos.iloc[:,range(0,2)]#metemos todos los datos en X
        d=datos.iloc[0,range(0,2)]#metemos la primer fila en d
        k=int(np.round(len(d)))#numero de columnas
        x=np.array([1, nuevaCalif])
        y=np.dot(self.W,x)
        if self.funcAct=="heaviside":
            return self.heaviside(y)
        if self.funcAct=="tanh":
            return self.tanh(y)
        if self.funcAct=="sigmoid":
            return self.training(x,y,k,clases)
        
        
    #funciones activación
    def heaviside(self,x):
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
