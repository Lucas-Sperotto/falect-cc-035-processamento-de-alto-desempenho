#include <stdio.h>
#include <omp.h>

int main(void)
{
    int vetor[] = {1, 2, 3, 4, 5, 6, 7, 8};
    const int n = (int)(sizeof(vetor) / sizeof(vetor[0]));
    int soma = 0;

    #pragma omp parallel for reduction(+:soma)
    for (int i = 0; i < n; ++i) {
        soma += vetor[i];
    }

    printf("Soma = %d\n", soma);
    return 0;
}
