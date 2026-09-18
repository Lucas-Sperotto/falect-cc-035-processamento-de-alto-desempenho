#include <stdio.h>
#include <omp.h>

int main(void)
{
    const int compartilhado = 10;

    #pragma omp parallel shared(compartilhado)
    {
        const int id = omp_get_thread_num();
        const int privado = compartilhado + id;

        printf("Thread %d: compartilhado=%d, privado=%d\n",
               id, compartilhado, privado);
    }

    return 0;
}
