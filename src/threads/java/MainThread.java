public class MainThread {
    public static void main(String[] args) {
        System.out.println(
            "Estou executando na thread: "
            + Thread.currentThread().getName()
        );
    }
}
