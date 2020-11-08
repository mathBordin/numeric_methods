/**
 * @file main.c
 *
 * @brief Exercicio programa 1 para a disciplina MAP3121: Um problema inverso para obtencao
 * de distribuicao de temperatura.
 *
 * @author Matheus Bordin Gomes - 9838028 - Turma 2
 * @author Joao Ferreira Cysne - 10774020 - Turma 3
 */

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "heat_equation.h"

int main()
{
    printf("MAP3121 - EP Parte 1: Um problema inverso para obtencao de distribuicao de temperatura\n");
    printf("Matheus Bordin Gomes - 9838028 - Turma 2\n");
    printf("Joao Ferreira Cysne - 10774020 - Turma 3\n\n\n");

    printf("Qual metodo deseja utilizar para resolver os problemas? \n");
    printf("- Digite 0 para o metodo das diferencas finitas\n");
    printf("- Digite 1 para o metodo de Euler implicito\n");
    printf("- Digite 2 para o metodo de Crank-Nicolson\n");
    printf("Metodo escolhido: ");

    int met = 0; /*!< Variável para leitura do método de resolução. */
    method_t method;  /*!< Armazena o método que será utilizado na resolução do problema. */

    //Leitura de qual será o método utilizado para a resolução do problema
    scanf("%i", &met);
    printf("\n");
    if((met != 0) && (met != 1) && (met != 2))
    {
        printf("Valor de entrada invalido. Metodo padrao sera utilizado (diferencas finitas)!\n\n");
        method = FINITE_DIFF_METHOD;
    }
    else if(met == 0)
    {
        printf("Metodo de diferencas finitas escolhido!\n\n");
        method = FINITE_DIFF_METHOD;
    }
    else if(met == 1)
    {
        printf("Metodo de Euler implicito escolhido!\n\n");
        method = EULER_METHOD;
    }
    else if(met == 2)
    {
        printf("Metodo de Crank-Nicolson escolhido!\n\n");
        method = CRANK_NICOLSON_METHOD;
    }

    printf("- Digite 0 para resolver o item a) da Primeira Tarefa (teste)\n");
    printf("- Digite 1 para resolver o item a) da Primeira Tarefa\n");
    printf("- Digite 2 para resolver o item b) da Primeira Tarefa\n");
    printf("- Digite 3 para resolver o item c) da Primeira Tarefa\n");
    printf("Selecione qual exercicio voce deseja resolver: ");

    int tarefa = 0; /*!< Armazena qual será a tarefa resolvida. */
    int T = 1; /*!< O tempo varia de 0 a T. */
    int N; /*!< Número de discretizações no espaço. */
    int M; /*!< Número de instantes que o intervalo de tempo foi discretizado. */
    int calc_err; /*!< Indica se é necessário calcular o erro para a tarefa escolhida. */
    double lambda; /*!< Equivalente a delta_t/delta_x^2. */
    double delta_x; /*!< Passo de discretização do espaço. */
    double delta_t; /*!< Passo de discretização do tempo. */
    double error; /*!< Erro obtido no método. */
    double **u;  /*!< Matriz que armazena a evolução da temperatura. */

    //Leitura de qual será o problema a ser resolvido
    scanf("%i", &tarefa);
    printf("\n");
    if((tarefa != 0) && (tarefa != 1) && (tarefa != 2) && (tarefa != 3))
    {
        //Caso o método escolhido seja inválido, o método de diferenças finitas será utilizado
        printf("Valor de entrada invalido. Exercicio padrao sera utilizado (item a) da Primeira Tarefa)!\n\n");
        tarefa = 1;
    }

    if(tarefa == 0)
        printf("Item a) (teste) da Primeira Tarefa escolhido!\n\n");
    else if(tarefa == 1)
        printf("Item a) da Primeira Tarefa escolhido!\n\n");
    else if(tarefa == 2)
        printf("Item b) da Primeira Tarefa escolhido!\n\n");
    else if(tarefa == 3)
        printf("Item c) da Primeira Tarefa escolhido!\n\n");

    //Leitura do valor de N
    printf("Escolha um valor inteiro e maior do que zero para N: ");
    scanf("%i", &N);
    printf("\n");

    if(method == FINITE_DIFF_METHOD)
    {
        //Leitura do valor de lambda
        printf("Escolha um valor real e maior do que zero para lambda: ");
        scanf("%lf", &lambda);
        //Avisa caso o método vá divergir
        if(lambda > 0.5)
            printf("Valor de lambda maior do que 0.5, o metodo ira divergir!\n");
        //Calculo dos valores de M, delta_t e delta_x com base em N
        M = (int)round(T*pow(N,2.0)/lambda) + 1;
        delta_x = (double)1/N;
        delta_t = (double)T/M;
    }
    else
    {
        //Calculo dos valores de M, delta_t e delta_x com base em N
        delta_x = (double)1/N;
        delta_t = delta_x;
        M = (int)T/delta_t + 1;
    }

    //Aloca dinamicamente a matriz de temperaturas u, de acordo com M e N escolhidos
    u = malloc(M * sizeof(double *));
    for(int i = 0; i < M; i++)
        u[i] = malloc((N+1) * sizeof(double));

    if(method == FINITE_DIFF_METHOD)
    {
        printf("\nResolvendo o problema com o metodo de Diferencas Finitas...\n\n");
    }
    else if(method == EULER_METHOD)
    {
        printf("\nResolvendo o problema com o metodo de Euler implicito...\n\n");
    }
    else
    {
        printf("\nResolvendo o problema com o metodo de Crank-Nicolson...\n\n");
    }

    if(tarefa != 3) // Não é necessário calcular o erro no item c)
        calc_err = 1;
    else
        calc_err = 0;

    //Resolução do problema
    error = solve_heat_equation(N, M, T, u, method, calc_err, tarefa);

    if(error == -1.0) //Nesse caso, o método divergiu
        printf("Problema nao resolvido. O metodo divergiu!\n\n");
    else
    {
        //Printa valor do erro, caso tenha sido calculado
        if(calc_err)
            printf("\nMaximo erro relativo = %.12lf\n\n", error);

        printf("Salvando dados...\n\n");

        int passo;
        int range;
        if(delta_t >= 0.1)
        {
            passo = 1;
            range = M;
        }
        else
        {
            passo = (int)floor(0.1/delta_t);
            range = 11;
        }

        //Salva os dados a cada 0.1s no arquivo dados_ep.txt
        FILE *fp ; /*!< Ponteiro para o arquivo onde os dados serão salvos. */
        fp = fopen("dados_ep.txt", "w") ;
        if (fp == NULL)
        {
            printf("Nao foi possivel abrir o arquivo dados_ep.txt\n") ;

            for(int i = 0; i < M; i++)
                free(u[i]);
            free(u);

            return 0;
        }

        for(int k = 0; k < range; k++)
        {
            for(int i = 0; i <= N; i++)
            {
                fprintf(fp, "%.10f ", u[k*passo][i]);
            }
            fprintf(fp, "\n");
        }

        printf("Dados salvos em dados_ep.txt com sucesso!\n");
        fclose(fp) ;
    }

    for(int i = 0; i < M; i++)
		free(u[i]);
    free(u);

    getchar();
    return 0;
}
