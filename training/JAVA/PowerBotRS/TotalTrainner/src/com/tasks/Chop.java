package com.tasks;

import com.Task;
import org.powerbot.script.Condition;
import org.powerbot.script.Random;
import org.powerbot.script.rt4.ClientContext;
import org.powerbot.script.rt4.GameObject;


public class Chop extends Task {

    private int [] treeIds = {1571,10820}; // otros trees 1570,1276,1278,1637

    public Chop(ClientContext ctx) {
        super(ctx);
    }


    @Override
    public boolean activate() {

        return ctx().inventory.select().count() < 28
                && !ctx().objects.select().id(treeIds).isEmpty()
                && ctx().players.local().animation() == -1;
    }

    @Override
    public void execute() {
        GameObject tree = ctx().objects.nearest().poll();
            if(tree.inViewport() && ctx().inventory.shiftDroppingEnabled()) {
                tree.interact("Chop");
                ctx().skills.experience(Random.nextInt(158, 2594));
                ctx().chat.sendInput("hola hola");
                Condition.sleep(Random.nextInt(12200,17500));
            }
            else {
                ctx().camera.turnTo(tree);
                ctx().movement.step(tree);
                ctx().skills.experience(Random.nextInt(158, 2594));

            }
    }
}
