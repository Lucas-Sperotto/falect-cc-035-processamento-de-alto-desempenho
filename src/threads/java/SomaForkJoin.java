import java.util.concurrent.ForkJoinPool;
import java.util.concurrent.RecursiveTask;

public class SomaForkJoin {
    static class SomaTask extends RecursiveTask<Long> {
        private static final int LIMITE = 2;

        private final int[] vetor;
        private final int inicio;
        private final int fim;

        SomaTask(int[] vetor, int inicio, int fim) {
            this.vetor = vetor;
            this.inicio = inicio;
            this.fim = fim;
        }

        @Override
        protected Long compute() {
            int tamanho = fim - inicio;

            if (tamanho <= LIMITE) {
                long soma = 0;

                for (int i = inicio; i < fim; i++) {
                    soma += vetor[i];
                }

                return soma;
            }

            int meio = inicio + tamanho / 2;
            SomaTask esquerda = new SomaTask(vetor, inicio, meio);
            SomaTask direita = new SomaTask(vetor, meio, fim);

            esquerda.fork();
            long resultadoDireita = direita.compute();
            long resultadoEsquerda = esquerda.join();

            return resultadoEsquerda + resultadoDireita;
        }
    }

    public static void main(String[] args) {
        int[] vetor = {1, 2, 3, 4, 5, 6, 7, 8};
        ForkJoinPool pool = new ForkJoinPool();

        try {
            long soma = pool.invoke(
                new SomaTask(vetor, 0, vetor.length)
            );

            System.out.println("Soma = " + soma);
        } finally {
            pool.shutdown();
        }
    }
}
