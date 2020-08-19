# -*- coding: utf-8 -*-
"""
Created on Sun Oct 13 20:45:35 2019

@author: Valenzuela Juarez Axel
"""

import numpy as np
import pandas as pd
class MyNeuron:
    def training(self):
        datos=pd.read_csv('training.csv')
        c = datos.iloc[:,2]#metemos la ultima columna
        x=datos.iloc[:,range(0,2)]#metemos todos los datos en X
        d=datos.iloc[0,range(0,2)]#metemos la primer fila en d
        k=int(np.round(len(d)))#numero de columna
        W=np.array(np.random.random((k+1,1)))#creacion de w con numero de columnas mas 1
        Wt=np.transpose(W)#transpuesta
        b = np.ones((23,1))#matriz de de puros 1
        l=np.append(b,x,axis = 1)#se agrego columna de 1 al principio en b
        l[1,range(0,3)]#metemos la primer fila en d
        np.dot(Wt,l[0,range(0,3)])
        for i in range(0,20):
            for j in range(0,22):
                if(np.dot(Wt,l[j,range(0,3)])>=0):
                    y=1
                else:
                    y=0
                Wt=Wt+((c[j]-y)*l[j,range(0,3)])
                #print ("este",Wt)
        return Wt
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
        
    #constructor
    def __init__(self,funcActivation):
        self.funcAct=funcActivation
    #Predice si aprueba o no
    def func(self):
        
        if self.funcAct=="sigmoid":
            return self.training()
    
    def datos(self,wf):
        
        datos=pd.read_csv('test.csv')
        x=datos.iloc[:,range(0,2)]#metemos todos los datos en X
        
        b = np.ones((35,1))
        l=np.append(b,x,axis = 1)#se agrego columna de 1 al principio en b
        l[1,range(0,3)]#metemos la primer fila en d
        
        for j in range(0,35):
            if(np.dot(wf,l[j,range(0,3)])>=0):
                y=1
                print ("Salida fila",j+1," : ",y)
            else:
                y=0
                print ("Salida fila",j+1," : ",y)#salidas finales
                
clf=MyNeuron("sigmoid")
#clf.func()

w=clf.func()
print("resfin: ",w)
clf.datos(w)


