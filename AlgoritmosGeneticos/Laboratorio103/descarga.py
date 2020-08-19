"""
Ejemplo de la clase 5 código gray como solución al problema binario no convergente
Created on Wed Mar  4 08:58:29 2020
@author: 
"""
import numpy as np
class CromosomaEntero():
  #def __init__(self):
  #  self.cromosoma = []
  representacion = "Gray"
  
  def __init__(self, numBits=8):
    #self.cromosoma = [0,0,0,0,0,0,0,0]
    """
    Convertir un cromosoma con valores psudoaleatorios de longitud numBIts
    """
    if(numBits>0):
      cromosoma = [0,0,0,0,0,0,1,1]
      self.cromosoma = np.array(cromosoma)
      
    
  def setRepresentacion(self, representacion):
    self.representacion = representacion
    
  def getFenotipo(self,):
    """
    Regresa el valor decimal correspondiente considerando la represenatcion (binaria o gray)
    """
    if self.representacion == "binario":
      #binario a decimal
      numBin=self.listaToString(self.cromosoma)
      return self.stringBinarioToDecimal(numBin)
    if self.representacion == "Gray":
      #gray decimal
      binUno = self.cromosoma
      binDos = self.cromosoma
      numBin=self.listaToString(binUno)
      binUno = np.append(binUno,0)
      binDos = np.append(0,binDos)
    
      numBin1= self.listaToString(binUno)
      numBin2= self.listaToString(binDos)
      sumaBin=""
      for i in range(0,len(numBin1)):
        if numBin1[i] == numBin2[i]:
          sumaBin = sumaBin+str("0")
        else:
          sumaBin = sumaBin+str("1")
          
      temp = len(sumaBin)
      gray = sumaBin[:temp-1] 
      #Resultado = "Numero Gray: "+str(gray)+str("\nDecimal: ")+str(self.stringBinarioToDecimal(numBin))
      Resultado = self.stringBinarioToDecimal(numBin)
      return Resultado
    
    
  def stringBinarioToDecimal(self, binario):
    return int(binario,2)#funcion que convierte a decimal, solo es necesario indicar la base en la que esta
    
    
  def listaToString(self, lista):
    string = ""
    for element in lista:
      string=string+str(element)
    return string
    

  def Ecuacion(self,x):
      res= np.math.pow(x-15,2)
      return res
      
#Inicio del programa
      
clf = CromosomaEntero()
clf.setRepresentacion("Gray")
var = clf.getFenotipo()
var2=clf.Ecuacion(clf.getFenotipo())
print(var)
print(var2)


    
    