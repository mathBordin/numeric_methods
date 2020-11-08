/**
 * @file inverse_problem.h
 *
 * @brief Header das funções relativas a solução do
 * problema inverso.
 *
 * @author Matheus Bordin Gomes - 9838028 - Turma 2
 * @author João Ferreira Cysne - 10774020 - Turma 3
 */

#ifndef INVERSE_PROBLEM_M
#define INVERSE_PROBLEM_M

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "aux_math.h"
#include "heat_equation.h"

/**
 * Função que gera as soluções uk para o problema de nf
 * fontes pontuais de calor posicionadas nos pontos p.
 *
 * @param uk Matriz que conterá em cada linha, uma das nf soluções
 * @param N  Número de pontos em que a barra foi discretizada.
 * @param M  Número de instantes em que o tempo foi discretizado.
 * @param T  Instante máximo de tempo.
 * @param p  Pontos em que serão posicionadas as fontes pontuais.
 * @param nf Número de fontes pontuais
 */
void generate_uk_solutions(double **uk, int N, int M, int T, double *p, int nf);

/**
 * Função que resolve o problema inverso para uma dada solução ut,
 * para as nf fontes pontuais posicionadas nos pontos p.
 *
 * @param ut Vetor com a temperatura na barra em um dado instante T.
 * @param N Número de pontos em que a barra foi discretizada.
 * @param M  Número de instantes em que o tempo foi discretizado.
 * @param T  Instante máximo de tempo.
 * @param p Vetor com a posição das fontes pontuais.
 * @param nf Número de fontes pontuais.
 * @param a Solução da aproximação de ut por nf fontes uk.
 *
 * @return Erro E2 com a solução obtida.
 */
double solve_inverse_problem(double *ut, int N, int M, int T, double *p, int nf, double *a);


/**
 * Função que avalia o erro E2, dado pela equação (39) do enunciado, obtido na resolução.
 * Além disso, essa função salva tanto a solução definida como a solução obtida em um arquivo
 * de texto definido pelo usuário.
 *
 * @param uk Matriz que contém em cada linha uma solução uk (funções aproximadoras).
 * @param ut Vetor que contém a solução que se quer aproximar (função aproximada).
 * @param a Peso de cada função aproximadora (de cada solução para uma fonte pontual obtida).
 * @param N Número de pontos em que a barra foi discretizada.
 * @param nf Número de fontes pontuais.
 *
 * @return E2
 */
double evaluete_e2(double **uk, double *ut, double *a, int N, int nf);

#endif // INVERSE_PROBLEM_M
