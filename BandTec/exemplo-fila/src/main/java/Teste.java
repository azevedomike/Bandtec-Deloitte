public class Teste {

    public static void main(String[] args) {
        // Cria uma fila de Strings com capacidade 4
        Fila fila = new Fila(4);

        // Insere elementos na fila
        fila.insert("Um");
        fila.insert("Dois");
        fila.insert("Três");
        fila.insert("Quatro");
        fila.insert("Cinco");

        // Exibe elementos da fila
        fila.exibe();

        System.out.println();

        // Consulta quem é o primeiro da fila
        System.out.println("Primeiro da fila: " + fila.peek());
        System.out.println("Primeiro da fila: " + fila.peek());

        System.out.println();

        // Exibe novamente a fila
        fila.exibe();

        System.out.println();

        // Remove um elemento e exibe elemento removido
        System.out.println("Removido: " + fila.poll());

        System.out.println();

        // Exibe novamente a fila
        fila.exibe();

        System.out.println();

        // Esvazia a fila, exibindo cada elemento removido
        while (!fila.isEmpty()) {
            System.out.println("Removido: " + fila.poll());
        }

        System.out.println("\nFila Circular");
        // Cria uma FilaCircular de Strings com capacidade 5
        FilaCircular fc = new FilaCircular(5);

        // Insere elementos na fila circular
        fc.insert("A");
        fc.insert("B");
        fc.insert("C");
        fc.insert("D");
        fc.insert("E");
        fc.insert("F");

        fc.exibe();
        System.out.println();

        // Consulta quem é o primeiro
        System.out.println("primeiro: "+fc.peek());
        System.out.println("primeiro: "+fc.peek());
        System.out.println();

        // Remove um elemento, exibindo-o
        System.out.println("removido: " + fc.poll());
        System.out.println();

        // Exibe a fila
        fc.exibe();
        System.out.println();

        // Insere mais 2 elementos na fila
        fc.insert("F");
        fc.insert("G");
        System.out.println();

        // Exibe a fila
        fc.exibe();
        System.out.println();

        // Esvazia a fila, exibindo cada elemento removido
        while(!fc.isEmpty()) {
            System.out.println("Removido: " + fc.poll());
        }

    }

}
