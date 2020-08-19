import numpy as np

B=np.random.random((10,2))

import matplotlib.pyplot as plt
pr=np.random.random((2,1))

indexmin=-1
distmin=0
for i in range(0,9):
    d=np.sqrt(np.sum(np.power(np.subtract(B[i],pr),2.0)))
    if(i==0):
        distmin=d
        indexmin=i
    if(d<distmin):
        distmin=d
        indexmin=i
        
        
        def quick_sort(vector):
    if not vector:
        return []
    else:
        pivote = vector[-1]
        menor = [x for x in vector     if x <  pivote]
        mas_grande = [x for x in vector[:-1] if x >= pivote]
        return quick_sort(menor) + [pivote] + quick_sort(mas_grande)
        
        
print(B[indexmin,:])
plt.plot(B[:,0],B[:,1],'ro')
plt.plot(pr[0],pr[1],'bo')
plt.axis([-1,1,-1,1])
plt.grid(True)
plt.show()


#P=np.random.random((3,2))
