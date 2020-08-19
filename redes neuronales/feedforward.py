# -*- coding: utf-8 -*-
"""
Created on Wed Nov  6 13:02:16 2019

@author: Valenzuela Juárez
"""
print ("Ingrese numero de entradas")
nentradas=int(input())
print ("Ingrese numero capas ocultas")
ncapocultas=int(input())
print ("Ingrese numero de neuronas en cada capa oculta")
nneuronasco=int(input())
print ("Ingrese numero de salidas")
nsalidas=int(input())

def funcAct(x):
    return 1/(1+np.exp(-x))    
    
    
import numpy as np
#arr = 5*np.random.random([1,nentradas])

for j in range(0,ncapocultas+2): #ciclo para crear las neuronas necesarias
    if j==0:#caso para las entradas
        arr = 5*np.random.random([1,nentradas])#se crea una matriz de numeros aleatorios segun el numero de entradas
        #x=np.array([.5,1])
        x_ext=np.append(1,arr)#se le añade un 1
        W1 = 2.1*np.random.random([nneuronasco,nentradas+1])#se crea matriz w 
        print(W1) # se imprime para comprobar su funcionamiento
        #W1 = np.random.randint(1,4,[2,3])
        f=funcAct(np.dot(W1,x_ext))#se elabora la matriz transpuesta
        f1 = np.append(1,f)#se añade un 1 a la matriz transpuesta
        fy=f1#auxiliar
    if j>0 and j==ncapocultas:#en caso de que no sea la primer iteracion
        p=fy.shape #numero de filas o neuronas de la anterior iteracion
        Wo=np.random.rand(nentradas+1,p[0])#creacion de w
        print(Wo)
        f=funcAct(np.dot(Wo,fy))#calculo de transpuesta
        fq=np.append(1,f)
    if j==ncapocultas+1:#en caso de ser la ultima iteracion
        h=fq.shape#numero de filas o neuronas de la anterior iteracion
        Wf=np.random.randn(nsalidas+1,h[0])#creacion de w
        y= funcAct(np.dot(Wf,fq))#calculo del resultado
        print("Resultado final",y)#impresion final


