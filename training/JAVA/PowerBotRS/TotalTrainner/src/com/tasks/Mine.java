package com.tasks;

import com.Task;
import org.powerbot.script.Condition;
import org.powerbot.script.Random;
import org.powerbot.script.rt4.ClientContext;
import org.powerbot.script.rt4.GameObject;

public class Mine extends Task {
    private int [] ores = {11365,11364};

    public Mine(ClientContext ctx) {
        super(ctx);
    }

    // Check for Currently status
    @Override
    public boolean activate() {
        return !ctx().inventory.isFull()
                && !ctx().objects.select().id(ores).isEmpty()
                && ctx().players.local().animation() == -1;
    }

    @Override
    public void execute() {
        GameObject ore = ctx().objects.nearest().poll();
        Condition.sleep(Random.nextInt(795,1296));
            if(ore.inViewport())
                ore.interact("Mine");

            else{
                ctx().camera.turnTo(ore);
                ctx().movement.step(ore);

            }

    }


}
