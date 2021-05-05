public class Teste {

    public static void main(String[] args) {
        // Cria objeto da classe ListaEstatica, com tamanho máximo 5
        ListaObj<String> lista = new ListaObj(5);

        // Adiciona os valores "A", "B", "C"
        lista.adiciona("A");
        lista.adiciona("B");
        lista.adiciona("C");
        // Exibe a lista
        lista.exibe();

        // Adiciona os valores "D", "E", "F" (não vai conseguir inserir o "F")
        lista.adiciona("D");
        lista.adiciona("E");
        lista.adiciona("F");
        // Exibe a lista
        lista.exibe();

        // Procura na lista o valor "X"
        System.out.println("\nBuscando valor \"X\"...");
        int indRetornado = lista.busca("X");
        if (indRetornado == -1) {
            System.out.println("Valor \"X\" não encontrado na lista");
        }
        else {
            System.out.println("Valor \"X\" encontrado no índice " + indRetornado);
        }

        // Procura na lista o valor "C"
        System.out.println("\nBuscando valor \"C\"...");
        indRetornado = lista.busca("C");
        if (indRetornado == -1) {
            System.out.println("Valor \"C\" não encontrado na lista");
        }
        else {
            System.out.println("Valor \"C\" encontrado no índice " + indRetornado);
        }

        // Remove o valor que está no índice 2 da lista e exibe a lista
        System.out.println("\nRemovendo valor do índice 2...");
        lista.removePeloIndice(2);
        lista.exibe();

        // Remove o valor 20 da lista e exibe a lista
        System.out.println("\nRemovendo valor \"B\"...");
        lista.removeElemento("B");
        lista.exibe();

        // Adiciona o valor 60 e exibe a lista
        System.out.println("\nAdicionando valor \"F\"...");
        lista.adiciona("F");
        lista.exibe();

        // Exibe o tamanho da lista
        System.out.println("O tamanho da lista é " + lista.getTamanho());

        // Exibe o elemento da lista no índice 1
        System.out.println(lista.getElemento(1));

        // Limpa a lista e exibe a lista


    }

}
