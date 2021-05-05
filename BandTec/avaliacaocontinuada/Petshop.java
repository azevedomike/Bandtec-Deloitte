package br.com.bandec.avaliacaocontinuada;

public abstract class  Petshop {


        private String raca;
        private String nome;
        private String idade;
        protected Integer id;

    public Petshop(String raca, String nome, String idade, Integer id) {
        this.raca = raca;
        this.nome = nome;
        this.idade = idade;
        this.id = id;
    }

    public abstract Double calculaValorServico();

    public abstract void servicoAnimal(String servico);

    public String getRaca() {
        return raca;
    }

    public String getNome() {
        return nome;
    }

    public String getIdade() {
        return idade;
    }

    @Override
    public String toString() {
        return "Petshop{" +
                "raca='" + raca + '\'' +
                ", nome='" + nome + '\'' +
                ", idade='" + idade + '\'' +
                '}';
    }
}
