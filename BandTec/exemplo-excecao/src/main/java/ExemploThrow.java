import javax.swing.*;

public class ExemploThrow {

    public static void main (String args[]) {
        float nota1 = Float.parseFloat
                (JOptionPane.showInputDialog ("Digite a nota 1 (entre 0 e 10):"));
        float nota2 = Float.parseFloat
                (JOptionPane.showInputDialog ("Digite a nota 2 (entre 0 e 10):"));

        try {
            if ((nota1 < 0) || (nota1 > 10))
                throw new Exception("Nota1: Valor fora dos limites permitidos (entre 0 e 10)");

            if ((nota2 < 0) || (nota2 > 10))
                throw new Exception("Nota2: Valor fora dos limites permitidos (entre 0 e 10)");

            JOptionPane.showMessageDialog (null, "Média =" + (nota1+nota2)/2);
        }
        catch (Exception erro) {
            JOptionPane.showMessageDialog (null,erro);
        }

        System.exit(0);
    }
}  