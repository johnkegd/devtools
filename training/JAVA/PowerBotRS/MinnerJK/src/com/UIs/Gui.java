package com.UIs;

import com.MinnerJK;
import com.data.MinesArea;
import com.data.Rocks;
import org.powerbot.script.Random;

import javax.swing.*;
import java.awt.event.ActionEvent;
import java.util.ArrayList;

public class Gui extends javax.swing.JFrame{


    public Gui(){
        initComponents();
        ArrayList<String> mineNames = new ArrayList<String>();
        
        for(MinesArea mine : MinesArea.values())
            mineNames.add(mine.getName());
        
        jComboBox2.setModel(new DefaultComboBoxModel(mineNames.toArray(new String[mineNames.size()])));
        MinesArea mine = MinesArea.values()[0];
        
            
    }

    private MinnerJK minnerJk = null;

    public void setMinnerJK(MinnerJK minnerJk){
        this.minnerJk = minnerJk;
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jLabel3 = new javax.swing.JLabel();
        jTabbedPane1 = new javax.swing.JTabbedPane();
        jPanel1 = new javax.swing.JPanel();
        jComboBox1 = new javax.swing.JComboBox();
        jLabel2 = new javax.swing.JLabel();
        jComboBox2 = new javax.swing.JComboBox();
        jToggleButton1 = new javax.swing.JToggleButton();
        jLabel1 = new javax.swing.JLabel();
        jLabel7 = new javax.swing.JLabel();
        jComboBox3 = new javax.swing.JComboBox();
        jPanel2 = new javax.swing.JPanel();
        jLabel5 = new javax.swing.JLabel();
        smeltLocation = new javax.swing.JComboBox();
        jLabel6 = new javax.swing.JLabel();
        smeltBar = new javax.swing.JComboBox();
        jButton1 = new javax.swing.JButton();
        jPanel3 = new javax.swing.JPanel();
        shortBreak = new javax.swing.JButton();
        jLabel4 = new javax.swing.JLabel();
        medBreak = new javax.swing.JButton();
        longBreak = new javax.swing.JButton();
        breakSelection = new javax.swing.JCheckBox();
        jLabel8 = new javax.swing.JLabel();
        spinWork1 = new javax.swing.JSpinner();
        jLabel9 = new javax.swing.JLabel();
        spinBreak1 = new javax.swing.JSpinner();
        jLabel10 = new javax.swing.JLabel();
        spinWork2 = new javax.swing.JSpinner();
        jLabel11 = new javax.swing.JLabel();
        spinBreak2 = new javax.swing.JSpinner();
        spinBreak3 = new javax.swing.JSpinner();
        jLabel12 = new javax.swing.JLabel();
        spinWork3 = new javax.swing.JSpinner();
        jLabel13 = new javax.swing.JLabel();
        spinBreak4 = new javax.swing.JSpinner();
        jLabel14 = new javax.swing.JLabel();
        spinWork4 = new javax.swing.JSpinner();
        jLabel15 = new javax.swing.JLabel();
        spinBreak5 = new javax.swing.JSpinner();
        jLabel16 = new javax.swing.JLabel();
        spinWork5 = new javax.swing.JSpinner();
        jLabel17 = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);

        jLabel3.setFont(new java.awt.Font("Sylfaen", 0, 18)); // NOI18N
        jLabel3.setText("hMiner");

        jLabel2.setText("Ore");

