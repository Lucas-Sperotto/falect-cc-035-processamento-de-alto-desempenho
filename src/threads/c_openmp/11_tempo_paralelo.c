#include <stdio.h>
#include <unistd.h>
#include <omp.h>

int main(void)
{
    const double inicio = omp_get_wtime();

    #pragma omp parallel for
    for (int i = 0; i < 8; ++i) {
        printf("Thread %d executando tarefa %d\n",
               omp_get_thread_num(), i);
        sleep(1);
    }

    const double fim = omp_get_wtime();
    printf("Tempo total paralelo: %.2f s\n", fim - inicio);

    return 0;
}
