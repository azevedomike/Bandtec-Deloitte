public class Alimento extends Produto {

    private Integer quantVitamina;

    public Alimento(Integer codigo, String descricao, Double preco, Integer quantVitamina) {
        super(codigo, descricao, preco);
        this.quantVitamina = quantVitamina;
    }

    public Double getValorTributo() {
        return (getPreco() * 0.15);
    }

    @Override
    public String toString() {
        return "Alimento{" +
                "quantVitamina=" + quantVitamina +
                ",imposto =" + getValorTributo() +
                "} " + super.toString();
    }
}
