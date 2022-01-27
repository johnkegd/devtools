package com.tasks;

import com.Task;
import org.powerbot.script.rt4.ClientContext;
import org.powerbot.script.rt4.Item;

public class Drop extends Task {
    private int [] Itemsid = {1511, 440,1521};

    public Drop(ClientContext ctx) {
        super(ctx);
    }

    @Override
    public boolean activate() {
        return ctx().inventory.select().count() ==28;
    }

    @Override
    public void execute() {


        if(ctx().players.local().click("Inventory")){
            if(ctx().inventory.shiftDroppingEnabled()){
                for (Item i : ctx().inventory.id(Itemsid)) {
                    ctx().inventory.drop(i,true);
                    //  i.interact("Drop");
                }
            }else{
                ctx().players.local().click("Options");
                ctx().players.local().click("Toggle shift click to drop");
                execute();
            }
        }



    }

}
