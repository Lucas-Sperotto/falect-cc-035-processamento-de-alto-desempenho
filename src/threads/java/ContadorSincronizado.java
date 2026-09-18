public class ContadorSincronizado {
    private static int contador = 0;
    private static final Object LOCK = new Object();

    public static void main(String[] args) throws InterruptedException {
        int numeroThreads = 4;
        int repeticoes = 250_000;
        Thread[] threads = new Thread[numeroThreads];

        for (int t = 0; t < numeroThreads; t++) {
            threads[t] = new Thread(() -> {
                for (int i = 0; i < repeticoes; i++) {
                    synchronized (LOCK) {
                        contador++;
                    }
                }
            });
        }

        for (Thread thread : threads) {
            thread.start();
        }

        for (Thread thread : threads) {
            thread.join();
        }

        System.out.println("Contador = " + contador);
    }
}
