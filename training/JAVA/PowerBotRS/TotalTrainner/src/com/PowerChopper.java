package com;

import com.tasks.Chop;
import com.tasks.Drop;
import com.tasks.Fight;
import com.tasks.Mine;
import org.powerbot.script.PaintListener;
import org.powerbot.script.PollingScript;
import org.powerbot.script.Script;
import org.powerbot.script.rt4.ClientContext;

import java.awt.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Scanner;

@Script.Manifest(name = "TotalTrainner", description = "Skilling Woodcutting, mining, and fighting with npcs in Runescape" , properties = "client=4; topic=0;")
public class PowerChopper extends PollingScript<ClientContext> implements PaintListener {

    private ArrayList<Task> taskList = new ArrayList<Task>();



    @Override
    public void start() {
        Scanner sc = new Scanner(System.in);
        System.out.println("Select option \n1.Mine " + "\n2.Woodcuting" + "\n3.Fight");
        int option = sc.nextInt();

        switch (option){
            case 1:
                taskList.addAll(Arrays.asList(new Mine(ctx), new Drop(ctx)));
                break;
            case 2:
                taskList.addAll(Arrays.asList(new Chop(ctx), new Drop(ctx)));
                break;
            case 3:
                taskList.add(new Fight(ctx));
                break;
            default:
                System.out.println("Ninguno ?");
        }

        //taskList.addAll(Arrays.asList(new Chop(ctx), new Drop(ctx)));

    }


    @Override
    public void poll() {
        for(Task task : taskList) {
            if (task.activate())
                task.execute();

        }
    }


    @Override
    public void repaint(Graphics graphics) {
            graphics.setColor(new Color(0, 0, 0, 180));
            graphics.fillRect(0,0,150,100);

            graphics.setColor(new Color(255,255,255));
            graphics.drawRect(0,0,150,100);

            graphics.drawString("Training",20,20);


    }


}
