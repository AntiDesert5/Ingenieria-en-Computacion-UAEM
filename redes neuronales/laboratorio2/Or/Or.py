# -*- coding: utf-8 -*-
"""
Created on Wed Oct 30 14:05:38 2019

@author: ico
"""
import numpy as np
class MyNeuron:
    
  

    def training(self,X,Y):
        self.W=np.random.random((X.shape[1]+1,1))
        X=np.append(np.ones((X.shape[0],1)),X,axis=1)
        
        for j in range(1,21):
            i=0
            for x in X:
                if np.dot(self.W.T,x)>0:
                    y = 1
                else:
                    y = 0
            self.W=self.W+(Y[i]-y)*x.reshape(3,1)
            i=i+1
        
    #W=np.array([-100,100/6])
    #constructor
    def __init__(self,funcActivation):
        self.funcAct=funcActivation
    #Predice si aprueba o no
    
    def predict(self,x):
        x=np.append(1,x)
        y=np.dot(self.W.T,x.reshape(self.W.shape[0]))
        if self.funcAct=="heaviside":
            return self.heaviside(y)
        if self.funcAct=="tanh":
            return self.tanh(y)
        if self.funcAct=="sigmoid":
            return self.sigmoid(y)
        
    #funciones activación
    def Yp(self,x):
        if x>=0:  
            return 1#aprobado
        else:
            return -1#no aprobado
    def tanh(self,x):
        return np.sinh(x)/np.cosh(x)
    def sigmoid(self,x):
        return 1/(1+np.exp(-x))
    #transforma a 0 o 1
    def transformPredictions(self,Y):
        Y=np.array(Y)
        if self.funcAct=='heaviside':
            idxNeg=Y==-1
            Y[idxNeg]=0
        elif self.funcAct=='tanh':
            idxPos = Y >=0
            idxNeg = Y<0
            Y[idxPos]=1
            Y[idxNeg]=0
        
        else:
            idxPos = Y>=0.5
            idxNeg=Y<0.5
            Y[idxPos]=1
            Y[idxNeg]=0
        return Y
    
clf=MyNeuron("sigmoid")

import pandas as pd
#datos=pd.read_csv('training.csv')
#X=datos.iloc[:,[0,1]]
#Y=datos.iloc[:,2]
ceros=np.random.uniform(0,0.3,10)#vector de 10 ceros
unos= np.random.uniform(0.7,1.0,10)#vecto de 10 unos
#creo conjunto de datos
X=np.append(ceros,ceros)
X=np.append(X,unos)
X=np.append(X,unos)
X=np.append(X,ceros)
X=np.append(X,unos)
X=np.append(X,ceros)
X=np.append(X,unos)
X=X.reshape(40,2)
Y=np.zeros((30,1))
Y=np.append(Y,np.ones((10,1)))
Y=Y.reshape(40,1)
clf.training(X,Y)

prueba=pd.read_csv('test.csv')
Xt=prueba.iloc[:,[0,1]]
Yt=prueba.iloc[:,2]
Yp=[]
for i in range(0,Xt.shape[0]):
    p=np.array(Xt.iloc[i,:])
    Yp.append(clf.predict(p))
"""
import matplotlib.pyplot as plt
idxPos = Y ==1
idxNeg = Y ==0
Xgraf=X[idxPos]
plt.plot(Xgraf.iloc[:,0],Xgraf.iloc[:,1],'bo')
Xgraf=X[idxNeg]
plt.plot(Xgraf.iloc[:,0],Xgraf.iloc[:,1],'ro')
plt.title("Entrenamiento")
plt.show()
for i in range(0,Xt.shape[0]):
    p=np.array(Xt.iloc[i,:])
    Yp.append(clf.predict(p))


idxPos = Yt ==1
idxNeg = Yt ==0
Xgraf=Xt[idxPos]
plt.plot(Xgraf.iloc[:,0],Xgraf.iloc[:,1],'bo')
Xgraf=Xt[idxNeg]
plt.plot(Xgraf.iloc[:,0],Xgraf.iloc[:,1],'ro')
plt.title("Test")
plt.show()

#calculo de matriz de confusion
#convertir las predicciones en clases
Yp=clf.transformPredictions(Yp)
Yt=np.array(Yt)
Yt=Yt.reshape(Yt.shape[0],1)
a=np.sum(np.logical_and(Yp==0,Yt==0))
b=np.sum(np.logical_and(Yp==1,Yt==0))
c=np.sum(np.logical_and(Yp==0,Yt==1))
d=np.sum(np.logical_and(Yp==1,Yt==1))
"""
#cm=np.array([a,b,c,d]).reshape((2,2))
#Ypprint(cm)
#con imprimimos los resultados#