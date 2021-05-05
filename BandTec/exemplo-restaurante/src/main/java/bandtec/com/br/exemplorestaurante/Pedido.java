package bandtec.com.br.exemplorestaurante;

import java.util.UUID;

public class Pedido {

    private UUID senha;

    private Integer prato;

    public Pedido(UUID senha, Integer prato) {
        this.senha = senha;
        this.prato = prato;
    }

    public UUID getSenha(){
        return senha;
    }

    public void setSenha(UUID senha) {
        this.senha = senha;
    }

    public Integer getPrato() {
        return prato;
    }

    public void setPrato(Integer prato) {
        this.prato = prato;
    }

    @Override
    public String toString() {
        return "Pedido{" +
                "senha=" + senha +
                ", prato=" + prato +
                '}';
    }
}
