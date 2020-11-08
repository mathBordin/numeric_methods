/**
 * @file main.c
 *
 * @brief Exercicio Programa 2 da disciplina MAP3121: Um problema inverso para a equacao do calor
 *
 * @author Matheus Bordin Gomes - 9838028 - Turma 2
 * @author Joao Ferreira Cysne - 10774020 - Turma 3
 */

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include "aux_math.h"
#include "heat_equation.h"
#include "inverse_problem.h"

int main()
{
    printf("MAP3121 - EP Parte 2: Um problema inverso para a equacao do calor\n");
    printf("Matheus Bordin Gomes - 9838028 - Turma 2\n");
    printf("Joao Ferreira Cysne - 10774020 - Turma 3\n\n\n");

    printf("Qual dos casos voce deseja rodar (a,b,c,d)? \n");
    printf("Caso escolhido: ");
    char caso = getchar();

    if((caso != 'a') && (caso != 'b') && (caso != 'c') && (caso != 'd'))
    {
        printf("O caso escolhido e invalido. Sera utilizado como exemplo o item a!\n");
        caso = 'a';
    }

    int T = 1; //Instante final de tempo

    //Resolve o problema para cada um dos casos
    if(caso == 'a')
    {
        int N = 128; // Número de pontos em que a barra será discretizado
        int M = N + 1; // Número de instantes em que o tempo será discretizado
        int nf = 1; // Número de fontes pontuais de calor
        double p[1] = {0.35}; // Posição das fontes pontuais de calor
        double a_exact[1] = {7.0}; // Peso de cada fonte pontual de calor
        double a[1] = {0.0}; // Vetor que irá receber a solução com o peso de cada fonte pontual

        // Alocação dinâmica do vetor que irá conter a solução ut
        double *ut = malloc((N+1) * sizeof(double));

        //Define ut
        solve_heat_equation(N, M, T, ut, p, a_exact, nf);

        //Resolve o problema inverso.
        double e2 = solve_inverse_problem(ut, N, M, T, p, nf, a);

        //Printa os resultados obtidos
        printf("A solucao exata e a = %.10lf \n", a_exact[0]);
        printf("A solucao encontrada foi a = %.10lf \n\n", a[0]);
        printf("E_2 = %.10lf\n", e2);

        free(ut);
    }
    else if(caso == 'b')
    {
        int N = 128; // Número de pontos em que a barra será discretizado
        int M = N + 1; // Número de instantes em que o tempo será discretizado
        int nf = 4; // Número de fontes pontuais de calor
        double p[4] = {0.15, 0.3, 0.7, 0.8}; // Posição das fontes pontuais de calor
        double a_exact[4] = {2.3, 3.7, 0.3, 4.2}; // Peso de cada fonte pontual de calor
        double a[4] = {0.0}; // Vetor que irá receber a solução com o peso de cada fonte pontual

        // Alocação dinâmica do vetor que irá conter a solução ut
        double *ut = malloc((N+1) * sizeof(double));

        //Define ut
        solve_heat_equation(N, M, T, ut, p, a_exact, nf);

        //Resolve o problema inverso.
         double e2 = solve_inverse_problem(ut, N, M, T, p, nf, a);

        //Printa os resultados obtidos
        printf("A solucao exata é a_i = \n");
        for(int i = 0; i < nf; i++)
            printf("%.10lf ", a_exact[i]);
        printf("\n");
        printf("A solucao encontrada foi a_k =\n");
        for(int i = 0; i < nf; i++)
            printf("%.10lf ", a[i]);
        printf("\n");
        printf("E_2 = %.10lf\n", e2);

        free(ut);
    }
    else if(caso == 'c')
    {
        int N; // Número de pontos em que a barra será discretizado
        printf("\nDigite o valor o valor desejado de N (128,256,512,1024,2048): ");
        scanf("%i", &N);

        if((N!=128)&&(N!=256)&&(N!=512)&&(N!=1024)&&(N!=2048))
        {
            printf("O valor escolhido para N e invalido. Sera utilizado N = 2048.");
            N = 2048;
        }

        int M = N + 1; // Número de instantes em que o tempo será discretizado
        int nf = 10; // Número de fontes pontuais de calor
        double p[10]; // Posição das fontes pontuais de calor
        double a[10]; // Vetor que irá receber a solução com o peso de cada fonte pontual

        // Alocação dinâmica do vetor que irá conter a solução ut
        double *ut = malloc((N+1) * sizeof(double));

        // Leitura do arquivo
        FILE *fp;
        fp = fopen("teste.txt","r");

        // Verifica se o arquivo foi encontrado
        if (fp == NULL) {
            printf("Nao foi possivel ler o arquivo. O programa sera fechado! \n");

            return 0;
        }

        //Lê a posição das fontes pontuais
        for(int i = 0; i < nf; i++)
        {
            fscanf(fp, "%lf", &p[i]);
        }
        printf("\n");

        //Lê os dados de ut
        int jump = (2048/N)-1; // Número de dados que serão descartados entre cada dado lido
        int ind = 0;
        int jump_ctr = jump;
        double trash;
        while(!feof(fp))
        {
            if(jump_ctr == jump)
            {
                fscanf(fp, "%lf", &ut[ind++]);
                jump_ctr = 0;
            }
            else
            {
                fscanf(fp, "%lf", &trash);
                jump_ctr++;
            }
        }

        //Fecha o arquivo
        fclose(fp);

        //Resolve o problema inverso.
        double e2 = solve_inverse_problem(ut, N, M, T, p, nf, a);

        //Printa os resultados obtidos
        printf("A solucao encontrada foi a_k =\n");
        for(int i = 0; i < nf; i++)
            printf("%.10lf ", a[i]);
        printf("\n\n");
        printf("E_2 = %.10lf\n", e2);

        free(ut);
    }
    else if(caso == 'd')
    {
        srand((unsigned)time(NULL)); //Insere uma nova semente para o gerador de números aleatórios

        int N; // Número de pontos em que a barra será discretizado
        printf("\nDigite o valor o valor desejado de N (128,256,512,1024,2048): ");
        scanf("%i", &N);

        if((N!=128)&&(N!=256)&&(N!=512)&&(N!=1024)&&(N!=2048))
        {
            printf("O valor escolhido para N e invalido. Sera utilizado N = 2048.");
            N = 2048;
        }

        int M = N + 1; // Número de instantes em que o tempo será discretizado
        int nf = 10; // Número de fontes pontuais de calor
        double p[10]; // Posição das fontes pontuais de calor
        double a[10]; // Vetor que irá receber a solução com o peso de cada fonte pontual
        double eps = 0.01; //Amplitude máxima do ruído de medida

        // Alocação dinâmica do vetor que irá conter a solução ut
        double *ut = malloc((N+1) * sizeof(double));

        // Leitura do arquivo
        FILE *fp_r;
        fp_r = fopen("teste.txt","r");

        // Verifica se o arquivo foi encontrado
        if (fp_r == NULL) {
            printf("Nao foi possivel ler o arquivo. O programa sera fechado! \n");

            return 0;
        }

        //Lê a posição das fontes pontuais
        for(int i = 0; i < nf; i++)
        {
            fscanf(fp_r, "%lf", &p[i]);
        }
        printf("\n");

        //Lê os dados de ut
        int jump = (2048/N)-1; // Número de dados que serão descartados entre cada dado lido
        int ind = 0;
        int jump_ctr = jump;
        double trash;
        while(!feof(fp_r))
        {
            if(jump_ctr == jump)
            {
                fscanf(fp_r, "%lf", &ut[ind++]);
                if(((ind-1)!=0)&&((ind-1)!=N))
                    ut[ind-1] = ut[ind-1]*(1.0+eps*uniform_rand());
                jump_ctr = 0;
            }
            else
            {
                fscanf(fp_r, "%lf", &trash);
                jump_ctr++;
            }
        }

        //Fecha o arquivo
        fclose(fp_r);

        //Resolve o problema inverso.
        double e2 = solve_inverse_problem(ut, N, M, T, p, nf, a);

        //Printa os resultados obtidos
        printf("A solucao encontrada foi a_k =\n");
        for(int i = 0; i < nf; i++)
            printf("%.10lf ", a[i]);
        printf("\n\n");
        printf("E_2 = %.10lf\n", e2);

        free(ut);
    }

    return 0;
}
