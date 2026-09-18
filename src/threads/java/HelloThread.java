public class HelloThread {
    public static void main(String[] args) throws InterruptedException {
        Thread t1 = new Thread(() ->
            System.out.println("Hello da thread!")
        );

        t1.start();
        t1.join();
    }
}
