# -*- coding: utf-8 -*-
"""
Universidad Autónoma del Estado de México
Centro Universitario UAEM ZUMPANGO
Ingenieria en Computación
UA Algoritmos Geneticos 2020-A
Alumno: Axel Valenzuela Juárez
Profesor: DR. Asdrúbal López Chau
Descripcion: 
    Laboratorio 102
    Furza bruta
    Dado una contraseña de 4 caracteres y utilizando unicamente vocales,
    encontrar la contraseña por medio de un ataque de fuerza bruta
    Fecha: 12 de Febrero de 2020

"""


arr=[1,2,3,4] #arreglo con la contraseña a encontrar
arr2=[]
i=0 #auxiliar para guardar las iteraciones
vocal = dict() #declaracion de diccionario para convertir los numeros a vocales

vocal = { #sintaxis del diccionario, se declaran las vocales y se les asigna un numero
    1 : "A",
    2 : "E",
    3 : "I",4: "O", 5 : "U"
    
}

for a  in range(1,6):#se hace un for para cada vocal en la cual se encontrara la contraseña
    for b in range(1,6):     
        for c in range(1,6):
            for d in range(1,6):
                i=i+1 #se guarda el numero de iteraciones y se van sumando
                arr2=[a,b,c,d]#los valores de los for se guardan en un arreglo para ser comparados despues con la contraseña
                if(arr==arr2):#se compara el arreglo guardado con la contrseña, en caso de ser iguales se procede a darle valores de vocales en ves de numeros
                   print("Encontrado en :",i)#se imprime el numero de iteraciones
                   print("contraseña con numeros: " ,a,b,c,d )#se imprime la contraseña con los numeros 
                   print("Contraseña desifrada con vocales: ",vocal.get(a),vocal.get(b),vocal.get(c),vocal.get(d))#se imprime la contraseña pasando los numeros obtenidos a el diccionario para obtener su respectivo valor en vocales.
                   #se usa el metodo get() para obtener un elemento del diccionario segun su indice
                           
                  
                
