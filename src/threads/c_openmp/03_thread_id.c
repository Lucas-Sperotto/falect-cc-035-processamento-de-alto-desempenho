#include <stdio.h>
#include <omp.h>

int main(void)
{
    #pragma omp parallel
    {
        const int id = omp_get_thread_num();
        printf("Hello da thread %d\n", id);
    }

    return 0;
}
