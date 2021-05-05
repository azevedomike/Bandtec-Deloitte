public class SaidaFormatada {

    public static void main(String[] args) {
        String nome1 = "Célia";
        double nota1 = 8.0;
        int ra1 = 50000;

        String nome2 = "Fulano";
        double nota2 = 9.5;
        int ra2 = 50001;

        System.out.printf("------------------------------------------------------\n");
        // Exibe a String "NOME" dentro de um campo de 14 caracteres, alinhado à esquerda
        // Exibe a String "NOTA" dentro de um campo de 7 caracteres, alinhado à direita
        System.out.printf("%-7s %-14s %7s\n", "RA", "NOME", "NOTA");

        // Exibe o valor de nome1 dentro de um campo de 14 caracteres, alinhado à esquerda
        // Exibe o valor de nota1 dentro de um campo de 7 caracteres, alinhado à direita
        // e de forma que tenha 2 casas decimais
        System.out.printf("%07d %-14s %7.2f\n", ra1, nome1, nota1);

        // Idem para nome2 e nota2
        System.out.printf("%07d %-14s %7.2f\n", ra2, nome2, nota2);

        System.out.println(String.format("\nO nome é %s e a nota é %.2f", nome1, nota1));
    }
}