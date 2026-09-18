#include <stdio.h>
#include <sched.h>
#include <omp.h>

int main(void)
{
    const long esperado = 1000000L;
    const int max_tentativas = 5;
    int observou_race = 0;

    for (int tentativa = 1; tentativa <= max_tentativas; ++tentativa) {
        /*
         * volatile é usado aqui apenas para impedir que o compilador
         * transforme o exemplo em algo pouco observável em sala.
         *
         * IMPORTANTE: volatile NÃO torna a atualização atômica e NÃO
         * corrige a condição de corrida.
         */
        volatile long contador = 0;

        #pragma omp parallel for shared(contador)
        for (long i = 0; i < esperado; ++i) {
            /*
             * Separamos explicitamente leitura e escrita para deixar
             * visível a possibilidade de atualização perdida.
             */
            const long valor_lido = contador;

            /*
             * O yield ocasional aumenta a chance de interleavings entre
             * as threads. Ele é apenas didático e NÃO é sincronização.
             */
            if ((i & 1023L) == 0) {
                sched_yield();
            }

            contador = valor_lido + 1;
        }

        printf(
            "Tentativa %d: esperado=%ld, obtido=%ld\n",
            tentativa,
            esperado,
            contador
        );

        if (contador != esperado) {
            observou_race = 1;
            break;
        }
    }

    if (!observou_race) {
        printf(
            "A condição de corrida continua existindo, "
            "mas não se manifestou nestas tentativas.\n"
            "Execute novamente ou aumente o número de threads.\n"
        );
    }

    return 0;
}
