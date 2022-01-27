package com;

import com.UIs.GuiJk;
import com.actions.GraphScript;
import com.actions.Mine;
import com.data.MinesArea;
import com.data.Rocks;
import org.powerbot.script.MessageEvent;
import org.powerbot.script.MessageListener;
import org.powerbot.script.PaintListener;
import org.powerbot.script.Script;
import org.powerbot.script.rt4.ClientContext;

import java.awt.*;

@Script.Manifest(name= "MinnerJK", description= "Miner Experiment Script")
public class MinnerJK extends GraphScript<ClientContext> implements PaintListener, MessageListener{

    private GuiJk gui = null;
    private int oresMined = 0;
    private int startXp, currentXp, startLvl, currentLvl =0;

    @SuppressWarnings("serial")
    @Override
    public void start(){
        gui = new GuiJk();
        gui.setMinner(this);
        gui.setVisible(true);
    }

    public void setStartXp(int startXp){
        this.startXp = startXp;
        this.currentXp = currentXp;
    }

    public void setStartLvl(int startLvl){
        this.startLvl = startLvl;
        this.currentLvl = currentLvl;
    }

    public void setCurrentXp(int currentXp){
        this.currentXp = currentXp;
    }

    public void setCurrentLvl(int currentLvl){
        this.currentLvl = currentLvl;
    }


    public int getStartXp(){
        return startXp;
    }
    public int getStartLvl(){
        return startLvl;
    }


    @Override
    public void stop() {
        System.out.println("STOP CALLED");
        System.out.println("Ores Mined: " + oresMined);
        System.out.println("Time Running: " + formatTime(getRuntime()));
        super.stop();
    }


    private final Color color1 = new Color(35, 194, 6, 153);
    private final Color color2 = new Color(145, 245, 160, 205);
    private final Color color3 = new Color(50, 50, 50);
    private final Color color4 = new Color(250, 250, 250);
    private final Color color5 = Color.BLACK;

    private final BasicStroke stroke1 = new BasicStroke(1);

    private final Font font1 = new Font("Forte", 0, 18);
    private final Font font2 = new Font("Arial", 1, 16);


    @Override
    public void repaint(Graphics g1) {
        double timePassed = 0;
        if (getRuntime() > 0) {
            timePassed = 3600000D / getRuntime();
        }
        Graphics2D g = (Graphics2D) g1;
        g.setColor(color1);
        g.fillRoundRect(72, 26, 199, 120, 16, 16);
        g.setColor(color2);
        g.setStroke(stroke1);
        g.drawRoundRect(72, 26, 199, 120, 16, 16);
        g.setFont(font1);
        g.setColor(color3);
        g.drawString("MinnerJK", 147, 45);
        g.setColor(color4);
        g.drawString("MinnerJK", 148, 46);
        g.setFont(font2);
        g.setColor(color5);
        g.drawString("Time Running: " + formatTime(getRuntime()), 75, 67);
//        if (style == Style.MINING) {
//            g.drawString("Ores Mined: " + oresMined + (oresMined == 0 || getRuntime() <= 0 ? "" : " (" + (int) (oresMined * timePassed) + ")"), 75, 87);
//        } else if (style == Style.SMELTING) {
//            g.drawString("Bars Smelted: " + oresMined + (oresMined == 0 || getRuntime() <= 0 ? "" : " (" + (int) (oresMined * timePassed) + ")"), 75, 87);
//        }
        g.drawString("XP Gained: " + (currentXp - startXp)
                + (currentXp == startXp ? "" : " (" + (int) (((currentXp - startXp)) * timePassed) + ")"), 75, 107);
        g.drawString("Levels Gained: " + (currentLvl - startLvl), 75, 127);
    }

    private String formatTime(final long time){
        final int sec = (int) (time / 1000), h = sec / 3600, m = sec / 60 % 60, s = sec % 60;
                return(h < 10 ? "0" + h : h) + ":" + (m < 10 ? "0" + m : m) + ":" + (s < 10 ? "0" + s : s);
    }


    private void setupActions(){
        // to next components

    }

    public void setupMining(MinesArea mine, Rocks ores){
        chain.add(new Mine(ctx, mine, ores));
    }

    @Override
    public void messaged(MessageEvent messageEvent) {
        if(messageEvent.text().contains("Manage to mine some") || messageEvent.text().contains("Retreive a bar of"));
        oresMined++;
    }


}
