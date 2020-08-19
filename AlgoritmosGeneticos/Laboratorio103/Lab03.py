# -*- coding: utf-8 -*-
"""
Universidad Autónoma del Estado de México
Centro Universitario UAEM ZUMPANGO
Ingenieria en Computación
UA Algoritmos Geneticos 2020-A
Alumno: Axel Valenzuela Juárez
Profesor: DR. Asdrúbal López Chau
Descripcion: 
    Laboratorio 103
    Primer Algoritmo Genético
    Fecha: 19 de Febrero de 2020

"""

geneSet="031"
objetivo ="¡hola mundo!"

import random

def generar_padre(longitud):#pide un entero
    genes=[]#arreglo
    while len(genes) < longitud: #while de tamaño de genes es menor que longitud
        tamanioMuestral = min(longitud - len(genes),len(geneSet))#len es la longitud, min es el valor minimo
        genes.extend(random.sample(geneSet,tamanioMuestral))#genera una lista aleatoria de geneset y de tamaño de muestral
        #extend agrega los datos al final de la lista de genes
        print(genes)
        return ''.join(genes) #convierte a string los genes y les da un espacio con el '' que esta antes
    

def obtener_aptitud(conjetura):
    return sum(1 for esperando, real in zip(objetivo,conjetura)#zip junta objetivo con conjetura
               if esperando==real)
    
def mutar(padre):
    indice=random.randrange(0,len(padre))#crea datos aleatorios en el rango de 0 al tamaño del padre
    genesDelNino = list(padre)#crea una lista de los valores de padre
    nuevoGen,alterno=random.sample(geneSet,2)#les da valores aleatorios de el rango de geneset a 2
    genesDelNino[indice]=alterno if nuevoGen==genesDelNino[
            indice] else nuevoGen#se mete en la lista genesnino alterno si nuevo gen es igual a genesdelnino 
    return ''.join(genesDelNino)#se regresa un string con los datos de genes de nino separados por ""

import datetime#para trabajar con fechas

def mostrar(conjetura):
    diferencia=(datetime.datetime.now() - horaInicio).total_seconds()#la fecha actual menos la hora de inicio dando el total de segundos que le a tomado al programa
    aptitud= obtener_aptitud(conjetura)#se manda a llamar la funcion obtener_aptitud y se guarda en aptitud
    print("{}\t{}\t{}".format(conjetura,aptitud,diferencia))#se imprimen en el formato entre comillas y 
    #se le pasa la conjetura,aptitud y diferencia

random.seed()#se gnera la semilla
horaInicio=datetime.datetime.now()#se obtiene hora actual
mejorPadre= generar_padre(len(objetivo))#se manda a llamar la funcion generar padre y se pasa el tamaño y se guarda en mejor padre
mejorAptitud=obtener_aptitud(mejorPadre)#se guarda el resultado de la funcion obtener_aptitud y se le pasa elresultado de mejorpadre
mostrar(mejorPadre)#se muestra el contenido de mejorPadre

while True:
    nino=mutar(mejorPadre)#se muta al mejorpadre
    ninoAptitud = obtener_aptitud(nino)#se manda a obtener aptitud a la mutacion llamada nino
    if mejorAptitud >= ninoAptitud:#se comparan para saber si se debe continuar
        continue
    mostrar(nino)#se manda a llamar la funcion mostrar para que se muestre los valores de nino
    if ninoAptitud >= len(mejorPadre):#si ninoAptitud es mayor o igual que mejorPadre se cierra
        break
    mejorAptitud = ninoAptitud#se pone que ninoAptitud es igual a la mejor actitud
    mejorPadre=nino #que el nino es igual a el mejor padre y se sigue con el programa