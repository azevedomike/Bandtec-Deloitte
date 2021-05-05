/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author mikazevedo
 */
public class Eleicoes {
    private Candidato miguel = new Candidato();
    private Candidato joselito = new Candidato();
    
    private Integer votosTotais;
    
        public Integer votar1(){
        miguel.votar();
        votosTotais++;
        return miguel.getQtdVotos();
    }
    
        public Integer votar2(){
        joselito.votar();
        votosTotais++;
        return joselito.getQtdVotos();
    }
        
        public String Encerrar()
    {
        var qtdVotos1 = miguel.getQtdVotos();
        var qtdVotos2 = joselito.getQtdVotos();
        
        if (qtdVotos1 > qtdVotos2)
            return "O Miguel é vencedor";
        
        else if (qtdVotos2 > qtdVotos1)
            return "O Joselito é vencedor";
        
        else
            return "Deu empate";
    }

    public Integer getVotosTotais() {
        return votosTotais;
    }


    
}
