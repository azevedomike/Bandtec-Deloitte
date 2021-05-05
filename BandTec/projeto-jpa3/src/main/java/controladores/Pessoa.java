package controladores;

import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import java.time.LocalDate;

public class Pessoa {


    @NotNull
    @Length(min=2,max=40)
    private String nome;

    @Min(0)
    @Max(25)
    private Integer filhos;

    private LocalDate nascimento;

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public Integer getFilhos() {
        return filhos;
    }

    public void setFilhos(Integer filhos) {
        this.filhos = filhos;
    }

    public LocalDate getNascimento() {
        return nascimento;
    }

    public void setNascimento(LocalDate nascimento) {
        this.nascimento = nascimento;
    }
}
