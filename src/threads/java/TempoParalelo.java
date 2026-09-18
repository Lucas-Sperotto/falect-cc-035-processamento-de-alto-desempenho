public class TempoParalelo {
    public static void main(String[] args) throws InterruptedException {
        long inicio = System.nanoTime();
        Thread[] threads = new Thread[4];

        for (int i = 0; i < threads.length; i++) {
            final int id = i;

            threads[i] = new Thread(() -> {
                System.out.println("Executando tarefa " + id);

                try {
                    Thread.sleep(1000);
                } catch (InterruptedException e) {
                    Thread.currentThread().interrupt();
                }
            });
        }

        for (Thread thread : threads) {
            thread.start();
        }

        for (Thread thread : threads) {
            thread.join();
        }

        long fim = System.nanoTime();
        double segundos = (fim - inicio) / 1_000_000_000.0;

        System.out.printf("Tempo: %.2f segundos%n", segundos);
    }
}
