package br.com.bandec.avaliacaocontinuada;

public class Gato extends Petshop {

    private String porte;
    private String servico;
    private Double valorHoraServico;
    private Integer tempoServicoHoras;

    public Gato(String raca, String nome, String idade, Integer id, String porte, String servico, Double valorHoraServico, Integer tempoServicoHoras) {
        super(raca, nome, idade, id);
        this.porte = porte;
        this.servico = servico;
        this.valorHoraServico = valorHoraServico;
        this.tempoServicoHoras = tempoServicoHoras;
    }

    @Override
    public Double calculaValorServico() {
        return (valorHoraServico * tempoServicoHoras);
    }

    @Override
    public void servicoAnimal(String servico) {
        System.out.println(servico);
    }

    public String getPorte() {
        return porte;
    }

    public String getServico() {
        return servico;
    }

    public Double getValorHoraServico() {
        return valorHoraServico;
    }

    public Integer getTempoServico() {
        return tempoServicoHoras;
    }

    @Override
    public String toString() {
        return "Gato{" +
                "porte='" + porte + '\'' +
                ", servico='" + servico + '\'' +
                ", valorHoraServico=" + valorHoraServico +
                ", tempoServico=" + tempoServicoHoras +
                ",infos=" + super.toString() +
                '}';
    }
}
