package br.com.bandec.demo;

public class Cachorro {
    public String raca;
    public Double precoMedio;


    public Cachorro(String raca, Double precoMedio) {
        this.raca = raca;
        this.precoMedio = precoMedio;
    }

    public String getRaca() {
        return raca;
    }

    public Double getPrecoMedio() {
        return precoMedio;
    }
}
