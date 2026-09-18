#include <stdio.h>
#include <unistd.h>
#include <omp.h>

int main(void)
{
    #pragma omp parallel for schedule(dynamic, 1)
    for (int i = 0; i < 8; ++i) {
        const int id = omp_get_thread_num();

        printf("Thread %d iniciou tarefa %d\n", id, i);
        sleep(1);
        printf("Thread %d terminou tarefa %d\n", id, i);
    }

    return 0;
}
