package com.actions;

import com.data.MinesArea;
import com.data.Rocks;
import org.powerbot.script.Condition;
import org.powerbot.script.Random;
import org.powerbot.script.rt4.ClientContext;
import org.powerbot.script.rt4.Interactive;

import java.util.concurrent.Callable;

public class Mine extends GraphScript.Action<ClientContext> {

    private final MinesArea mine;
    private final Rocks ore;
    private final OreClick oreClicker;

    public Mine(ClientContext ctx, MinesArea mine, Rocks ores) {
        super(ctx);
        oreClicker = new OreClick(ctx,ores);
        this.mine = mine;
        this.ore = ores;
    }


    @Override
    public boolean valid() {
        return ctx.inventory.select().count() < 28
                && mine.getMineArea().contains(ctx.players.local())
                && hasMine()
                && ctx.players.local().animation() == -1
                && !ctx.players.local().inMotion();
    }


    @Override
    public void run() {
        oreClicker.clickNextOre();
        Condition.sleep(Random.nextInt(825,1325));
        if(!Condition.wait(new Callable<Boolean>() {

            @Override
            public Boolean call() throws Exception {
                return !ctx.players.local().inMotion()
                        || ctx.players.local().animation() != -1
                        || !oreClicker.isCurrentOreValid();
            }
        },210, 29)) {
            return;
        }

        if(!Condition.wait(new Callable<Boolean>() {

            @Override
            public Boolean call() throws Exception {
                return ctx.players.local().animation() != -1
                        || !oreClicker.isCurrentOreValid();
            }
        }, 102, 6)){
            return;
        }
        Condition.sleep(Random.nextInt(425, 925));
        Condition.wait(new Callable<Boolean>() {

            @Override
            public Boolean call() throws Exception {
                return !oreClicker.isCurrentOreValid();
            }
        },105,121);
        oreClicker.clearInteraction();

    }


    private boolean hasMine() {
        if(!ctx.objects.select().id(ore.getIds()).select(Interactive.areInViewport()).isEmpty())
            return true;

        if(!ctx.objects.select().id(ore.getIds()).isEmpty())
            return true;

        return false;

    }



}
