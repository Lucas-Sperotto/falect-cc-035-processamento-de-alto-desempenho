public class TempoSequencial {
    public static void main(String[] args) throws InterruptedException {
        long inicio = System.nanoTime();

        for (int i = 0; i < 4; i++) {
            System.out.println("Executando tarefa " + i);
            Thread.sleep(1000);
        }

        long fim = System.nanoTime();
        double segundos = (fim - inicio) / 1_000_000_000.0;

        System.out.printf("Tempo: %.2f segundos%n", segundos);
    }
}
