package com.mycompany.lista;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author mikazevedo
 */
public class Clube {
    private String nome;
    
    private Integer vitoria = 0;
    private Integer empate = 0;
    private Integer derrota = 0;
    private Integer pontuacao = 0;

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public Integer getVitoria() {
        return vitoria;
    }

    public void setVitoria(Integer vitoria) {
        this.vitoria = vitoria;
    }
    
    public void setVitoria(){
        this.vitoria++;
        setPontuacao(3);
    }

    public Integer getEmpate() {
        return empate;
    }

    public void setEmpate(Integer empate) {
        this.empate = empate;
    }
    
        public void setEmpate()
    {
        this.empate++;
        setPontuacao(1);
    }

    public Integer getDerrota() {
        return derrota;
    }
    
    public void setDerrota(){
        this.derrota++;
    }

    public void setDerrota(Integer derrota) {
        this.derrota = derrota;
    }

    public Integer getPontuacao() {
        return pontuacao;
    }

    public void setPontuacao(Integer pontuacao) {
        this.pontuacao += pontuacao;
    }


    
  
}
