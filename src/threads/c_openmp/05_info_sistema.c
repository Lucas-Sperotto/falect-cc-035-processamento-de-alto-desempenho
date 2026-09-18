#include <stdio.h>
#include <omp.h>

int main(void)
{
    printf("Processadores lógicos disponíveis ao runtime OpenMP: %d\n",
           omp_get_num_procs());
    printf("Máximo de threads configurado no runtime: %d\n",
           omp_get_max_threads());

    return 0;
}
