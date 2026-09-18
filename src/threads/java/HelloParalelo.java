public class HelloParalelo {
    public static void main(String[] args) throws InterruptedException {
        Thread[] threads = new Thread[4];

        for (int i = 0; i < threads.length; i++) {
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

        System.out.println("Fim.");
    }
}
