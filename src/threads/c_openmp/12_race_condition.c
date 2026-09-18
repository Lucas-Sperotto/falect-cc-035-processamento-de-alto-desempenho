#include <stdio.h>
#include <omp.h>

int main(void)
{
    long contador = 0;

    #pragma omp parallel for
    for (long i = 0; i < 1000000L; ++i) {
        contador++;
    }

    printf("Valor esperado: 1000000\n");
    printf("Valor obtido:   %ld\n", contador);

    return 0;
}
