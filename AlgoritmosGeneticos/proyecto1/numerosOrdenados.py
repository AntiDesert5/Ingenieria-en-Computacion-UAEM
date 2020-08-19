# -*- coding: utf-8 -*-
"""
Created on Wed Mar 18 16:54:47 2020

@author: Valenzuela
"""

import unittest
import datetime
#import genetic

def obtener_aptitud(genes):
    aptitud = 1
    for i in range(1,len(genes)):
        if genes[i]>genes[i-1]:
            aptitud +=1
    return aptitud

def mostrar(candidato,horaInicio):
    diferencia=(datetime.datetime.now()-horaInicio).total_seconds()
    print("{}\t=> {}\t{}".format(', '.join(map(str, candidato.Genes)),candidato.Aptitud,diferencia))

class PruebasDeNumerosOrdenados(unittest,TestCase):
    def test_ordenar_3_numeros(self):
        self.ordenar_numeros(3)
        
    def ordenar_numeros(self,numerosTotales):
        geneSet=[i for i in range(100)]
        