/**
 * @file aux_math.h
 *
 * @brief Header que implementa as funções relativas aos métodos matemáticos
 * utilizados na solução do problema.
 *
 * @author Matheus Bordin Gomes - 9838028 - Turma 2
 * @author João Ferreira Cysne - 10774020 - Turma 3
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
 * @param x Vetor de saída com o resultado das icognitas.
 * @param N Tamanho da matriz A.
 */
void solve_LDL_tridiagonal_system(double *L, double *D, double *b, double *x, int N);

/**
 * Funcao que resolve o sistema A*x = b, com auxílio da decomposicao
 * LDL^t. O sistema deve ser tridiagonal.
 *
 * @param A Matriz com diagonal e subdiagonal da Matriz quadrada tridiagonal A.
 * @param b Vetor com as igualdades do lado direito do sistema.
 * @param x Vetor de saída com o resultado das icognitas.
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
 * @param x Vetor de saída com o resultado das icognitas.
 * @param N Tamanho da matriz A.
 */
void solve_LDL_system(double **L, double *D, double *b, double *x, int N);

/**
 * Funcao que resolve o sistema A*x = b, com auxílio da decomposicao
 * LDL^t.
 *
 * @param A Matriz com diagonal e subdiagonal da Matriz quadrada tridiagonal A.
 * @param b Vetor com as igualdades do lado direito do sistema.
 * @param x Vetor de saída com o resultado das icognitas.
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
 * Função que monta o sistema normal (Ax=b) do conjunto de nf funções uk para aproximar a função ut.
 *
 * @param uk Matriz que contém em cada linha uma solução uk (funções aproximadoras).
 * @param ut Vetor que contém a solução que se quer aproximar (função aproximada).
 * @param N Número de pontos em que a barra foi dividida.
 * @param nf Número de soluções uk.
 * @param An Matriz normal.
 * @param bn Vetor b do lado direito do sistema normal.
 *
 * @return Produto interno entre os vetores a e b.
 */
void create_normal_system(double **uk, double *ut, int N, int nf, double **An, double *bn);

/**
 * Função que retorna um número aleatório com distribuição aproximadamente uniforme
 * entre MAX_UNIFORM_RAND e MIN_UNIFORM_RAND. Essa função foi implementada em cima da
 * função rand() da biblioteca padrão stdlib.h.
 *
 * @return Número pseudo-aleatório.
 */
double uniform_rand(void);

#endif // SOLVE_SYSTEM_H
