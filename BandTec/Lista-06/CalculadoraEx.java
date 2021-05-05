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
public class CalculadoraEx {
    public static void main(String[] args) {
        Calculadora calculadora = new Calculadora();
        calculadora.setNumero1(10);
        calculadora.setNumero2(2);
        
        Integer soma = calculadora.Somar();
        Integer subtrair = calculadora.Subtrair();
        Integer multiplicar = calculadora.Multiplicar();
        Integer dividir = calculadora.Dividir();
        
        Integer numero1 = calculadora.getNumero1();
        Integer numero2 = calculadora.getNumero2();
        
        System.out.println(numero1 +" + "+ numero2 +" = "+ soma );
        System.out.println(numero1 +" - "+ numero2 +" = "+ subtrair );
        System.out.println(numero1 +" * "+ numero2 +" = "+ multiplicar );
        System.out.println(numero1 +" / "+ numero2 +" = "+ dividir );
        
    }
}
