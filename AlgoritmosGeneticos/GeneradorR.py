# -*- coding: utf-8 -*-
"""
Created on Wed Apr 29 08:36:02 2020

@author: Valenzuela
"""

import numpy as np

class FitnessFunction:
    def fitness(self,poblacion):
        #cambir por correspondiente 
        return np.random.randint(0,100,len(poblacion))

class GeneradorNumeros:
    def __init__(self):
        pass
    def generarR(self,T,n):
    
    #separar t en parte fraccionaria y parte entera
    #generar un numero pseudoaleatorio entre 0 y e
    #genero un numero pseudo aleatorio entre 0 y f*
        e=int(T)
        f = T -e
        np.random.randint(0,e+1,n)
        f=np.random.uniform(0,f,n)
        print(e+f)
        return e+f
    
class ruleta:
    a = GeneradorNumeros()
    def __init__(self,N):
        self.N =N #Tamaño poblacion 
        
    def elige(self,r,ve):
        for indice in range(0,len(ve)+1):
            suma=suma+ve[indice]
            if(suma >=r):
                return indice
        return -1
        
    #La poblacion es una lista de individuos
    def seleccion(self,poblacion):
        f = FitnessFunction()
        aptitudes = f.fitness(poblacion)
        frecEsperada = np.mean(aptitudes)
        ve=aptitudes*frecEsperada
        T = np.sum(ve)
        indicesElegidos = []
        for i in range(0,len(poblacion)+1):
            r= self.a.generarR(T,1)
            indice = self.elige(r,ve)
            if(indice>=0):
                indicesElegidos.append(indice)
                print(indice)
            else:
                print("error")
