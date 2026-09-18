#include <stdio.h>
#include <unistd.h>
#include <omp.h>

int main(void)
{
    #pragma omp parallel for schedule(dynamic, 1)
    for (int i = 0; i < 12; ++i) {
        const unsigned int atraso = (unsigned int)((i % 4) + 1);
        usleep(atraso * 100000U);

        printf("Thread %d concluiu iteração %d (custo=%u)\n",
               omp_get_thread_num(), i, atraso);
    }

    return 0;
}
