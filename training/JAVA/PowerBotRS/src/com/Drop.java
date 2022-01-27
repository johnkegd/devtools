package com;

import org.powerbot.script.rt4.ClientContext;
import org.powerbot.script.rt4.Item;

public class Drop extends Task{
    private int LogId = 1511;

    public Drop(ClientContext ctx) {
        super(ctx);
    }

    @Override
    public boolean activate() {
        return ctx.inventory.select().count() ==28;
    }

    @Override
    public void execute() {
        for (Item i : ctx.inventory.id(LogId))
            i.interact("Drop");
    }
}
