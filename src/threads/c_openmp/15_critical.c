#include <stdio.h>
#include <omp.h>

int main(void)
{
    long contador = 0;

    #pragma omp parallel for
    for (long i = 0; i < 100000L; ++i) {
        #pragma omp critical
        {
            contador++;
        }
    }

    printf("Contador com critical = %ld\n", contador);
    return 0;
}
