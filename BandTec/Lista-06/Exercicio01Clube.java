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
public class Exercicio01Clube extends javax.swing.JFrame {

    Clube   clube1 = new Clube();
    Clube clube2 = new Clube();
    
    public Exercicio01Clube() {
        initComponents();
        clube1.setNome("São Paulo");
        clube2.setNome("Guarani");
        
        lblTime1.setText(clube1.getNome());
        lblTime2.setText(clube2.getNome());
    }

 
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jLabel1 = new javax.swing.JLabel();
        lblVitoria1 = new javax.swing.JLabel();
        btnVitoria1 = new javax.swing.JButton();
        btnEmpate1 = new javax.swing.JButton();
        btnDerrota1 = new javax.swing.JButton();
        btnVitoria2 = new javax.swing.JButton();
        btnEmpate2 = new javax.swing.JButton();
        btnDerrota2 = new javax.swing.JButton();
        lblTime1 = new javax.swing.JLabel();
        lblEmpate1 = new javax.swing.JLabel();
        lblDerrota1 = new javax.swing.JLabel();
        lblVitoria2 = new javax.swing.JLabel();
        lblEmpate2 = new javax.swing.JLabel();
        lblDerrota2 = new javax.swing.JLabel();
        lblTime2 = new javax.swing.JLabel();
        lblPontuacao1 = new javax.swing.JLabel();
        lblPontuacao2 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        lblVitorias1 = new javax.swing.JLabel();
        lblEmpates1 = new javax.swing.JLabel();
        lblDerrotas1 = new javax.swing.JLabel();
        lblVitorias2 = new javax.swing.JLabel();
        lblEmpates2 = new javax.swing.JLabel();
        lblDerrotas2 = new javax.swing.JLabel();
        lblPontuacoes1 = new javax.swing.JLabel();
        lblPontuacoes2 = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        lblVitoria1.setText("Vitórias - ");

