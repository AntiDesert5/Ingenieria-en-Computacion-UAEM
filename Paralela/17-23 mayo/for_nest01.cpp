#include<iostream>
#include<omp.h>
//#include<stdio.h>
using namespace std;
int main(){
int i,j,pr;
const char *sp;
omp_set_nested(true);
//omp_set_num_threads(2);
sp=omp_get_nested() ? "Soportado":"No soportado";
cout<<"Paralelismo Anidado es: "<<sp<<endl;
#pragma omp parallel num_threads(2)
{
cout<<"Thread: "<<omp_get_thread_num()<<", ejecuta region exterior"<<endl<<endl;

#pragma omp parallel num_threads(3)
{
	cout<<"Thread: "<<omp_get_thread_num()<<", ejecuta region interior"<<endl;
	}
}
return 0;}