        jComboBox2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jComboBox2ActionPerformed(evt);
            }
        });

        jToggleButton1.setText("Go");
        jToggleButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jToggleButton1ActionPerformed(evt);
            }
        });

        jLabel1.setText("Location");

        jLabel7.setText("Style");

        jComboBox3.setModel(new javax.swing.DefaultComboBoxModel(new String[] { "Bank", "Drop", "M1D1" }));

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
                jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                        .addGroup(jPanel1Layout.createSequentialGroup()
                                .addGap(84, 84, 84)
                                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                        .addGroup(jPanel1Layout.createSequentialGroup()
                                                .addGap(21, 21, 21)
                                                .addComponent(jToggleButton1))
                                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING, false)
                                                .addComponent(jComboBox3, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                                        .addGroup(jPanel1Layout.createSequentialGroup()
                                                                .addGap(18, 18, 18)
                                                                .addComponent(jLabel1))
                                                        .addGroup(jPanel1Layout.createSequentialGroup()
                                                                .addGap(33, 33, 33)
                                                                .addComponent(jLabel2))
                                                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                                                                .addComponent(jComboBox1, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                                                .addComponent(jComboBox2, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.PREFERRED_SIZE, 90, javax.swing.GroupLayout.PREFERRED_SIZE))
                                                        .addGroup(jPanel1Layout.createSequentialGroup()
                                                                .addGap(28, 28, 28)
                                                                .addComponent(jLabel7)))))
                                .addContainerGap(96, Short.MAX_VALUE))
        );
        jPanel1Layout.setVerticalGroup(
                jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                        .addGroup(jPanel1Layout.createSequentialGroup()
                                .addContainerGap()
                                .addComponent(jLabel1)
                                .addGap(18, 18, 18)
                                .addComponent(jComboBox2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(jLabel2)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(jComboBox1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                .addComponent(jLabel7)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(jComboBox3, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 26, Short.MAX_VALUE)
                                .addComponent(jToggleButton1)
                                .addContainerGap())
        );

        jTabbedPane1.addTab("Mining", jPanel1);

        jLabel5.setText("Location");

        jLabel6.setText("Bar");

        jButton1.setText("Go");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel2Layout = new javax.swing.GroupLayout(jPanel2);
        jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(
                jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                        .addGroup(jPanel2Layout.createSequentialGroup()
                                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                        .addGroup(jPanel2Layout.createSequentialGroup()
                                                .addGap(82, 82, 82)
                                                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                                                        .addComponent(smeltLocation, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                                        .addComponent(smeltBar, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                                        .addComponent(jButton1, javax.swing.GroupLayout.PREFERRED_SIZE, 80, javax.swing.GroupLayout.PREFERRED_SIZE)))
                                        .addGroup(jPanel2Layout.createSequentialGroup()
                                                .addGap(99, 99, 99)
                                                .addComponent(jLabel5))
                                        .addGroup(jPanel2Layout.createSequentialGroup()
                                                .addGap(112, 112, 112)
                                                .addComponent(jLabel6)))
                                .addContainerGap(108, Short.MAX_VALUE))
        );
        jPanel2Layout.setVerticalGroup(
                jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                        .addGroup(jPanel2Layout.createSequentialGroup()
                                .addContainerGap()
                                .addComponent(jLabel5)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(smeltLocation, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(jLabel6)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(smeltBar, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 68, Short.MAX_VALUE)
                                .addComponent(jButton1)
                                .addGap(32, 32, 32))
        );

        jTabbedPane1.addTab("Smelting", jPanel2);

        shortBreak.setText("Short");
        shortBreak.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                shortBreakActionPerformed(evt);
            }
        });

        jLabel4.setText("Presets");

        medBreak.setText("Medium");
        medBreak.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                medBreakActionPerformed(evt);
            }
        });

        longBreak.setText("Long");
        longBreak.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                longBreakActionPerformed(evt);
            }
        });

        breakSelection.setText("Break Enabled");

        jLabel8.setText("Break at:");

        spinWork1.setModel(new javax.swing.SpinnerNumberModel(20, 1, 400, 1));

        jLabel9.setText("For: ");

        spinBreak1.setModel(new javax.swing.SpinnerNumberModel(20, 1, 400, 1));

        jLabel10.setText("Break at:");

        spinWork2.setModel(new javax.swing.SpinnerNumberModel(20, 1, 400, 1));

        jLabel11.setText("For: ");

        spinBreak2.setModel(new javax.swing.SpinnerNumberModel(20, 1, 400, 1));

        spinBreak3.setModel(new javax.swing.SpinnerNumberModel(20, 1, 400, 1));

        jLabel12.setText("For: ");

        spinWork3.setModel(new javax.swing.SpinnerNumberModel(20, 1, 400, 1));

        jLabel13.setText("Break at:");

        spinBreak4.setModel(new javax.swing.SpinnerNumberModel(20, 1, 400, 1));

        jLabel14.setText("For: ");

        spinWork4.setModel(new javax.swing.SpinnerNumberModel(20, 1, 400, 1));

        jLabel15.setText("Break at:");

        spinBreak5.setModel(new javax.swing.SpinnerNumberModel(20, 1, 400, 1));

        jLabel16.setText("For: ");

        spinWork5.setModel(new javax.swing.SpinnerNumberModel(20, 1, 400, 1));

        jLabel17.setText("Break at:");

        javax.swing.GroupLayout jPanel3Layout = new javax.swing.GroupLayout(jPanel3);
        jPanel3.setLayout(jPanel3Layout);
        jPanel3Layout.setHorizontalGroup(
                jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                        .addGroup(jPanel3Layout.createSequentialGroup()
                                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                        .addGroup(jPanel3Layout.createSequentialGroup()
                                                .addGap(79, 79, 79)
                                                .addComponent(breakSelection))
                                        .addGroup(jPanel3Layout.createSequentialGroup()
                                                .addGap(30, 30, 30)
                                                .addComponent(shortBreak)
                                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                                .addComponent(medBreak)
                                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                                .addComponent(longBreak))
                                        .addGroup(jPanel3Layout.createSequentialGroup()
                                                .addGap(22, 22, 22)
                                                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                                        .addGroup(jPanel3Layout.createSequentialGroup()
                                                                .addGap(96, 96, 96)
                                                                .addComponent(jLabel4))
                                                        .addGroup(jPanel3Layout.createSequentialGroup()
                                                                .addComponent(jLabel8)
                                                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                                                .addComponent(spinWork1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                                                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                                                .addComponent(jLabel9)
                                                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                                                .addComponent(spinBreak1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                                                        .addGroup(jPanel3Layout.createSequentialGroup()
                                                                .addComponent(jLabel10)
                                                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                                                .addComponent(spinWork2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                                                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                                                .addComponent(jLabel11)
                                                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                                                .addComponent(spinBreak2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                                                        .addGroup(jPanel3Layout.createSequentialGroup()
                                                                .addComponent(jLabel13)
                                                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                                                .addComponent(spinWork3, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                                                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                                                .addComponent(jLabel12)
                                                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                                                .addComponent(spinBreak3, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                                                        .addGroup(jPanel3Layout.createSequentialGroup()
                                                                .addComponent(jLabel15)
                                                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                                                .addComponent(spinWork4, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                                                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                                                .addComponent(jLabel14)
                                                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                                                .addComponent(spinBreak4, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                                                        .addGroup(jPanel3Layout.createSequentialGroup()
                                                                .addComponent(jLabel17)
                                                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                                                .addComponent(spinWork5, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                                                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                                                .addComponent(jLabel16)
                                                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                                                .addComponent(spinBreak5, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))))
                                .addContainerGap(45, Short.MAX_VALUE))
        );
        jPanel3Layout.setVerticalGroup(
                jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                        .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel3Layout.createSequentialGroup()
                                .addContainerGap()
                                .addComponent(breakSelection)
                                .addGap(18, 18, 18)
                                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                                        .addComponent(jLabel8)
                                        .addComponent(spinWork1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                                        .addComponent(jLabel9)
                                        .addComponent(spinBreak1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                                        .addComponent(jLabel10)
                                        .addComponent(spinWork2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                                        .addComponent(jLabel11)
                                        .addComponent(spinBreak2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                                        .addComponent(jLabel13)
                                        .addComponent(spinWork3, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                                        .addComponent(jLabel12)
                                        .addComponent(spinBreak3, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                                        .addComponent(jLabel15)
                                        .addComponent(spinWork4, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                                        .addComponent(jLabel14)
                                        .addComponent(spinBreak4, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                                        .addComponent(jLabel17)
                                        .addComponent(spinWork5, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                                        .addComponent(jLabel16)
                                        .addComponent(spinBreak5, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                .addComponent(jLabel4)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                                        .addComponent(shortBreak)
                                        .addComponent(medBreak)
                                        .addComponent(longBreak)))
        );

        jTabbedPane1.addTab("Breaks", jPanel3);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
                layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                        .addComponent(jTabbedPane1, javax.swing.GroupLayout.Alignment.TRAILING)
                        .addGroup(layout.createSequentialGroup()
                                .addGap(83, 83, 83)
                                .addComponent(jLabel3)
                                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
                layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                        .addGroup(layout.createSequentialGroup()
                                .addContainerGap()
                                .addComponent(jLabel3)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 8, Short.MAX_VALUE)
                                .addComponent(jTabbedPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 248, javax.swing.GroupLayout.PREFERRED_SIZE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void jButton1ActionPerformed(ActionEvent evt) {
    }

    private void jComboBox2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jComboBox2ActionPerformed
        MinesArea mine = null;
        for (MinesArea m : MinesArea.values()) {
            if (((String) jComboBox2.getSelectedItem()).equalsIgnoreCase(m.getName())) {
                mine = m;
            }
        }
        if (mine == null) {
            return;
        }
        ArrayList<String> oreNames = new ArrayList<String>();
        for (Rocks ore : mine.getOres()) {
            oreNames.add(ore.getName());
        }
        jComboBox1.setModel(new DefaultComboBoxModel(oreNames.toArray(new String[oreNames.size()])));
    }//GEN-LAST:event_jComboBox2ActionPerformed
    private MinesArea mine;
    private Rocks ore;

    public Rocks getOre() {
        return ore;
    }

    public MinesArea getMine() {
        return mine;
    }
    private boolean finished = false;

    public boolean isFinished() {
        return finished;
    }

    private void jToggleButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jToggleButton1ActionPerformed
        MinesArea mine = null;
        for (MinesArea m : MinesArea.values()) {
            if (((String) jComboBox2.getSelectedItem()).equalsIgnoreCase(m.getName())) {
                mine = m;
            }
        }
        Rocks ore = null;
        for (Rocks ores : Rocks.values()) {
            if (((String) jComboBox1.getSelectedItem()).equalsIgnoreCase(ores.getName())) {
                ore = ores;
                break;
            }
        }
//        MiningStyle mStyle = null;
//        for (MiningStyle m : MiningStyle.values()) {
//            if (((String) jComboBox3.getSelectedItem()).equalsIgnoreCase(m.name())) {
//                mStyle = m;
//            }
//        }
//        finished = true;
//        aioMiner.setupMining(mine, ore, mStyle);
//        if (breakSelection.isSelected()) {
//            setupSleeping();
//        }
        dispose();
    }//GEN-LAST:event_jToggleButton1ActionPerformed

//    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
//        Furnaces mine = null;
//        for (Furnaces m : Furnaces.values()) {
//            if (((String) smeltLocation.getSelectedItem()).equalsIgnoreCase(m.getName())) {
//                mine = m;
//                break;
//            }
//        }
//        Bars bar = null;
//        for (Bars m : Bars.values()) {
//            if (((String) smeltBar.getSelectedItem()).equalsIgnoreCase(m.name())) {
//                bar = m;
//                break;
//            }
//        }
//        System.out.println("Setting up smelting with furnace " + mine.getName() + " and bar type " + bar.name());
//        aioMiner.setupSmelt(mine, bar);
//        finished = true;
//        dispose();
//    }//GEN-LAST:event_jButton1ActionPerformed
    //Short
    private void shortBreakActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_shortBreakActionPerformed
        setupBoxes(45, 7);
    }//GEN-LAST:event_shortBreakActionPerformed
    //Med
    private void medBreakActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_medBreakActionPerformed
        setupBoxes(35, 10);
    }//GEN-LAST:event_medBreakActionPerformed
    //Long
    private void longBreakActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_longBreakActionPerformed
        setupBoxes(50, 15);
    }//GEN-LAST:event_longBreakActionPerformed

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
            java.util.logging.Logger.getLogger(Gui.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(Gui.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(Gui.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(Gui.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new Gui().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JCheckBox breakSelection;
    private javax.swing.JButton jButton1;
    private javax.swing.JComboBox jComboBox1;
    private javax.swing.JComboBox jComboBox2;
    private javax.swing.JComboBox jComboBox3;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel10;
    private javax.swing.JLabel jLabel11;
    private javax.swing.JLabel jLabel12;
    private javax.swing.JLabel jLabel13;
    private javax.swing.JLabel jLabel14;
    private javax.swing.JLabel jLabel15;
    private javax.swing.JLabel jLabel16;
    private javax.swing.JLabel jLabel17;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JLabel jLabel9;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel3;
    private javax.swing.JTabbedPane jTabbedPane1;
    private javax.swing.JToggleButton jToggleButton1;
    private javax.swing.JButton longBreak;
    private javax.swing.JButton medBreak;
    private javax.swing.JButton shortBreak;
    private javax.swing.JComboBox smeltBar;
    private javax.swing.JComboBox smeltLocation;
    private javax.swing.JSpinner spinBreak1;
    private javax.swing.JSpinner spinBreak2;
    private javax.swing.JSpinner spinBreak3;
    private javax.swing.JSpinner spinBreak4;
    private javax.swing.JSpinner spinBreak5;
    private javax.swing.JSpinner spinWork1;
    private javax.swing.JSpinner spinWork2;
    private javax.swing.JSpinner spinWork3;
    private javax.swing.JSpinner spinWork4;
    private javax.swing.JSpinner spinWork5;
    // End of variables declaration//GEN-END:variables

    private void setupBoxes(int workTime, int breakTime) {
        JSpinner[] workSpinners = new JSpinner[]{spinWork1, spinWork2, spinWork3, spinWork4, spinWork5};
        JSpinner[] breakSpinners = new JSpinner[]{spinBreak1, spinBreak2, spinBreak3, spinBreak4, spinBreak5};
        int workTimeMin = (int) (workTime - (workTime * 0.2)), workTimeMax = (int) (workTime + (workTime * 0.2)),
                breakTimeMin = (int) (breakTime - (breakTime * 0.3)), breakTimeMax = (int) (breakTime + (breakTime * 0.3));
        for (JSpinner js : workSpinners) {
            js.setValue(Random.nextInt(workTimeMin, workTimeMax));
        }
        for (JSpinner js : breakSpinners) {
            js.setValue(Random.nextInt(breakTimeMin, breakTimeMax));
        }
    }

//    private void setupSleeping() {
//        List<ScheduledBreak> breakList = new ArrayList<ScheduledBreak>();
//        breakList.add(new ScheduledBreak((int) spinWork1.getValue(), (int) spinBreak1.getValue()));
//        breakList.add(new ScheduledBreak((int) spinWork2.getValue(), (int) spinBreak2.getValue()));
//        breakList.add(new ScheduledBreak((int) spinWork3.getValue(), (int) spinBreak3.getValue()));
//        breakList.add(new ScheduledBreak((int) spinWork4.getValue(), (int) spinBreak4.getValue()));
//        breakList.add(new ScheduledBreak((int) spinWork5.getValue(), (int) spinBreak5.getValue()));
//        aioMiner.setupSleeps(breakList.toArray(new ScheduledBreak[breakList.size()]));
//    }
}




