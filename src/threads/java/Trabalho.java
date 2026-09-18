public class Trabalho {
    public static void main(String[] args) throws InterruptedException {
        Thread[] threads = new Thread[4];

        for (int i = 0; i < threads.length; i++) {
            final int id = i;

            threads[i] = new Thread(() -> {
                System.out.println("Thread " + id + " iniciou.");

                try {
                    Thread.sleep(1000);
                } catch (InterruptedException e) {
                    Thread.currentThread().interrupt();
                    return;
                }

                System.out.println("Thread " + id + " terminou.");
            });
        }

        for (Thread thread : threads) {
            thread.start();
        }

        for (Thread thread : threads) {
            thread.join();
        }

        System.out.println("Todas as tarefas terminaram.");
    }
}
