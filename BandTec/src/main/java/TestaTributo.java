public class TestaTributo {

    public static void main(String[] args) {

        Alimento pessego = new Alimento(123,"Pessego em calda", 10.0, 17);
        Perfume puruvudu = new Perfume(567,"Excêntrico",50.0, "Amadeirado");
        Servico formatarNote = new Servico("Formatação de notebook", 100.0);

        Tributo trib = new Tributo();


        System.out.println(pessego);
        System.out.println(puruvudu);
        System.out.println(formatarNote);

        trib.adicionaTributavel(pessego);
        trib.adicionaTributavel(puruvudu);
        trib.adicionaTributavel(formatarNote);
        trib.exibeTodos();
        System.out.println("Total de impostos : "+ trib.calculaTotalTributo());

    }


}
