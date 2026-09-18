public class ExemploRunnable {
    public static void main(String[] args) throws InterruptedException {
        Runnable tarefa = () ->
            System.out.println(
                "Executando em "
                + Thread.currentThread().getName()
            );

        Thread t1 = new Thread(tarefa);
        Thread t2 = new Thread(tarefa);

        t1.start();
        t2.start();

        t1.join();
        t2.join();

        System.out.println("Fim.");
    }
}
