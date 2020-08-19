# -*- coding: utf-8 -*-
"""
Created on Sat Apr  4 17:44:56 2020
Universidad Autónoma del Estado de México
Centro Universitario UAEM ZUMPANGO
Ingenieria en Computación
UA Algoritmos Geneticos 2020-A
Alumno: Axel Valenzuela Juárez
Profesor: DR. Asdrúbal López Chau
Descripcion: 
    Proyecto 2
    El problema de las cartas
    Fecha: 30 de Marzo de 2020
@author: Valenzuela
"""

import unittest
import datetime
import genetic1
import operator
import functools
import random
#256
class PruebasDeCartas(unittest.TestCase):
    def obtener_aptitud(self,genes):
        sumaDelGrupo1 = sum(genes[0:5])#se suma los datos
        productoDelGrupo2 = functools.reduce(operator.mul, genes[5:10])#multiplicacion del segundo grupo
        duplicados=(len(genes)-len(set(genes)))#diferencia del tamaño de los genes
        return Aptitud(sumaDelGrupo1,productoDelGrupo2,duplicados) #Se regresa a Aptitud
    
    def test(self): #Funcion test
        geneSet = [i+1 for i in range (10)] # for el cual se hara 10 veces para meter datos en un arreglo
        horaInicio = datetime.datetime.now()#se obtiene hora actual
        ##el de arriba no
        
        def fnMostrar(candidato):
            mostrar(candidato,horaInicio)#funcion que sirve para mostrar los datos, es llamada la funcion mostrar
        
        def fnObtenerAptitud(genes):
            return self.obtener_aptitud(genes)#se regresa genes a la funcion obtener_aptitud, use self para que reconociera la funcion
        
        def fnMutar(genes):
            mutar(genes,geneSet)#se manda a llamar a la funcion mutar
        
        aptitudoptima= Aptitud(36,360,0)
        mejor= genetic1.obtener_mejor(fnObtenerAptitud,10,aptitudoptima,geneSet,fnMostrar,mutacion_personalizada=fnMutar)
        self.assertTrue(not aptitudoptima > mejor.Aptitud)
        
        
    
    
class Aptitud:
    def __init__(self,sumaDelGrupo1,productoDelGrupo2,duplicados):
        self.SumaDelGrupo1=sumaDelGrupo1 #se pasa a un auxiliar
        self.ProductoDelGrupo2=productoDelGrupo2
        diferenciaSuma = abs(36 - sumaDelGrupo1)#esta parte es para saber si esta cerca de 36 
        diferenciaProducto=abs(360-productoDelGrupo2) #esto es para los productos que en total deben ser 360
        self.DiferenciaTotal=diferenciaSuma+diferenciaProducto
        self.Duplicados=duplicados
        
    def __gt__(self,otro):#funcion para saber los duplicados
        if self.Duplicados != otro.Duplicados:
            return self.Duplicados <otro.Duplicados
        return self.DiferenciaTotal < otro.DiferenciaTotal
        
    def __str__(self):#formato que se usara para mostrar los datos
        return "sum: {} prod: {} dups: {}".format(
                self.SumaDelGrupo1,
                self.ProductoDelGrupo2,
                self.Duplicados)
        
def mostrar(candidato,horaInicio):#funcion que muestra los datos
        diferencia = (datetime.datetime.now()-horaInicio).total_seconds()
        print("{}-{}\t{}\t{}".format(
                ', '.join(map(str,candidato.Genes[0:5])),
                ', '.join(map(str,candidato.Genes[5:10])),
                candidato.Aptitud,
                diferencia))
            
def mutar(genes,geneSet):#aqui se muta el gen 
    if len(genes)==len(set(genes)):
        cuenta=random.randint(1,4)
        while cuenta>0:
            cuenta-=1
            indiceA,indiceB=random.sample(range(len(genes)),2)
            genes[indiceA],genes[indiceB]=genes[indiceB],genes[indiceA]
    else:
        indiceA=random.randrange(0,len(genes))#se añaden a los indices
        indiceB=random.randrange(0,len(geneSet))
        genes[indiceA]=geneSet[indiceB]
        
        
