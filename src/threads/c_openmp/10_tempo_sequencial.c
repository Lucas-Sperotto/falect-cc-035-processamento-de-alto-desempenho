#include <stdio.h>
#include <unistd.h>
#include <omp.h>

int main(void)
{
    const double inicio = omp_get_wtime();

    for (int i = 0; i < 8; ++i) {
        printf("Executando tarefa %d\n", i);
        sleep(1);
    }

    const double fim = omp_get_wtime();
    printf("Tempo total sequencial: %.2f s\n", fim - inicio);

    return 0;
}
