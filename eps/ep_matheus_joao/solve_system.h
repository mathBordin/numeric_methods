#ifndef SOLVE_SYSTEM_H
#define SOLVE_SYSTEM_H

#include <stdio.h>
#include <stdlib.h>
#include <math.h>

/**
 * Funcao que faz a decomposicao LDL^t da matriz A, tal
 * que A = LDL^t.
 *
 * @param A Matriz que armazena a diagonal e a subdiagonal
 * da matriz quadrada tridiagonal a ser decomposta.
 * @param L Vetor que representa subdiagonal da matriz L,
 * gerada na decomposicao.
 * @param D Vetor D que representa a diagonal da matriz D,
 * gerada na decomposicao.
 * @param N Tamanho da matriz A.
 */
void LDL_Fact(double **A, double *L, double *D, int N)
{
	for(int i = 0; i < N; i++)
	{
		L[i] = 0;
		D[i] = 0;
	}

	//Decomposição LDL simplificada para matriz tridiagonal simétrica e
	//armazenamento em vetores
    //A[0][i] é a diagonal da matriz A
    //A[1][i] é a subdiagonal da matriz A
    //L[i] é a subdiagonal da matriz L
    //D[i] é a diagonal da matriz D
	for(int i = 0; i < N; i++)
	{
	    D[i] = A[0][i] - pow(L[i], 2)*D[i-1];
	    if((i+1)<N)
            L[i+1] = A[1][i+1]/D[i];
	}
}

/**
 * Funcao que, dadas duas matriz L e D, geradas por uma decomposicao
 * A = LDL^t, e dado o vetor b, resolve o sistema LDL^t*x = b.
 *
 * @param L Vetor que representa subdiagonal da matriz L,
 * gerada na decomposicao.
 * @param D Vetor D que representa a diagonal da matriz D,
 * gerada na decomposicao.
 * @param b Vetor com os elementos do segundo membro do sistema.
 * @param x Vetor de saída com o resultado das icognitas.
 * @param N Tamanho da matriz A.
 */
void solve_LDL_system(double *L, double *D, double *b, double *x, int N)
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

	free(y);
	free(z);
}


/**
 * Funcao que resolve o sistema A*x = b, com auxílio da decomposicao
 * LDL^t.
 *
 * @param A Matriz com diagonal e subdiagonal da Matriz quadrada tridiagonal A.
 * @param b Vetor com as igualdades do lado direito do sistema.
 * @param x Vetor de saída com o resultado das icognitas.
 * @param N Tamanho da matriz A.
 */
void solve_tridiagonal_system(double **A, double *b, double *x, int N)
{
    //Aloca dinamicamente matrizes auxiliares para resolver o sistema
    double *L = malloc(N * sizeof(double));
    double *D = malloc(N * sizeof(double));

    //Decomposição LDL
	LDL_Fact(A, L, D, N);
	//Resolução do sistema LDL*x=b
	solve_LDL_system(L, D, b, x, N);

	free(L);
	free(D);
}

#endif // SOLVE_SYSTEM_H
