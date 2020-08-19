import numpy as np
import math
from matplotlib import pyplot as plt

def dist(V,U):
		return math.sqrt( (V[0]-U[0])**2+(V[1]-U[1])**2) 
def calc_dist(Pt,Ct,kc):
	Dist=np.zeros((Pt.shape[0],1))
	for i in range(Pt.shape[0]):
			Dist[i]=dist(Pt[i],Ct[kc])
	return Dist

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

if __name__ == '__main__':
	tol=10**(-4)
	err=25.0
	Pr=P[:,0: 2]
	Dt=np.zeros( (P.shape[0], 4) )
	Ct=np.zeros((4,2))
	while(err>tol):	
		Dt[: , 0:1]=calc_dist(Pr,C,0)
		Dt[: , 1:2]=calc_dist(Pr,C,1)
		Dt[: , 2:3]=calc_dist(Pr,C,2)
		Dt[: , 3:4]=calc_dist(Pr,C,3)
		calc_min(Dt,P)
		Ct=calc_media(P)
		err=dist(C[0],Ct[0])
		print(err)
		print(Ct)
		C=Ct
		#print(Dt)
	
	#print(M)
	
	#print(P)
	plt.scatter(P[:,0],P[:,1])
	plt.scatter(C[:,0],C[:,1])
	plt.scatter(Ct[:,0],Ct[:,1])
	plt.show()

