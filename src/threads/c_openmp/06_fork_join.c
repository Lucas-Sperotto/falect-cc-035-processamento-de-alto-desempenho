#include <stdio.h>
#include <omp.h>

int main(void)
{
    printf("ANTES da região paralela\n");

    #pragma omp parallel
    {
        printf("Thread %d está trabalhando\n", omp_get_thread_num());
    }

    printf("DEPOIS da região paralela\n");
    return 0;
}
