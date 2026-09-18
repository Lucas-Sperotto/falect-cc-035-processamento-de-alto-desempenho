#include <stdio.h>
#include <omp.h>

int main(void)
{
    long contador = 0;

    #pragma omp parallel for
    for (long i = 0; i < 1000000L; ++i) {
        #pragma omp atomic
        contador++;
    }

    printf("Contador com atomic = %ld\n", contador);
    return 0;
}
