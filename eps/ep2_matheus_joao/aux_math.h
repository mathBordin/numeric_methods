/**
 * @file aux_math.h
 *
 * @brief Header que implementa as fun��es relativas aos m�todos matem�ticos
 * utilizados na solu��o do problema.
 *
 * @author Matheus Bordin Gomes - 9838028 - Turma 2
 * @author Jo�o Ferreira Cysne - 10774020 - Turma 3
 */

#ifndef SOLVE_SYSTEM_H
#define SOLVE_SYSTEM_H

#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define MAX_UNIFORM_RAND 1.0
#define MIN_UNIFORM_RAND -1.0

/**
 * Funcao que faz a decomposicao LDL^t da matriz tridiagonal A, tal
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
void LDL_Fact_tridiagonal(double **A, double *L, double *D, int N);

/**
 * Funcao que, dadas duas matriz L e D, geradas por uma decomposicao
 * A = LDL^t, e dado o vetor b, resolve o sistema LDL^t*x = b. O sistema
 * original deve ser tridiagonal.
 *
 * @param L Vetor que representa subdiagonal da matriz L,
 * gerada na decomposicao.
 * @param D Vetor D que representa a diagonal da matriz D,
 * gerada na decomposicao.
 * @param b Vetor com os elementos do segundo membro do sistema.
 * @param x Vetor de sa�da com o resultado das icognitas.
 * @param N Tamanho da matriz A.
 */
void solve_LDL_tridiagonal_system(double *L, double *D, double *b, double *x, int N);

/**
 * Funcao que resolve o sistema A*x = b, com aux�lio da decomposicao
 * LDL^t. O sistema deve ser tridiagonal.
 *
 * @param A Matriz com diagonal e subdiagonal da Matriz quadrada tridiagonal A.
 * @param b Vetor com as igualdades do lado direito do sistema.
 * @param x Vetor de sa�da com o resultado das icognitas.
 * @param N Tamanho da matriz A.
 */
void solve_tridiagonal_system(double **A, double *b, double *x, int N);

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
void LDL_Fact(double **A, double **L, double *D, int N);

/**
 * Funcao que, dadas duas matriz L e D, geradas por uma decomposicao
 * A = LDL^t, e dado o vetor b, resolve o sistema LDL^t*x = b.
 *
 * @param L Vetor que representa subdiagonal da matriz L,
 * gerada na decomposicao.
 * @param D Vetor D que representa a diagonal da matriz D,
 * gerada na decomposicao.
 * @param b Vetor com os elementos do segundo membro do sistema.
 * @param x Vetor de sa�da com o resultado das icognitas.
 * @param N Tamanho da matriz A.
 */
void solve_LDL_system(double **L, double *D, double *b, double *x, int N);

/**
 * Funcao que resolve o sistema A*x = b, com aux�lio da decomposicao
 * LDL^t.
 *
 * @param A Matriz com diagonal e subdiagonal da Matriz quadrada tridiagonal A.
 * @param b Vetor com as igualdades do lado direito do sistema.
 * @param x Vetor de sa�da com o resultado das icognitas.
 * @param N Tamanho da matriz A.
 */
void solve_system(double **A, double *b, double *x, int N);

/**
 * Funcao que calcula o produto interno entre os vetores a e b, ambos de tamanho N.
 *
 * @param a Vetor a.
 * @param b Vetor b.
 * @param N Tamanho dos vetores a e b.
 *
 * @return Produto interno entre os vetores a e b.
 */
double dot(double *a, double *b, int N);

/**
 * Fun��o que monta o sistema normal (Ax=b) do conjunto de nf fun��es uk para aproximar a fun��o ut.
 *
 * @param uk Matriz que cont�m em cada linha uma solu��o uk (fun��es aproximadoras).
 * @param ut Vetor que cont�m a solu��o que se quer aproximar (fun��o aproximada).
 * @param N N�mero de pontos em que a barra foi dividida.
 * @param nf N�mero de solu��es uk.
 * @param An Matriz normal.
 * @param bn Vetor b do lado direito do sistema normal.
 *
 * @return Produto interno entre os vetores a e b.
 */
void create_normal_system(double **uk, double *ut, int N, int nf, double **An, double *bn);

/**
 * Fun��o que retorna um n�mero aleat�rio com distribui��o aproximadamente uniforme
 * entre MAX_UNIFORM_RAND e MIN_UNIFORM_RAND. Essa fun��o foi implementada em cima da
 * fun��o rand() da biblioteca padr�o stdlib.h.
 *
 * @return N�mero pseudo-aleat�rio.
 */
double uniform_rand(void);

#endif // SOLVE_SYSTEM_H
