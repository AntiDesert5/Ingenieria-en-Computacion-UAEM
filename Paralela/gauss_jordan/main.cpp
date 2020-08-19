#include <stdio.h>

void datos(int *tam, float mat1[][102]);
void esc_data(int tam1, float mat2[][102]);
void solucion(int Dim, float Sist[][102]);


int main(void)
{
    int i,tam;
    float mat[101][102];
    datos(&tam,mat);
    printf("\n\n\nEcuacion: \n\n");
    esc_data(tam,mat);
    solucion(tam,mat);
    printf("\n\n\nSolucion:\n");
    for(i=1;i<=tam;i++)
        printf("\n X%d=%f\n",i,mat[i][tam+1]);

    scanf("");
    return(0);
}


void datos(int *tam,float mat1[][102])
{
    int j,k;
    printf("\n\n SISTEMA DE ECUACIONES POR GAUS JORDAN");
    printf("\n\n\n INCOGNITAS: ");
    scanf("%d",&*tam);
    printf("\n\n VARIABLES:");
    printf("\n\n MATRIZ j:\n");
    for(j=1;j<=*tam;j++)
        for(k=1;k<=*tam;k++)
        {
        printf("\n VALORES MATRIZ(%d,%d):",j,k);
    scanf("%f",&mat1[j][k]);
    }
    printf("\n\n\n RESULTADO:\n");
    for(j=1;j<=*tam;j++){
        printf("\n VECTOR(%d):",j);
        scanf("%f",&mat1[j][*tam+1]);
    }
    }

void esc_data(int tamano, float mat2[][102])
{
    int x,y;
    for(x=1;x<=tamano;x++)
        {
        for(y=1;y<=(tamano+1);y++)
        {
            printf("%7.2f",mat2[x][y]);
            if(y==tamano)
             printf("   |");
    }
        printf("\n");
    }
    }

void solucion(int tam, float mat[][102])
{
    int res,i,j,k,m;
    float col_pivote,x;

    for(i=1;i<=tam;i++)
        {
        res=0;m=i;
        while(res==0)
        {
           if((mat[m][i]>0.0000001)||((mat[m][i]<-0.0000001)))
           {
                res=1;
    }
            else
                m++;
            }
        col_pivote=mat[m][i];
        for(j=1;j<=(tam+1);j++)
            {
            x=mat[m][j];
            mat[m][j]=mat[i][j];
            mat[i][j]=x/col_pivote;
        }
        for(k=i+1;k<=tam;k++)
            {
            x=mat[k][i];
            for(j=i;j<=(tam+1);j++)
            {
                mat[k][j]=mat[k][j]-x*mat[i][j];
        }
    }
    }

    for(i=tam;i>=1;i--)
        for(j=(i-1);j>=1;j--)
        {
        mat[j][tam+1]=mat[j][tam+1]-mat[j][i]*mat[i][tam+1];
        mat[j][i]=0;
    }
}
