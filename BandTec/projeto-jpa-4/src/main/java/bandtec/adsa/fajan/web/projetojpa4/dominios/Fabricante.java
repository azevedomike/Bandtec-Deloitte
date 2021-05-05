package bandtec.adsa.fajan.web.projetojpa4.dominios;

import javax.persistence.*;

@Entity
public class Fabricante {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String nome;

    @ManyToOne
    private Pais paisOrigem;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public Pais getPaisOrigem() {
        return paisOrigem;
    }

    public void setPaisOrigem(Pais paisOrigem) {
        this.paisOrigem = paisOrigem;
    }
}
