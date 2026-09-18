public class StartVsRun {
    public static void main(String[] args) throws InterruptedException {
        Thread t1 = new Thread(() ->
            System.out.println(
                "run() executando em: "
                + Thread.currentThread().getName()
            )
        );

        t1.run();

        Thread t2 = new Thread(() ->
            System.out.println(
                "start() executando em: "
                + Thread.currentThread().getName()
            )
        );

        t2.start();
        t2.join();
    }
}
