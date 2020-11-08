/**
 * @file heat_equation.h
 *
 * @brief Header que implementa as funções relativas a solução da equação
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
#include "solve_system.h"

/**
 * Tipo de variável que representa os três possíveis métodos
 * para resolver o problema.
 */
typedef enum
{
    FINITE_DIFF_METHOD,
    EULER_METHOD,
    CRANK_NICOLSON_METHOD
}   method_t;

/**
 * Funcao da fonte de calor - f(t,x).
 *
 * @param [in] t Variavel de tempo, em um intervalo entre 0 e T.
 * @param [in] x Variavel de espaco, normalizada entre 0 e 1.
 * @param [in] N Numero de pontos em que o espaco foi discretizado.
 * @param [in] tarefa Qual tarefa esta sendo resolvida.
 *
 * @return Valor da fonte de calor referente a tarefa passada em (t,x).
 */
double heat_source(double t, double x, int N, int tarefa)
{
    double temp = 0.0;

    //De acordo com a tarefa escolhida, será utilizada uma função
    //para a fonte de calor
    if(tarefa == 0)
    {
        temp = (10.0*pow(x,2.0)*(x-1.0));
        temp -= (60.0*x*t);
        temp += (20.0*t);
    }
    else if(tarefa == 1)
    {
        temp = (10.0*cos(10.0*t)*pow(x, 2.0)*pow(1.0 - x, 2.0));
        temp -= ((1.0 + sin(10.0*t))*(12.0*pow(x, 2.0) - 12.0*x + 2.0));
    }
    else if(tarefa == 2)
    {
        temp = 5.0*exp(t-x)*((5.0*pow(t,2.0)*cos(5.0*t*x))-((2.0*t+x)*sin(5.0*t*x)));
    }
    else if(tarefa == 3)
    {
        double h = (double)1/N;
        double p = 0.25;
        double delta_err = 0.0000000000000001;
        if ((((p-h/2.0)-delta_err) <= x) && (x <= ((p+h/2.0)+delta_err)))
        {
            temp = 10000.0*(1.0-2.0*pow(t,2.0))/h;
        }
        else
            temp = 0.0;
    }

    return temp;
}

/**
 * Solucao exata da equacao de calor
 *
 * @param [in] t Variavel de tempo, em um intervalo entre 0 e T.
 * @param [in] x Variavel de espaco, normalizada entre 0 e 1.
 * @param [in] tarefa Qual tarefa esta sendo resolvida.
 *
 * @return Valor da solução exata referente a tarefa passada em (t,x).
 */
double exact_solution(double t, double x, int tarefa)
{
    double temp = 0.0;

    //De acordo com a tarefa escolhida, será utilizada uma função
    //como solução exata
    if(tarefa == 0)
    {
        temp = 10.0*t*pow(x,2.0)*(x-1.0);
    }
    else if(tarefa == 1)
    {
        temp = (1.0 + sin(10.0*t))*pow(x, 2.0)*pow(1.0 - x, 2.0);
    }
    else if(tarefa == 2)
    {
        temp = exp(t-x)*cos(5.0*t*x);
    }

    return temp;
}

/**
 * Função da distribuição inicial de calor - u0(x).
 *
 * @param [in] N Numero de pontos em que o espaco e discretizado.
 * @param [in, out] u Vetor com a condicao inicial de temperatura.
 * @param [in] tarefa Qual tarefa esta sendo resolvida.
 */
void initial_heat_distribution(int N, double **u, int tarefa)
{
    //De acordo com a tarefa escolhida, será utilizada uma função
    //como distribuição inicial de calor
    if(tarefa == 0)
    {
        for(int i = 0; i < N; i++)
            u[0][i] = 0.0;
    }
    else if(tarefa == 1)
    {
        double delta_x = (double)1/(N-1);
        for(int i = 0; i < N; i++)
            u[0][i] = pow((double)i*delta_x, 2.0)*pow(1.0 - (double)i*delta_x, 2.0);
    }
    else if(tarefa == 2)
    {
        double delta_x = (double)1/(N-1);
        delta_x = -1.0*delta_x;
        for(int i = 0; i < N; i++)
            u[0][i] = exp((double)i*delta_x);
    }
    else if(tarefa == 3)
    {
        for(int i = 0; i < N; i++)
            u[0][i] = 0.0;
    }
}

