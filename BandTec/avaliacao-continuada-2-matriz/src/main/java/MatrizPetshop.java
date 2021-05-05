import com.sun.org.apache.xpath.internal.operations.String;

import java.util.Scanner;

public class MatrizPetshop {

    public static void main(String[] args) {



    Integer linhas=0;

    String[] funcionario;

    String [][] infos;

    Double[] salarios;

    Boolean verificador = false;

    Scanner leitor = new Scanner(System.in);

    Scanner leitorS =new Scanner(System.in);


    while (!verificador) {
        try {

            System.out.println("Digite a quantidade de funcionários (valor entre 1 e 20)");

            linhas = leitor.nextInt();
            if (linhas >= 1 && linhas <= 20) {
                verificador = true;
            } else {
                throw new Exception("Digite de 1 a 20 funcionários");
            }
        } catch (Exception erro) {
            System.out.println(erro);
        }
    }

    funcionario = new String[linhas];
    infos = new String[linhas][2];

    for(int a = 0; a < funcionario.length;a++){
        System.out.println("Qual o nome do funcionário : ");
        funcionario[a] = leitorS.nextLine();
    }

    for(int l = 0; l > infos.length;l++){
        for(int c = 0; c > infos.length; c++){
            System.out.println("Digite o nome do funcionario: ");
            infos[l][c] = leitor.next();
        }
    }

    }
}