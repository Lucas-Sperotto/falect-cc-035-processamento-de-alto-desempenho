public class ThreadsLoop {
    public static void main(String[] args) throws InterruptedException {
        int n = 4;
        Thread[] threads = new Thread[n];

        for (int i = 0; i < n; i++) {
            final int id = i;

            threads[i] = new Thread(() ->
                System.out.println("Hello da thread " + id)
            );
        }

        for (Thread thread : threads) {
            thread.start();
        }

        for (Thread thread : threads) {
            thread.join();
        }

        System.out.println("Todas terminaram.");
    }
}
