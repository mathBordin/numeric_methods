/**
 * @file inverse_problem.h
 *
 * @brief Arquivo que implementa as funções relativas a solução do
 * problema inverso.
 *
 * @author Matheus Bordin Gomes - 9838028 - Turma 2
 * @author João Ferreira Cysne - 10774020 - Turma 3
 */

#include "inverse_problem.h"

void generate_uk_solutions(double **uk, int N, int M, int T, double *p, int nf)
{
    //Resolve o problema da distribuição de calor pelo método de Crank-Nicolson
    //nf vezes, sendo que em cada uma a fonte pontual utilizada está na posição
    //determinada por p[i].
    double unitary_intensity[1] = {1.0};
    for(int i = 0; i < nf; i++)
        solve_heat_equation(N, M, T, &uk[i][0], &p[i], &unitary_intensity, 1);
}

double solve_inverse_problem(double *ut, int N, int M, int T, double *p, int nf, double *a)
{
    //Aloca dinamicamente a matriz que irá armazenar as nf soluções uk
    double **uk = malloc(nf * sizeof(double *));
    for(int i = 0; i < nf; i++)
        uk[i] = malloc((N+1) * sizeof(double));

    //Gera as soluções uk das fontes pontuais definidas em p
    generate_uk_solutions(uk, N, M, T, p, nf);

    //Aloca dinamicamente as variáveis para a resolução do sistema normal.
    double **An = malloc(nf * sizeof(double *));
    for(int i = 0; i < nf; i++)
        An[i] = malloc(nf * sizeof(double));
    double *bn = malloc(nf * sizeof(double));

    //Cria o sistema normal, dadas as uk soluções e a solução final ut
    create_normal_system(uk, ut, N, nf, An, bn);

    //Resolve o sistema normal
    solve_system(An, bn, a, nf);

    //Avalia o erro E2 com a solução obtida
    double e2 = evaluete_e2(uk, ut, a, N, nf);

    //Libera as variáveis alocadas dinamicamente
    for(int i = 0; i < nf; i++)
        free(uk[i]);
    free(uk);
    for(int i = 0; i < nf; i++)
        free(An[i]);
    free(An);
    free(bn);

    return e2;
}

double evaluete_e2(double **uk, double *ut, double *a, int N, int nf)
{
    //Variáveis auxiliares para o cálculo de E_2
    double e2 = 0.0;
    double sum1 = 0.0;
    double sum2 = 0.0;
    double delta_x = (double)1/N; //Passo de discretização

    //Abre arquivo em que os dados serão salvos.
    FILE *fp_w ;
    char fnamer[100]="";
    printf("\nDigite o nome do arquivo em que serao salvos os dados (dados_ep2.txt por ex.): ");
    scanf("%s",fnamer);
    printf("\n");
    fp_w = fopen(fnamer, "w");
    if (fp_w == NULL)
        printf("Nao foi possivel abrir o arquivo %s. Os dados nao serao salvos!\n", fnamer);

    //Cálculo de E_2.
    for(int i = 1; i < N; i++)
    {
        sum2 = 0.0;
        for(int k = 0; k < nf; k++)
            sum2 += a[k]*uk[k][i];
        sum1 += pow(ut[i] - sum2,2.0);

        //Caso o arquivo tenha sido aberto, deve-se salvar os dados.
        if(fp_w != NULL)
            fprintf(fp_w, "%.10f %.10f\n", ut[i], sum2);
    }
    e2 = sqrt(delta_x*sum1);

    //Caso o arquivo tenha sido aberto, ele deve ser fechado.
    if(fp_w != NULL)
    {
        printf("Dados salvos em %s com sucesso!\n\n", fnamer);
        fclose(fp_w) ;
    }

    return e2;
}
