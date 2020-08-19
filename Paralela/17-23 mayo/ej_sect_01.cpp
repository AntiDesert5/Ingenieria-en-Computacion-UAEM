#include<iostream>
#include<fstream>
#include<omp.h>
#include<stdio.h>
using namespace std;
float * calc_x(float *,int );
float * calc_y(float *,int );
float * calc_z(float *,int );
float* lee_vec(char *,int);
int muestra_vec(float *,int );
float * crea_vec(int );
int main(int argc,char *argv[]){
int n=25;
float *X,*Y,*Z;
X=crea_vec(n);
Y=crea_vec(n);
Z=crea_vec(n);

#pragma omp parallel sections
{
	#pragma omp section
	{X=lee_vec(argv[1],n);
	X=calc_x(X,n);}

	#pragma omp section
	{Y=lee_vec(argv[2],n);
	Y=calc_y(Y,n);}

	#pragma omp section
	{Z=lee_vec(argv[3],n);
	Z=calc_z(Z,n);}

}
muestra_vec(X,n);
muestra_vec(Y,n);
muestra_vec(Z,n);
return 0;}

float * calc_x(float * x,int n){
int i;
for(i=0;i<n;i++)
	x[i]=i;
return x ;}
float* calc_y(float * y,int n){
int i;
for(i=0;i<n;i++)
	y[i]=2*i;
return y;}
float * calc_z(float * z,int n){
int i;
for(i=0;i<n;i++)
	z[i]=i+2;
return z ;}
float* lee_vec(char *nom_arch,int m)
{ int i;
	float *VV,v;
	VV=crea_vec(m);
	fstream fd2;
	/* para lectura es in escritura out*/
	fd2.open(nom_arch,ios::in);
	//while(!fd2.eof())
			for (i=0;i<m;i++)
				{ fd2>>v;
				VV[i]=v;}
	fd2.close();
	cout<<"vector leido"<<endl;
	return VV;}
int muestra_vec(float *M,int m)
{ int i;
	for (i=0;i<m;i++)
		{cout<<M[i]<<", ";}
	return 0;}
float * crea_vec(int m)
{float *VV;
	VV=new float[m];
	return VV;}
