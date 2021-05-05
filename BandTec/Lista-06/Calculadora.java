/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.lista;

/**
 *
 * @author mikazevedo
 */
public class Calculadora {
    private Integer numero1;
    private Integer numero2;

    public Integer getNumero1() {
        return numero1;
    }

    public void setNumero1(Integer numero1) {
        this.numero1 = numero1;
    }

    public Integer getNumero2() {
        return numero2;
    }

    public void setNumero2(Integer numero2) {
        this.numero2 = numero2;
    }
    
    public Integer Somar(){
    return numero1+numero2;
}
    public Integer Subtrair(){
        return numero1-numero2;
    }
    public Integer Multiplicar(){
        return numero1*numero2;
    }
    public Integer Dividir(){
        return numero1/numero2; 
    }
}
