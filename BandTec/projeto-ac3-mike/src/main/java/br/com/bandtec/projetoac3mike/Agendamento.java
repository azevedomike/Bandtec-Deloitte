package br.com.bandtec.projetoac3mike;

import java.util.UUID;

public class Agendamento {

    private UUID senha;

    private Integer horaAgendamento;

    public Agendamento(UUID senha, Integer horaAgendamento) {
        this.senha = senha;
        this.horaAgendamento = horaAgendamento;
    }

    public UUID getSenha() {
        return senha;
    }

    public void setSenha(UUID senha) {
        this.senha = senha;
    }

    public Integer getHoraAgendamento() {
        return horaAgendamento;
    }

    public void setHoraAgendamento(Integer horaAgendamento) {
        this.horaAgendamento = horaAgendamento;
    }

    @Override
    public String toString() {
        return "Agendamento{" +
                "senha=" + senha +
                ", horaAgendamento=" + horaAgendamento +
                '}';
    }
}
