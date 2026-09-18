public class RaceCondition {
    private static int contador = 0;

    public static void main(String[] args) throws InterruptedException {
        int numeroThreads = 4;
        int repeticoes = 250_000;
        Thread[] threads = new Thread[numeroThreads];

        for (int t = 0; t < numeroThreads; t++) {
            threads[t] = new Thread(() -> {
                for (int i = 0; i < repeticoes; i++) {
                    contador++;
                }
            });
        }

        for (Thread thread : threads) {
            thread.start();
        }

        for (Thread thread : threads) {
            thread.join();
        }

        System.out.println("Esperado: 1000000");
        System.out.println("Obtido:   " + contador);
    }
}
