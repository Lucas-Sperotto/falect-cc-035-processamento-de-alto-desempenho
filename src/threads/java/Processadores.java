public class Processadores {
    public static void main(String[] args) {
        int n = Runtime.getRuntime().availableProcessors();

        System.out.println(
            "Processadores disponíveis para a JVM: " + n
        );
    }
}
