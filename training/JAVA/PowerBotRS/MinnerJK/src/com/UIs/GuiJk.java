package com.UIs;

import com.MinnerJK;
import com.data.MinesArea;
import com.data.Rocks;

import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;

public class GuiJk {


    private JTabbedPane jTabbedPane1;
    private JLabel jLabel3;
    private JPanel jPanel1;
    private JComboBox jComboBox1;
    private JLabel jLabel2;
    private JComboBox jComboBox2;
    private JLabel jLabel1;
    private JLabel jLabel7;
    private JComboBox jComboBox3;
    private JPanel jPanel2;
    private JLabel jLabel5;
    private JComboBox smeltLoc;
    private JLabel jLabel6;
    private JToggleButton jToggleButton1;
    private JButton jButton1;
    private JPanel jPanel3;
    private JLabel jLabel4;


    public GuiJk(){


        ArrayList<String> mineNames = new ArrayList<String>();
        for(MinesArea mine : MinesArea.values())
            mineNames.add(mine.getName());

        jComboBox2.setModel(new DefaultComboBoxModel(mineNames.toArray(new String[mineNames.size()])));


        MinesArea mine = MinesArea.values()[0];
        ArrayList<String> oresNames = new ArrayList<String>();
        for(Rocks ores : Rocks.values())
            oresNames.add(ores.getName());
        jComboBox1.setModel(new DefaultComboBoxModel(oresNames.toArray(new String[oresNames.size()])));

        jComboBox2.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                jComboBox2ActionPerformedActionEvent(e);
            }
        });

        jButton1.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                jToggleButton1ActionPerformed(e);
            }
        });
    }


    private MinnerJK minnerjk = null;

    public void setMinner(MinnerJK minnerjk){
        this.minnerjk = minnerjk;
    }

    private void createUIComponents() {
        // TODO: place custom component creation code here


    }

    /**
     *
     * @param args
     */
    public static void main(String[] args) {
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InstantiationException e) {
            e.printStackTrace();
        } catch (UnsupportedLookAndFeelException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new GuiJk().setVisible(true);
            }
        });

    }

    public void setVisible(boolean b) {
    }


    private void jComboBox2ActionPerformedActionEvent(ActionEvent e) {//GEN-FIRST:event_jToggleButton1ActionPerformed
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

    public Rocks getOre(){
        return ore;
    }

    public MinesArea getMine(){
        return mine;
    }

    private boolean finished = false;

    public boolean isFinished(){
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
        finished = true;
        minnerjk.setupMining(mine, ore); // Excluding  > mStyle method
//        if (breakSelection.isSelected()) {
//            setupSleeping();
//        }
       // dispose();
    }//GEN-LAST:event_jToggleButton1ActionPerformed



}
