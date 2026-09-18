import java.util.Arrays;

public class VetorSequencial {
    public static void main(String[] args) {
        int n = 20;
        int[] vetor = new int[n];

        for (int i = 0; i < n; i++) {
            vetor[i] = i * i;
        }

        System.out.println(Arrays.toString(vetor));
    }
}
