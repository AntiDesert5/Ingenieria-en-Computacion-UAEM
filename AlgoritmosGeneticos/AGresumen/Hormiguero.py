# -*- coding: utf-8 -*-

"""
Algoritmo de Colonia de Hormigas
    Universidad Autónoma del Estado de México
    Centro Universitario UAEM ZUMPANGO
    Ingenieria en Computación
    UA Algoritmos Geneticos 2020-A
    Alumno: Axel Valenzuela Juárez
    Profesor: DR. Asdrúbal López Chau
    Descripcion: 
        Laboratorio
        Resumen
    Fecha: 16 de Mayo de 2020
@author: Valenzuela
"""

#paquetes necesarios
import numpy as np 
import matplotlib.pyplot as plt 
import ants as ants # Aquí están los objetos del algoritmo

#mapa que contiene ciudades
map1 = ants.Mapa(10)
#ver mapa
map1.draw_distances()

map1.swarm_create(100) # Creamos un enjambre de 100 hormigas
#ver hormigas
map1.swarm_show()
#para ver matriz de feromonas y de distancia
map1.show_distances_matrix()
map1.show_feromones_matrix()
#generacion recorre mapa
map1.swarm_generation()
#ver feromonas
map1.show_feromones_matrix()
map1.draw_feromones()
#se hace que multiples generaciones pasen para tener mas datos
for i in range(50):
    print(i, end = '·')
    map1.swarm_generation()
map1.show_feromones_matrix()
map1.draw_feromones()
#se muestra la mejor ruta hasta el momento
map1.draw_best_path()

#se vuelve a crear rutas del algoritmo para ver si cambia
for j in range(3):
    map1.feromone_reset()
    print()
    print('Ejecución', j+1, ', generación: ')
    for i in range(50):
        print(i+1, end = '·')
        map1.swarm_generation()
    map1.draw_feromones()
#se verifica mejor ruta de nuevo    
map1.draw_best_path()
#para verificar longitudes minimas
map1.draw_results()
map1.draw_best_results()

# ahora se busca optimizar una ruta entre 40 ciudades
map2 = ants.Mapa(40)
map2.swarm_create(200)
map2.swarm_generation()
map2.show_feromones_matrix()
map2.draw_feromones()

#las feromonas no alcanzan entonces se aumentan
#Con un valor de 5 es suficiente
map2.feromone_fine_tune()

#las hormigas recorren el mapa y se muestran las feromonas
map2.swarm_generation()
map2.show_feromones_matrix()
map2.draw_feromones()

#se hace pasar las generaciones de las hormigas y se terminan mostrando
for i in range(25):
    print(i, end = '·')
    map2.swarm_generation()
map2.show_feromones_matrix()
map2.draw_feromones()
map2.draw_best_path()
map2.draw_results()

