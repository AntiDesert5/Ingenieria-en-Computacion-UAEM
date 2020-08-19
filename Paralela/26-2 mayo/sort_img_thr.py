from PIL import Image as Im
import numpy as np
import threading as Th
import math 
img1 = Im.open("barbara.tif").convert("L")
im1 = np.array(img1, dtype=np.int)
im2 = np.array(img1, dtype=np.int)	
ini=int(0)
fin=int(0)
def thsort(Im1,Im2,ini,fin):
	for i in range(ini,fin):
		Im2[i]=np.sort(Im1[i])


threads = []
##cuantos hilos se crearan
for i in range(0,16):	
	ini=i*im1.shape[1]-2//4
	fin=i+im1.shape[1]-2//4
	t=Th.Thread( target=thsort, args=(im1,im2,ini,fin,)  )
	threads.append(t)
	t.start()
	t.join()

print(im2)
np.savetxt('mat_img_sort.dat',im2,fmt='%4.0d',delimiter=' ', newline='\n')




