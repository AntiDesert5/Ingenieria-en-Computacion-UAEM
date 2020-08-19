import numpy as np

B=np.random.random((10,2))

import matplotlib.pyplot as plt
pr=np.random.random((2,1))

plt.plot(B[:,0],B[:,1],'ro')
plt.plot(pr[0],pr[1],'bo')
plt.axis([-1,1,-1,1])
plt.grid(True)
plt.show()


#P=np.random.random((3,2))
