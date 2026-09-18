#include <stdio.h>
#include <omp.h>

int main(void)
{
    #pragma omp parallel
    {
        const int id = omp_get_thread_num();
        const int total = omp_get_num_threads();

        printf("Sou a thread %d de um total de %d threads\n", id, total);
    }

    return 0;
}
