/**
 * @file heat_equation.h
 *
 * @brief Header das funções relativas a solução da equação
 * de calor.
 *
 * @author Matheus Bordin Gomes - 9838028 - Turma 2
 * @author João Ferreira Cysne - 10774020 - Turma 3
 */

#ifndef HEAT_EQUATION_H
#define HEAT_EQUATION_H

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "aux_math.h"

/**
 * Funcao da fonte de calor - f(t,x).
 *
 * @param [in] t Variavel de tempo, em um intervalo entre 0 e T.
 * @param [in] x Variavel de espaco, normalizada entre 0 e 1.
 * @param [in] N Numero de pontos em que o espaco foi discretizado.
 * @param [in] p Localização das fontes pontuais de calor.
 * @param [in] a Intensidade de cada uma das fontes.
 * @param [in] nf Numero de fontes pontuais.
 *
 * @return Valor da fonte de calor referente a tarefa passada em (t,x).
 */
double heat_source(double t, double x, int N, double *p, double *a, int nf);

/**
 * Função da distribuição inicial de calor - u0(x).
 *
 * @param [in] N Numero de pontos em que o espaco e discretizado.
 * @param [in, out] u Vetor com a condicao inicial de temperatura.
 */
void initial_heat_distribution(int N, double **u);

/**
 * Condicao de fronteira para a temperatura em x = 0 - g1(t).
 *
 * @param [in] M Numero de pontos em que o tempo e discretizado.
 * @param [in,out] u Matriz com a evolucao da temperatura ao longo do
 * espaco e do tempo.
 */
void temperature_boundary_cond_0(int M, double **u);

/**
 * Condicao de fronteira para a temperatura em x = 1 - g2(t).
 *
 * @param [in] M Numero de pontos em que o tempo e discretizado.
 * @param [in] N Numero de pontos em que o espaco e discretizado.
 * @param [in,out] u Matriz com a evolucao da temperatura ao longo do
 * espaco e do tempo
 */
void temperature_boundary_cond_1(int M, int N, double **u);

/**
 * Defini a distribuição de calor ut com base no metodo de Crank-Nicolson.
 * E necessario definir a condicao inicial na funcao
 * @ref initial_heat_distribution, a condicao de contorno no ponto 0
 * em @ref temperature_boundary_cond_0, a condicao de contorno no
 * ponto 1 em @ref temperature_boundary_cond_1 e, por fim, a equacao
 * da fonte de calor em @ref heat_source.
 *
 * @param [in] N Numero de pontos em que o espaco foi discretizado.
 * @param [in] T Tempo total.
 * @param [in] M Numero de pontos em que o tempo foi discretizado.
 * @param [in,out] ut Vetor com a distribuição de temperatura no instante T
 * @param [in] p Localização das fontes pontuais de calor.
 * @param [in] a Intensidade de cada uma das fontes.
 * @param [in] nf Numero de fontes pontuais.
 */
void solve_heat_equation(int N, int M, int T, double *ut, double *p, double *a, int nf);

#endif // HEAT_EQUATION_H
