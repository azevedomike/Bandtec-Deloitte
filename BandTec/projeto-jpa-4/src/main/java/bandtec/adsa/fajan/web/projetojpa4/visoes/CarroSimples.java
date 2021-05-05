package bandtec.adsa.fajan.web.projetojpa4.visoes;

public class CarroSimples {

    private Integer id;
    private String modelo;

    public CarroSimples(Integer id, String modelo) {
        this.id = id;
        this.modelo = modelo;
    }

    public Integer getId() {
        return id;
    }

    public String getModelo() {
        return modelo;
    }
}
