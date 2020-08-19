# -*- coding: utf-8 -*-
"""
Created on Sun Sep 22 20:54:30 2019

@author: Valenzuela
"""
import numpy as np
import pandas as pd

outlook=np.array(['sunny','overcast','rainy'])
temperature = np.array(['hot','mild','cool'])
humildy=np.array(['high','normal'])
windy=np.array(['TRUE','FALSE'])
play=np.array(['yes','no'])
datos=pd.read_csv('datos.cvs')#leemos los datos del archivo con pandas
X=datos.iloc[:,range(0,3)]#metemos todos los datos en X
clases = datos.iloc[:,4]#metemos la ultima columna
K=int(np.round(len(datos)))#contamos los datos
numclima=datos.iloc[:,0]
cont=0
for i in range(0,K):#for para contar los datos con la palabra si(yes)
    if('yes'==datos.iloc[i,4]):
        cont=cont+1
        
jugarno=np.absolute(K-cont)#la inversa (los datos con palabra no)
a=0
b=0
c=0
d=0
e=0
f=0
h=0
j=0
o=0
p=0
for i in range(0,K):#for para comparar las clases y sacar su probabilidad
    if('sunny'==datos.iloc[i,0] and 'yes'==datos.iloc[i,4]):
        a=a+1        
    if('overcast'==datos.iloc[i,0] and 'yes'==datos.iloc[i,4]):
        b=b+1
    if('rainy'==datos.iloc[i,0] and 'yes'==datos.iloc[i,4]):
        c=c+1
    if('hot'==datos.iloc[i,1] and 'yes'==datos.iloc[i,4]):
        d=d+1
    if('mild'==datos.iloc[i,1] and 'yes'==datos.iloc[i,4]):
        e=e+1
    if('cool'==datos.iloc[i,1] and 'yes'==datos.iloc[i,4]):
        f=f+1
    if('high'==datos.iloc[i,2] and 'yes'==datos.iloc[i,4]):
        h=h+1
    if('normal'==datos.iloc[i,2] and 'yes'==datos.iloc[i,4]):
        j=j+1
    if(False==datos.iloc[i,3] and 'yes'==datos.iloc[i,4]):
        o=o+1
    if(True==datos.iloc[i,3] and 'yes'==datos.iloc[i,4]):
        p=p+1    
        #dierentes probabilidades
precS=a/cont
precO=b/cont
precR=c/cont
precHot=d/cont
precM=e/cont
precC=f/cont
precH=h/cont
precN=j/cont
preco=o/cont
precp=p/cont
probclase=cont/K#la probabilidad de la clase play

datos2=pd.read_csv('datosprueba.cvs')#se lee los datos a verificar
X=datos2.iloc[:,range(0,3)]
clases = datos2.iloc[:,4]
K1=int(np.round(len(datos2)))#contamos el numero de datos
for i in range(0,K1):#for para calcular la probabilidad
        resultado=1
        r2=1
        r3=1
        r4=1
        r5=1
        var1 = datos2.iloc[i,0]
        var2=datos2.iloc[i,1]
        var3=datos2.iloc[i,2]
        var4=datos2.iloc[i,3]
        var5=datos2.iloc[i,4]
        if(var1=='sunny'):#si encuentra sunny en la columna 0 mete la probabilidad y la multiplica al final
            resultado*=precS
        if(var1=='overcast'):##si encuentra overcast en la columna 0 mete la probabilidad y la multiplica al final
            resultado=precO
        if(var1=='rainy'):
            resultado=precR
        if(var2=='hot'):
            r2=precHot
        if(var2=='mild'):##si encuentra mild en la columna 0 mete la probabilidad y la multiplica al final
            r2=precM
        if(var2=='cool'):
            r2=precC
        
        if(var3=='high'):
            r3=precH
        if(var3=='normal'):##si encuentra normal en la columna 0 mete la probabilidad y la multiplica al final
            r3=precN
        
        if(var4==False):
            r4=preco
        if(var4==True):
            r4=precp
        
        if(var5=='yes'):
            r5=probclase
        if(var5=='no'):
            r5=np.absolute(1-probclase)
        print('Resultado numero',i+1,': ')
        print(resultado*r2*r3*r4*r5)#se imprime el resultado de la multiplicacion para obtener la probabilidad
    