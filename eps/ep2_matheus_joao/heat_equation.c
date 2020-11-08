/**
 * @file heat_equation.h
 *
 * @brief Arquivo que implementa as funções relativas a solução da equação
 * de calor.
 *
 * @author Matheus Bordin Gomes - 9838028 - Turma 2
 * @author João Ferreira Cysne - 10774020 - Turma 3
 */

#include "heat_equation.h"

/**
 * Função r(t) utilizada nos testes.
 *
 * @param [in] t Argumento da função.
 */
static double r_t(double t)
{
    double r;

    r = 10*(1+cos(5*t));

    return r;
}

double heat_source(double t, double x, int N, double *p, double *a, int nf)
{
    double temp = 0.0;
    double h = (double)1/N;
    double delta_err = 0.0000000000000001;

    for(int i = 0; i < nf; i++)
    {
        if ((((p[i]-h/2.0)-delta_err) <= x) && (x <= ((p[i]+h/2.0)+delta_err)))
            temp += a[i]*r_t(t)/h;
    }

    return temp;
}

void initial_heat_distribution(int N, double **u)
{
    for(int i = 0; i < N; i++)
        u[0][i] = 0.0;
}

void temperature_boundary_cond_0(int M, double **u)
{
    for(int k = 1; k < M; k++)
        u[k][0] = 0.0;
}

void temperature_boundary_cond_1(int M, int N, double **u)
{
    for(int k = 1; k < M; k++)
        u[k][N-1] = 0.0;
}

void solve_heat_equation(int N, int M, int T, double *ut, double *p, double *a, int nf)
{
    //Calculo de delta_x, delta_t e lambda
    double delta_x = (double)1/N;
    double delta_t = (double)T/(M-1);
    double lambda = delta_t/pow(delta_x, 2);

    double **u = malloc(M * sizeof(double *)); /*!< Matriz que armazena a evolução da temperatura. */
    for(int i = 0; i < M; i++)
        u[i] = malloc((N+1) * sizeof(double));

    //Seta condição inicial e condições de contorno
    initial_heat_distribution(N+1, u);
    temperature_boundary_cond_0(M, u);
    temperature_boundary_cond_1(M, N+1, u);

    //Aloca dinamicamente a matriz A e o vetor b
    double **A = malloc(2 * sizeof(double *));
    for(int i = 0; i < 2; i++)
        A[i] = malloc((N-1) * sizeof(double));
    double *b = malloc((N-1) * sizeof(double));

    double a_diag; //Armazenará o valor dos termos da diagonal da matriz A
    double a_subdiag; //Armazenará o valor dos termos das subdiagonais da matriz A

    //Monta matriz A do método de Crank-Nicolson
    a_diag = 1.0 + lambda;
    a_subdiag = -1.0*lambda/2.0;

    A[0][0] = a_diag;
    A[1][0] = 0.0;
    for(int i = 1; i < N-1; i++)
    {
        A[0][i] = a_diag;
        A[1][i] = a_subdiag;
    }

    //Resolve o problema utilizando o método de Crank-Nicolson
    for(int k = 1; k < M; k++)
    {
        b[0] = u[k-1][1]+(lambda/2)*(u[k-1][0]-2*u[k-1][1]+u[k-1][2])
               +(delta_t/2)*(heat_source((double)delta_t*k,(double)delta_x, N, p, a, nf)+heat_source((double)delta_t*(k-1),(double)delta_x, N, p, a, nf))+(lambda/2)*u[k][0];
        for(int i = 1; i < N-2; i++)
        {
            b[i] = u[k-1][i+1]+(lambda/2)*(u[k-1][i]-2*u[k-1][i+1]+u[k-1][i+2])
                   +(delta_t/2)*(heat_source((double)delta_t*k,(double)delta_x*(i+1), N, p, a, nf)+heat_source((double)delta_t*(k-1),(double)delta_x*(i+1), N, p, a, nf));
        }
        b[N-2] = u[k-1][N-1]+(lambda/2)*(u[k-1][N-2]-2*u[k-1][N-1]+u[k-1][N])
                 +(delta_t/2)*(heat_source((double)delta_t*k,(double)delta_x*(N-1), N, p, a, nf)+heat_source((double)delta_t*(k-1),(double)delta_x*(N-1), N, p, a, nf))+(lambda/2)*u[k][N];

        solve_tridiagonal_system( A, b, &u[k][1], N-1);
    }

    //Retorna a solução no instante T
    for(int i = 0; i < N+1; i++)
        ut[i] = u[M-1][i];

    //Libera variáveis alocadas dinamicamente
    for(int i = 0; i < M; i++)
        free(u[i]);
    free(u);
    for(int i = 0; i < 2; i++)
        free(A[i]);
    free(A);
    free(b);
}
