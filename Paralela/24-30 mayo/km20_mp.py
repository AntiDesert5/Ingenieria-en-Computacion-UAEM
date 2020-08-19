import numpy as np
from multiprocessing import Process  , Array
import math
from matplotlib import pyplot as plt

def dist(V,U):
		return math.sqrt( (V[0]-U[0])**2+(V[1]-U[1])**2) 
def calc_dist(Pt,Ct,kc,D):
	#Dist=np.zeros((Pt.shape[0],1))
	for i in range(Pt.shape[0]):
			D[i]=dist(Pt[i],Ct[kc])
			
	#return Dist

def calc_min(D,Pt):
	for r in range(D.shape[0]):			
		ind=np.argmin( D[r] )
		Pt[r,2:3]=ind
	return 
	
def calc_media(Pt):
	Cm=np.zeros((4,2))	
	lt10=[]
	lt20=[]
	lt30=[]
	lt40=[]
	lt11=[]
	lt21=[]
	lt31=[]
	lt41=[]
	for i in range(Pt.shape[0]):			
			if (Pt[i,2]==0):
				lt10.append(Pt[i,0])	
				lt11.append(Pt[i,1])
			if (Pt[i,2]==1):	
				lt20.append(Pt[i,0])	
				lt21.append(Pt[i,1])
			if (Pt[i,2]==2):
				lt30.append(Pt[i,0])		
				lt31.append(Pt[i,1])
			if (Pt[i,2]==3):	
				lt40.append(Pt[i,0])	
				lt41.append(Pt[i,1])
	Cm[0,0]=np.mean(lt10)
	Cm[0,1]=np.mean(lt11)
	Cm[1,0]=np.mean(lt20)
	Cm[1,1]=np.mean(lt21)
	Cm[2,0]=np.mean(lt30)
	Cm[2,1]=np.mean(lt31)
	Cm[3,0]=np.mean(lt40)
	Cm[3,1]=np.mean(lt41)
	return Cm


P=np.loadtxt('ptos_km.dat',dtype=float)
C=np.loadtxt('centros.dat',dtype=float)
Co=C
Dt=np.zeros( (P.shape[0], 4) )
Ar1=Array('f' ,range(100) )	
Ar2=Array('f' ,range(100) )
Ar3=Array('f' ,range(100) )
Ar4=Array('f' ,range(100) )

if __name__ == '__main__':
	tol=10**(-4)
	err=25.0
	Pr=P[:,0: 2]
	
	Ct=np.zeros((4,2))
	while(err>tol):	
	
		p1=Process(target=calc_dist, args=(Pr,C,0,Ar1) )
		p2=Process(target=calc_dist, args=(Pr,C,1,Ar2) )
		p3=Process(target=calc_dist, args=(Pr,C,2,Ar3) )
		p4=Process(target=calc_dist, args=(Pr,C,3,Ar4) )
		p1.start()		
		p2.start()
		p3.start()
		p4.start()
	
		
		p1.join()
		for i in range(100):
			Dt[i , 0:1]=Ar1[i]
		p2.join()
		for i in range(100):
			Dt[i , 1:2]=Ar2[i]
		p3.join()
		for i in range(100):
			Dt[i , 2:3]=Ar3[i]
		p4.join()
		for i in range(100):
			Dt[i , 3:4]=Ar4[i]
	
		
		calc_min(Dt,P)
		Ct=calc_media(P)
		err=dist(C[0],Ct[0])	
		C=Ct
	print(P)
	
	#print(M)
	
	#print(P)
	print(C)
	plt.scatter(P[:,0],P[:,1])
	plt.scatter(Co[:,0],Co[:,1])
	plt.scatter(Ct[:,0],Ct[:,1])
	plt.show()