/**
 * Condicao de fronteira para a temperatura em x = 0 - g1(t).
 *
 * @param [in] M Numero de pontos em que o tempo e discretizado.
 * @param [in,out] u Matriz com a evolucao da temperatura ao longo do
 * espaco e do tempo.
 * @param [in] tarefa Qual tarefa esta sendo resolvida.
 */
void temperature_boundary_cond_0(int M, double **u, int tarefa)
{
    //De acordo com a tarefa escolhida, será utilizada uma função
    //como condicao de fronteira
    if(tarefa == 0)
    {
        for(int k = 1; k < M; k++)
            u[k][0] = 0.0;
    }
    else if(tarefa == 1)
    {
        for(int k = 1; k < M; k++)
            u[k][0] = 0.0;
    }
    else if(tarefa == 2)
    {
        double delta_t = (double)1/(M-1);
        for(int k = 1; k < M; k++)
            u[k][0] = exp((double)k*delta_t);
    }
    else if(tarefa == 3)
    {
        for(int k = 1; k < M; k++)
            u[k][0] = 0.0;
    }
}

/**
 * Condicao de fronteira para a temperatura em x = 1 - g2(t).
 *
 * @param [in] M Numero de pontos em que o tempo e discretizado.
 * @param [in] N Numero de pontos em que o espaco e discretizado.
 * @param [in,out] u Matriz com a evolucao da temperatura ao longo do
 * espaco e do tempo
 * @param [in] tarefa Qual tarefa esta sendo resolvida.
 */
void temperature_boundary_cond_1(int M, int N,double **u, int tarefa)
{
    //De acordo com a tarefa escolhida, será utilizada uma função
    //como condicao de fronteira
    if(tarefa == 0)
    {
        for(int k = 1; k < M; k++)
            u[k][N-1] = 0.0;
    }
    else if(tarefa == 1)
    {
        for(int k = 1; k < M; k++)
            u[k][N-1] = 0.0;
    }
    else if(tarefa == 2)
    {
        double delta_t = (double)1/(M-1);
        for(int k = 1; k < M; k++)
            u[k][N-1] = exp((double)k*delta_t-1.0)*cos((double)k*5.0*delta_t);
    }
    else if(tarefa == 3)
    {
        for(int k = 1; k < M; k++)
            u[k][N-1] = 0.0;
    }
}


/**
 * Funcao que calcula o erro de truncamento.
 *
 * @param [in] M Numero de pontos em que o tempo e discretizado.
 * @param [in] N Numero de pontos em que o espaco e discretizado.
 * @param [in,out] u Matriz com a evolucao da temperatura ao longo do
 * espaco e do tempo.
 * @param [in] tarefa Qual tarefa esta sendo resolvida.
 * @param [in] method Qual metodo esta sendo utilizado.
 *
 * @return Erro de truncamento, caso calculado. -2.0, caso tenha divergido.
 */
double truncation_error(int N, int M, double **u, int tarefa, method_t method)
{
    double t_error = 0.0;
    double t_error_aux = 0.0;
    double delta_t = (double)1/(M-1);
    double delta_x = (double)1/N;

    //Calcula o maior erro de truncamento no instante M-2 (t=T-delta_t), visto que é necessária
    //a solução em (t=T) para o cálculo.
    for(int i = 1; i < N - 1; i++)
    {
        //De acordo com o método utilizado, usa-se uma fórmula para o erro de truncamento,
        if(method == FINITE_DIFF_METHOD)
        {
            t_error_aux = ((u[M-1][i]-u[M-2][i])/delta_t) - ((u[M-2][i-1] - 2*u[M-2][i] + u[M-2][i+1])/pow(delta_x, 2.0)) - heat_source((double)delta_t*(M-2), (double)i*delta_x, N, tarefa);
        }
        else if(method == EULER_METHOD)
        {
            t_error_aux = ((u[M-1][i]-u[M-2][i])/delta_t) - ((u[M-1][i-1] - 2*u[M-1][i] + u[M-1][i+1])/pow(delta_x, 2.0)) - heat_source((double)delta_t*(M-1), (double)i*delta_x, N, tarefa);
        }
        else
        {
            t_error_aux = (2*(u[M-1][i]-u[M-2][i])/delta_t) - (((u[M-1][i-1] - 2*u[M-1][i] + u[M-1][i+1]) + (u[M-2][i-1] - 2*u[M-2][i] + u[M-2][i+1]))/pow(delta_x, 2.0)) - (heat_source((double)delta_t*(M-2), (double)i*delta_x, N, tarefa) + heat_source((double)delta_t*(M-1), (double)i*delta_x, N, tarefa));
        }

        //Verifica se o valor divergiu
        if(!isfinite(t_error_aux))
        {
            return t_error = -2.0;
        }

        if(fabs(t_error_aux) > fabs(t_error))
            t_error = t_error_aux;
    }
    return t_error;
}

