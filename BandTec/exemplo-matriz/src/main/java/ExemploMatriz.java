import java.util.Scanner;

public class ExemploMatriz {

    public static void exibeMatriz(int[][] m) {
        for (int linha = 0; linha < m.length; linha++) {
            for (int coluna = 0; coluna < m[linha].length; coluna++) {
                System.out.print(m[linha][coluna] + "\t");
            }
            System.out.println();
        }
    }

    public static int[][] exibeTransposta(int[][] m2) {
        int[][] resultado = new int[m2[0].length][m2.length];
        
    }

    public static void main(String[] args) {

        Scanner leitor = new Scanner(System.in);

        int[] vetor = new int[10];

        int[][] matriz = new int[3][4];
        int[][] matriz2 = {{1, 2}, {3, 4}, {5, 6}, {7, 8}};
        int[][] matrizLoka = {{1}, {2, 3, 4, 5}, {6, 7}, {8, 9, 10}};


        for (int linha = 0; linha < matriz.length; linha++) {
            for (int coluna = 0; coluna < matriz[linha].length; coluna++) {
                System.out.println("Digite o valor de matriz [" + linha + "]" + "[" + coluna + "]");

                matriz[linha][coluna] = leitor.nextInt();
            }
        }
        exibeMatriz(matriz);

        System.out.println();

        exibeMatriz(matriz2);

        System.out.println();

        exibeMatriz(matrizLoka);
    }
}


    }