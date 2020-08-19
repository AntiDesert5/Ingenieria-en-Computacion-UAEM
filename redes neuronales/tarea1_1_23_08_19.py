# -*- coding: utf-8 -*-
"""
Created on Fri Aug 23 18:34:17 2019

@author: Valenzuela
"""

import numpy as np

pa=np.array([-2,-2])
pb=np.array([1,3])
pc=np.array([4,3])
pr=np.array([-3,-1])


resta = np.subtract(pa,pr)
restaCuadrado=np.power(resta,2.0)
sumatoria=np.sum(restaCuadrado)
distancia=np.sqrt(sumatoria)

distanciaAR=np.sqrt(np.sum(np.power(np.subtract(pa,pr),2.0)))

distanciaBR=np.sqrt(np.sum(np.power(np.subtract(pb,pr),2.0)))
distanciaCR=np.sqrt(np.sum(np.power(np.subtract(pc,pr),2.0)))

mivector=np.array([1,6,3,6,7,3,9,8,0])
A=mivector.reshape(3,3)#reacomoda matriz
B=pa#El vector B comienza con pa
B=np.append(B,pb)#se le agrega
B=np.append(B,pc)#pb y pc
B=B.reshape(-1,2)#Se cambia a matriz
pr=np.array([-3,-1])
indexmin=-1
distmin=0
for i in range(0,3):
    d=np.sqrt(np.sum(np.power(np.subtract(B[i],pr),2.0)))
    if(i==0):
        distmin=d
        indexmin=i
    if(d<distmin):
        distmin=d
        indexmin=i
print(B[indexmin,:])
#aaaaaaa
def sort(array):
    """Sort the array by using quicksort."""

    less = []
    equal = []
    greater = []

    if len(array) > 1:
        pivot = array[0]
        for x in array:
            if x < pivot:
                less.append(x)
            elif x == pivot:
                equal.append(x)
            elif x > pivot:
                greater.append(x)
        # Don't forget to return something!
        return sort(less)+equal+sort(greater)  # Just use the + operator to join lists
    # Note that you want equal ^^^^^ not pivot
    else:  # You need to handle the part at the end of the recursion - when you only have one element in your array, just return the array.
        return array
#AAAAA

for x in range(0,2):
    print("Ordenado: ",sort())
import matplotlib.pyplot as plt
plt.plot(B[:,0],B[:,1],'ro')
plt.plot(pr[0],pr[1],'bo')
plt.axis([-5,5,-4,6])
plt.grid(True)

#P=np.random.random((3,2))
