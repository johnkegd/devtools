package com.tasks;

import com.Task;
import org.powerbot.script.Condition;
import org.powerbot.script.Filter;
import org.powerbot.script.Random;
import org.powerbot.script.rt4.ClientContext;
import org.powerbot.script.rt4.Npc;

public class Fight extends Task {

    int [] cowIds = {2862,2837,2839};

    public Fight(ClientContext ctx) {
        super(ctx);
    }

    @Override
    public boolean activate() {
        return ctx().players.local().healthBarVisible() == false
                && !ctx().players.local().interacting().valid()
                && ctx().players.local().healthPercent() >= 25;
    }

    @Override
    public void execute() {
        Filter<Npc> filter  = new Filter<Npc>() {
            @Override
            public boolean accept(Npc npc) {

                return !npc.healthBarVisible();
            }
        };

        Npc cow  = ctx().npcs.select().id(cowIds).nearest().select(filter).poll();

        if(cow.inViewport()){
            cow.interact("Attack");
            Condition.sleep(Random.nextInt(14500,18952));
        }else{
            ctx().camera.turnTo(cow);
        }

    }
}
