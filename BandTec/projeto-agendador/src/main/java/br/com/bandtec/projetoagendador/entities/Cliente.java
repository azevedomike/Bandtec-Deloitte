package br.com.bandtec.projetoagendador.entities;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Cliente {

    @Id
    private Integer idCliente;

    private String nome;

    private Integer diaNasc;

    private Integer mesNasc;

    public Integer getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(Integer idCliente) {
        this.idCliente = idCliente;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public Integer getDiaNasc() {
        return diaNasc;
    }

    public void setDiaNasc(Integer diaNasc) {
        this.diaNasc = diaNasc;
    }

    public Integer getMesNasc() {
        return mesNasc;
    }

    public void setMesNasc(Integer mesNasc) {
        this.mesNasc = mesNasc;
    }
}
