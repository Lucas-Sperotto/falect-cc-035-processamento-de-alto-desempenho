#include <stdio.h>
#include <omp.h>

int main(void)
{
    #pragma omp parallel for
    for (int i = 0; i < 12; ++i) {
        printf("Thread %d executou a iteração %d\n",
               omp_get_thread_num(), i);
    }

    return 0;
}
