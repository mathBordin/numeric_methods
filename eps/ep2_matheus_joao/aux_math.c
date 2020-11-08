/**
 * @file aux_math.h
 *
 * @brief Arquivo que implementa as fun��es relativas aos m�todos matem�ticos
 * utilizados na solu��o do problema.
 *
 * @author Matheus Bordin Gomes - 9838028 - Turma 2
 * @author Jo�o Ferreira Cysne - 10774020 - Turma 3
 */

#include "aux_math.h"
#include <float.h>

void LDL_Fact_tridiagonal(double **A, double *L, double *D, int N)
{
	for(int i = 0; i < N; i++)
	{
		L[i] = 0;
		D[i] = 0;
	}

	//Decomposi��o LDL simplificada para matriz tridiagonal sim�trica e
	//armazenamento em vetores
    //A[0][i] � a diagonal da matriz A
    //A[1][i] � a subdiagonal da matriz A
    //L[i] � a subdiagonal da matriz L
    //D[i] � a diagonal da matriz D
	for(int i = 0; i < N; i++)
	{
	    D[i] = A[0][i] - pow(L[i], 2)*D[i-1];
	    if((i+1)<N)
            L[i+1] = A[1][i+1]/D[i];
	}
}

void solve_LDL_tridiagonal_system(double *L, double *D, double *b, double *x, int N)
{
    //Aloca dinamicamente vetores auxiliares para resolver o sistema
    double *y = malloc(N * sizeof(double));
    double *z = malloc(N * sizeof(double));

    //Zera vetores
	for(int i = 0; i < N; i++)
	{
		z[i] = 0;
		y[i] = 0;
		x[i] = 0;
	}

	// L*y = b
	y[0] = b[0];
	for(int i = 1; i < N; i++)
	{
		y[i] = b[i] - L[i]*y[i-1];
	}

	// D*z = y
	for(int i = 0; i < N; i++)
	{
		z[i] = y[i]/D[i];
	}

	// L^t*x = y
	x[N-1] = z[N-1];
	for(int i = N-2; i >= 0; i--)
	{
		x[i] = z[i] - L[i+1]*x[i+1];
	}

    //Libera vari�veis alocadas dinamicamente
	free(y);
	free(z);
}

void solve_tridiagonal_system(double **A, double *b, double *x, int N)
{
    //Aloca dinamicamente matrizes auxiliares para resolver o sistema
    double *L = malloc(N * sizeof(double));
    double *D = malloc(N * sizeof(double));

    //Decomposi��o LDL
	LDL_Fact_tridiagonal(A, L, D, N);
	//Resolu��o do sistema LDL*x=b
	solve_LDL_tridiagonal_system(L, D, b, x, N);

    //Libera vari�veis alocadas dinamicamente
	free(L);
	free(D);
}

void LDL_Fact(double **A, double **L, double *D, int N)
{
    //Inicializa as matrizes
	for(int i = 0; i < N; i++)
	{
		D[i] = 0;
		for(int j = 0; j < N; j++)
        {
            if(i==j)
                L[i][j] = 1;
            else
                L[i][j] = 0;
        }
	}

	//Decomposi��o LDL
	for(int i = 0; i < N; i++)
	{
	    double sum = 0.0;
	    for(int j = 0; j <= i-1; j++)
            sum += pow(L[i][j],2)*D[j];
	    D[i] = A[i][i] - sum;
	    for(int j = i+1; j < N; j++)
        {
            sum = 0.0;
            for(int k = 0; k <= i-1; k++)
                sum += L[j][k]*L[i][k]*D[k];
            L[j][i] = (A[j][i]-sum)/D[i];
        }
	}

}

void solve_LDL_system(double **L, double *D, double *b, double *x, int N)
{
    //Aloca dinamicamente vetores auxiliares para resolver o sistema
    double *y = malloc(N * sizeof(double));
    double *z = malloc(N * sizeof(double));

    //Zera vetores
	for(int i = 0; i < N; i++)
	{
		z[i] = 0;
		y[i] = 0;
		x[i] = 0;
	}

	// L*y = b
	y[0] = b[0];
	for(int i = 1; i < N; i++)
	{
	    double sum = 0.0;
	    for(int j = 0; j <= i-1; j++)
            sum += L[i][j]*y[j];
		y[i] = b[i] - sum;
	}

	// D*z = y
	for(int i = 0; i < N; i++)
	{
		z[i] = y[i]/D[i];
	}

	// L^t*x = y
	x[N-1] = z[N-1];
	for(int i = N-2; i >= 0; i--)
	{
	    double sum = 0.0;
	    for(int j = i+1; j < N; j++)
            sum += L[j][i]*x[j];
		x[i] = z[i] - sum;
	}

    //Libera vari�veis alocadas dinamicamente
	free(y);
	free(z);
}

void solve_system(double **A, double *b, double *x, int N)
{
    //Aloca dinamicamente matrizes auxiliares para resolver o sistema
    double **L = malloc(N * sizeof(double *));
    for(int i = 0; i < N; i++)
        L[i] = malloc(N * sizeof(double));

    double *D = malloc(N * sizeof(double));

    //Decomposi��o LDL
	LDL_Fact(A, L, D, N);
	//Resolu��o do sistema LDL*x=b
	solve_LDL_system(L, D, b, x, N);

    //Libera vari�veis alocadas dinamicamente
	free(L);
	free(D);
}

double dot(double *a, double *b, int N)
{
    double dot_product = 0.0;

    //Produto interno
    for(int i = 0; i < N; i++)
    {
        dot_product += a[i]*b[i];
    }

    //Avisa o usu�rio caso o produto interno divirja
    if(!isfinite(dot_product))
        printf("Erro: produto interno divergiu!\n");

    return dot_product;
}

void create_normal_system(double **uk, double *ut, int N, int nf, double **An, double *bn)
{
    //Montagem da matriz normal An e do vetor normal b
    for(int i = 0; i < nf; i++)
    {
        bn[i] = dot(&uk[i][1], &ut[1], N);
        for(int j = 0; j < nf; j++)
        {
            if(j>=i)
                An[i][j] = dot(&uk[i][1], &uk[j][1], N);
            //Como a matriz � triangular, basta fazer o c�lculo para a metade superior,
            //e os elementos inferiores ser�o iguais aos elementos diagonalmente opostos.
            else
                 An[i][j] = An[j][i];
        }
    }
}

double uniform_rand(void)
{
    //Limita o valor retornado pela fun��o rand() entre [0,1[
    double rand_normalized = rand()/nextafter((double)RAND_MAX, DBL_MAX);

    //Converte o valor retornado para o intervalo [-1,1[
    double rnd = MIN_UNIFORM_RAND+rand_normalized*(MAX_UNIFORM_RAND - MIN_UNIFORM_RAND);

    return rnd;
}
