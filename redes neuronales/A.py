# -*- coding: utf-8 -*-
"""
Created on Sun Aug 25 19:23:48 2019

@author: Valenzuela
"""

import numpy as np
import matplotlib.pyplot as plt


B = 10 * np.random.random((10, 2))
pr = 10 * np.random.random((1, 1))

l = np.sqrt(np.sum(np.power(np.subtract(B, pr), 2.0), axis=1))
indexmin = np.argmin(l)
distmin = l[indexmin]
print(distmin)

#grafico
plt.plot(B[:,1],B[:,0],'ro')
plt.plot(pr[0],pr[0],'b*')
plt.axis([0,10,0,10])
plt.grid(True)
plt.show()