/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author mikazevedo
 */
public class Candidato {
    private Integer qtdVotos = 0;

    public Integer getQtdVotos() {
        return qtdVotos;
    }

    public void votar(){
        this.qtdVotos++;
    }
    
}
