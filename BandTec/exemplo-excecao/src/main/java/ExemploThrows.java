import java.util.InputMismatchException;
import java.util.Scanner;

public class ExemploThrows {

    public static int divide(int numerador, int denominador) throws ArithmeticException
    {
        return numerador / denominador;
    }

    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        int numerador, denominador, resultado;
        boolean continua= true;

        do {
            try
            {
                System.out.print("Digite o valor do numerador (inteiro)");
                numerador = input.nextInt();
                System.out.print("Digite o valor do denominador (inteiro)");
                denominador = input.nextInt();
                resultado = divide(numerador,denominador);
                System.out.println (numerador + "/" + denominador + "=" + resultado);
                continua= false;
            }
            catch (InputMismatchException erro)
            {
                System.out.println("Exceção:" + erro);
                input.nextLine(); // descarta o que deveria ter sido lido
                System.out.println("Você deve digitar um valor inteiro. Tente novamente");
            }
            catch (ArithmeticException erro)
            {
                System.out.println("Divisão por zero");
                System.out.println("O denominador não pode ser zero. Tente novamente");
            }
        } while (continua);
    }
}