        btnVitoria1.setText("Vitória");
        btnVitoria1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnVitoria1ActionPerformed(evt);
            }
        });

        btnEmpate1.setText("Empate");
        btnEmpate1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnEmpate1ActionPerformed(evt);
            }
        });

        btnDerrota1.setText("Derrota");
        btnDerrota1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnDerrota1ActionPerformed(evt);
            }
        });

        btnVitoria2.setText("Vitória");
        btnVitoria2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnVitoria2ActionPerformed(evt);
            }
        });

        btnEmpate2.setText("Empate");
        btnEmpate2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnEmpate2ActionPerformed(evt);
            }
        });

        btnDerrota2.setText("Derrota");
        btnDerrota2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnDerrota2ActionPerformed(evt);
            }
        });

        lblTime1.setText("Time 1");

        lblEmpate1.setText("Empates - ");

        lblDerrota1.setText("Derrotas - ");

        lblVitoria2.setText("Vitórias - ");

        lblEmpate2.setText("Empates - ");

        lblDerrota2.setText("Derrotas - ");

        lblTime2.setText("Time 2");

        lblPontuacao1.setText("Pontuação -");

        lblPontuacao2.setText("Pontuação -");

        lblVitorias1.setText("0");

        lblEmpates1.setText("0");

        lblDerrotas1.setText("0");

        lblVitorias2.setText("0");

        lblEmpates2.setText("0");

        lblDerrotas2.setText("0");

        lblPontuacoes1.setText("0");

        lblPontuacoes2.setText("0");

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addGroup(layout.createSequentialGroup()
                        .addGap(0, 0, Short.MAX_VALUE)
                        .addComponent(lblPontuacao2, javax.swing.GroupLayout.PREFERRED_SIZE, 76, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(layout.createSequentialGroup()
                                .addGap(19, 19, 19)
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                                    .addComponent(btnEmpate1)
                                    .addComponent(btnDerrota1)
                                    .addComponent(btnEmpate2)
                                    .addComponent(btnDerrota2)
                                    .addComponent(btnVitoria2, javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(btnVitoria1, javax.swing.GroupLayout.Alignment.LEADING)))
                            .addGroup(layout.createSequentialGroup()
                                .addGap(195, 195, 195)
                                .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 46, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addGroup(layout.createSequentialGroup()
                                .addGap(162, 162, 162)
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(lblTime1, javax.swing.GroupLayout.PREFERRED_SIZE, 66, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addComponent(lblTime2, javax.swing.GroupLayout.PREFERRED_SIZE, 66, javax.swing.GroupLayout.PREFERRED_SIZE))))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 89, Short.MAX_VALUE)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING, false)
                                    .addComponent(lblDerrota2, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                    .addComponent(lblEmpate2, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                    .addComponent(lblVitoria2, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.PREFERRED_SIZE, 46, javax.swing.GroupLayout.PREFERRED_SIZE))
                                .addGap(18, 18, 18)
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(lblVitorias2, javax.swing.GroupLayout.PREFERRED_SIZE, 31, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addComponent(lblEmpates2, javax.swing.GroupLayout.PREFERRED_SIZE, 31, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addComponent(lblDerrotas2, javax.swing.GroupLayout.PREFERRED_SIZE, 31, javax.swing.GroupLayout.PREFERRED_SIZE)))
                            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING, false)
                                    .addComponent(lblDerrota1, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                    .addComponent(lblEmpate1, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                    .addComponent(lblVitoria1, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(jLabel2, javax.swing.GroupLayout.PREFERRED_SIZE, 31, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addComponent(lblVitorias1, javax.swing.GroupLayout.PREFERRED_SIZE, 31, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addComponent(lblEmpates1, javax.swing.GroupLayout.PREFERRED_SIZE, 31, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addComponent(lblDerrotas1, javax.swing.GroupLayout.PREFERRED_SIZE, 31, javax.swing.GroupLayout.PREFERRED_SIZE)))
                            .addComponent(lblPontuacao1, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.PREFERRED_SIZE, 76, javax.swing.GroupLayout.PREFERRED_SIZE))))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(lblPontuacoes1, javax.swing.GroupLayout.PREFERRED_SIZE, 31, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(lblPontuacoes2, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.PREFERRED_SIZE, 36, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel1)
                .addGap(13, 13, 13)
                .addComponent(lblTime1)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnVitoria1)
                    .addComponent(lblVitoria1)
                    .addComponent(jLabel2)
                    .addComponent(lblVitorias1))
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(btnEmpate1)
                    .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                        .addComponent(lblEmpate1)
                        .addComponent(lblEmpates1)))
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnDerrota1)
                    .addComponent(lblDerrota1)
                    .addComponent(lblDerrotas1))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 16, Short.MAX_VALUE)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(lblTime2)
                    .addComponent(lblPontuacao1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(lblPontuacoes1))
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGap(1, 1, 1)
                        .addComponent(btnVitoria2)
                        .addGap(18, 18, 18)
                        .addComponent(btnEmpate2)
                        .addGap(21, 21, 21)
                        .addComponent(btnDerrota2))
                    .addGroup(layout.createSequentialGroup()
                        .addGap(10, 10, 10)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(lblVitoria2)
                            .addComponent(lblVitorias2))
                        .addGap(18, 18, 18)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(lblEmpate2)
                            .addComponent(lblEmpates2))
                        .addGap(18, 18, 18)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(lblDerrota2)
                            .addComponent(lblDerrotas2))))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 12, Short.MAX_VALUE)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(lblPontuacao2)
                    .addComponent(lblPontuacoes2))
                .addGap(26, 26, 26))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btnVitoria1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnVitoria1ActionPerformed
       clube1.setVitoria();
       lblVitorias1.setText(clube1.getVitoria().toString());
       lblPontuacoes1.setText(clube1.getPontuacao().toString());
    }//GEN-LAST:event_btnVitoria1ActionPerformed

    private void btnEmpate1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnEmpate1ActionPerformed
      clube1.setEmpate();
      lblEmpates1.setText(clube1.getEmpate().toString());
      lblPontuacoes1.setText(clube1.getEmpate().toString());
    }//GEN-LAST:event_btnEmpate1ActionPerformed

    private void btnDerrota1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnDerrota1ActionPerformed
        clube1.setDerrota();
        lblDerrotas1.setText(clube1.getDerrota().toString());
        lblPontuacoes1.setText(clube1.getPontuacao().toString());
    }//GEN-LAST:event_btnDerrota1ActionPerformed

    private void btnVitoria2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnVitoria2ActionPerformed
       clube2.setVitoria();
       lblVitorias2.setText(clube2.getVitoria().toString());
       lblPontuacoes2.setText(clube2.getPontuacao().toString());
    }//GEN-LAST:event_btnVitoria2ActionPerformed

    private void btnEmpate2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnEmpate2ActionPerformed
     clube2.setEmpate();
      lblEmpates2.setText(clube2.getEmpate().toString());
      lblPontuacoes2.setText(clube2.getEmpate().toString());
    }//GEN-LAST:event_btnEmpate2ActionPerformed

    private void btnDerrota2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnDerrota2ActionPerformed
        clube2.setDerrota();
        lblDerrotas2.setText(clube2.getDerrota().toString());
        lblPontuacoes2.setText(clube2.getPontuacao().toString());
    }//GEN-LAST:event_btnDerrota2ActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(Exercicio01Clube.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(Exercicio01Clube.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(Exercicio01Clube.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(Exercicio01Clube.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new Exercicio01Clube().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnDerrota1;
    private javax.swing.JButton btnDerrota2;
    private javax.swing.JButton btnEmpate1;
    private javax.swing.JButton btnEmpate2;
    private javax.swing.JButton btnVitoria1;
    private javax.swing.JButton btnVitoria2;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel lblDerrota1;
    private javax.swing.JLabel lblDerrota2;
    private javax.swing.JLabel lblDerrotas1;
    private javax.swing.JLabel lblDerrotas2;
    private javax.swing.JLabel lblEmpate1;
    private javax.swing.JLabel lblEmpate2;
    private javax.swing.JLabel lblEmpates1;
    private javax.swing.JLabel lblEmpates2;
    private javax.swing.JLabel lblPontuacao1;
    private javax.swing.JLabel lblPontuacao2;
    private javax.swing.JLabel lblPontuacoes1;
    private javax.swing.JLabel lblPontuacoes2;
    private javax.swing.JLabel lblTime1;
    private javax.swing.JLabel lblTime2;
    private javax.swing.JLabel lblVitoria1;
    private javax.swing.JLabel lblVitoria2;
    private javax.swing.JLabel lblVitorias1;
    private javax.swing.JLabel lblVitorias2;
    // End of variables declaration//GEN-END:variables
}
