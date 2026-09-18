import java.util.Arrays;

public class VetorParalelo {
    public static void main(String[] args) throws InterruptedException {
        int n = 20;
        int numeroThreads = 4;
        int[] vetor = new int[n];
        Thread[] threads = new Thread[numeroThreads];
        int bloco = n / numeroThreads;

        for (int t = 0; t < numeroThreads; t++) {
            final int id = t;
            final int inicio = id * bloco;
            final int fim =
                (id == numeroThreads - 1) ? n : inicio + bloco;

            threads[t] = new Thread(() -> {
                for (int i = inicio; i < fim; i++) {
                    vetor[i] = i * i;
                }

                System.out.printf(
                    "Thread %d processou [%d, %d]%n",
                    id, inicio, fim - 1
                );
            });
        }

        for (Thread thread : threads) {
            thread.start();
        }

        for (Thread thread : threads) {
            thread.join();
        }

        System.out.println(Arrays.toString(vetor));
    }
}
