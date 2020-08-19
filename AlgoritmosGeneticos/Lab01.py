# -*- coding: utf-8 -*-
"""
Universidad Autónoma del Estado de México
Centro Universitario UAEM ZUMPANGO
Ingenieria en Computación
UA Algoritmos Geneticos 2020-A
Alumno: Axel Valenzuela Juárez
Profesor: DR. Asdrúbal López Chau
Descripcion: 
    Laboratorio 101
    Minimo de la función
    Dada la funcion f1(x)=(x-1)^2 | 0<=x<=2
    a) Grafica la función fi(x)
    b) Determinar analíticamente el mínimo de f1(x)
    c) Diseñar e implementar un programa para encontrar el minimo de f1(x)
Fecha: 5 de Febrero de 2020
"""

import numpy as np #importar np
import matplotlib.pyplot as plt#permite hacer graficas

x=np.linspace(0,2,100)#un arreglo con valores de 0 a 2 siendo en total 100

f1= np.power(x-1,2.0) #se aplica la funcion 


print("El minimo de F1: ",min(f1)) #se calcula el minio de F(x)
print("El valor de X es: ",np.power(min(f1)-1,2.0))#Se calcula el valor de X sustituyendo el valor minimo en la funcion

plt.plot(x,f1,linewidth=2.0)#se define el tamaño para graficar
plt.xlabel("x",fontsize=20,color='red') #etiquetas en este caso para el eje de x
plt.ylabel("f1(x)",fontsize=20,color='red')#etiquetas en este caso para f(x)
plt.show()#se muestra la grafica