/**
 * Resolve a equacao de calor com base no metodo de diferencas
 * finitas, para dado lambda. E necessario definir a condicao
 * inicial na funcao @ref initial_heat_distribution, a condicao
 * de contorno no ponto 0 em @ref temperature_boundary_cond_0,
 * a condicao de contorno no ponto 1 em @ref temperature_boundary_cond_1
 * e, por fim, a equacao da fonte de calor em @ref heat_source.
 *
 * @param N Numero de pontos em que o espaco foi discretizado.
 * @param T Tempo total.
 * @param M Numero de pontos em que o tempo foi discretizado.
 * @param u Matriz com a evolucao da temperatura ao longo do
 * espaco e do tempo.
 * @param method Define o método de resolucao da equacao do calor.
 * @param calculate_error Caso seja 1, o erro será calculado. Caso seja 0,
 * o erro nao sera calculado.s
 * @param [in] tarefa Qual tarefa esta sendo resolvida.
 *
 * @return Retorna o erro relativo absoluto máximo em T. Caso retorne
 * -1, quer dizer que o metodo divergiu. Caso retorne -2, quer dizer que
 * o metodo escolhido e invalido. Caso retorne -3, o erro nao foi calculado.
 */
double solve_heat_equation(int N, int M, int T, double **u, method_t method, int calculate_error, int tarefa)
{
    //Calculo de delta_x, delta_t e lambda
    double delta_x = (double)1/N;
    double delta_t = (double)T/(M-1);
    double lambda = delta_t/pow(delta_x, 2);

    //Seta condição inicial e condições de contorno
    initial_heat_distribution(N+1, u, tarefa);
    temperature_boundary_cond_0(M, u, tarefa);
    temperature_boundary_cond_1(M, N+1, u, tarefa);

    //Aloca dinamicamente a matriz A e o vetor b, auxiliares para os métodos da segunda tarefa
    double **A = malloc(2 * sizeof(double *));
    for(int i = 0; i < 2; i++)
        A[i] = malloc((N-1) * sizeof(double));
    double *b = malloc((N-1) * sizeof(double));

    double a_diag; //Armazenará o valor dos termos da diagonal da matriz A
    double a_subdiag; //Armazenará o valor dos termos das subdiagonais da matriz A

    //Resolve o problema de acordo com o método escolhido
    switch(method)
    {
        case FINITE_DIFF_METHOD:
            for(int k = 1; k < M; k++)
            {
                for(int i = 1; i < N; i++)
                {
                    u[k][i] = u[k-1][i] + delta_t*((u[k-1][i-1]-2*u[k-1][i]+u[k-1][i+1])/pow(delta_x,2.0)) + delta_t*(heat_source((double)delta_t*k, (double)delta_x*i, N, tarefa));
                }
            }
            break;
        case EULER_METHOD:
            a_diag = 1.0 + 2.0*lambda;
            a_subdiag = -1.0*lambda;

            A[0][0] = a_diag;
            A[1][0] = 0.0;
            for(int i = 1; i < N-1; i++)
            {
                A[0][i] = a_diag;
                A[1][i] = a_subdiag;
            }

            for(int k = 1; k < M; k++)
            {
                b[0] = u[k-1][1]+delta_t*heat_source((double)delta_t*k,(double)delta_x, N, tarefa)+lambda*u[k][0];
                for(int i = 1; i < N-2; i++)
                {
                    b[i] = u[k-1][i+1]+delta_t*heat_source((double)delta_t*k,(double)delta_x*(i+1), N, tarefa);
                }
                b[N-2] = u[k-1][N-1]+delta_t*heat_source(delta_t*k,delta_x*(N-1), N, tarefa)+lambda*u[k][N];
                solve_tridiagonal_system( A, b, &u[k][1], N-1);
            }
            break;
        case CRANK_NICOLSON_METHOD:
            a_diag = 1.0 + lambda;
            a_subdiag = -1.0*lambda/2.0;

            A[0][0] = a_diag;
            A[1][0] = 0.0;
            for(int i = 1; i < N-1; i++)
            {
                A[0][i] = a_diag;
                A[1][i] = a_subdiag;
            }

            for(int k = 1; k < M; k++)
            {
                b[0] = u[k-1][1]+(lambda/2)*(u[k-1][0]-2*u[k-1][1]+u[k-1][2])
                       +(delta_t/2)*(heat_source((double)delta_t*k,(double)delta_x, N, tarefa)+heat_source((double)delta_t*(k-1),(double)delta_x, N, tarefa))+(lambda/2)*u[k][0];
                for(int i = 1; i < N-2; i++)
                {
                    b[i] = u[k-1][i+1]+(lambda/2)*(u[k-1][i]-2*u[k-1][i+1]+u[k-1][i+2])
                        +(delta_t/2)*(heat_source((double)delta_t*k,(double)delta_x*(i+1), N, tarefa)+heat_source((double)delta_t*(k-1),(double)delta_x*(i+1), N, tarefa));
                }
                b[N-2] = u[k-1][N-1]+(lambda/2)*(u[k-1][N-2]-2*u[k-1][N-1]+u[k-1][N])
                         +(delta_t/2)*(heat_source((double)delta_t*k,(double)delta_x*(N-1), N, tarefa)+heat_source((double)delta_t*(k-1),(double)delta_x*(N-1), N, tarefa))+(lambda/2)*u[k][N];

                solve_tridiagonal_system( A, b, &u[k][1], N-1);
            }
            break;
        default:
            printf("Metodo invalido!\n\n");
            return -2.0;
    }

    for(int i = 0; i < 2; i++)
        free(A[i]);
    free(A);
    free(b);

    //Calcula o erro de truncamento, caso tenha sido pedido
    if(calculate_error)
    {
        double t_error = truncation_error(N, M, u, tarefa, method);
        if(t_error == -2.0)
            printf("Erro de truncamento divergiu!\n");
        else
            printf("Erro de truncamento = %.12lf\n\n", t_error);
    }

    //Calcula o erro, caso tenha sido pedido
    if(calculate_error)
    {
        double exact = 0.0;
        double final_error = 0.0;
        double final_error_aux = 0.0;
        double erro_abs = 0.0;
        double erro_abs_aux = 0.0;
        //Calcula o maior valor absoluto do erro no instante T=1
        //e também o maior valor do erro relativo nesse instante
        for(int i = 0; i <= N; i++)
        {
            exact = exact_solution((double)T, (double)delta_x*i, tarefa); //Valor da solução exata
            if(exact == 0)
                final_error_aux = fabs(exact - u[M-1][i]);
            else
                final_error_aux = fabs((exact - u[M-1][i])/exact);

            erro_abs_aux = fabs(exact - u[M-1][i]);

            //Verifica se o erro divergiu
            if(!isfinite(final_error_aux))
            {
                return final_error = -1.0;
            }

            if(final_error_aux > final_error)
                final_error = final_error_aux;

            if(erro_abs_aux > erro_abs)
                erro_abs = erro_abs_aux;
        }
        printf("Maximo erro absoluto = %.12lf\n", erro_abs);
        return final_error;
    }
    else
        return -3.0;
}

#endif // HEAT_EQUATION_H
