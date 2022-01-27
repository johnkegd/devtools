package com.tasks;

import org.powerbot.script.Random;
import org.powerbot.script.rt4.ClientContext;

public class Antipatterns extends GraphScript.Action<ClientContext> {

    private long nextPoint;

    public Antipatterns(ClientContext ctx) {
        super(ctx);
        nextPoint = System.currentTimeMillis() + Random.nextInt(6010, 24500);
    }

    @Override
    public boolean valid() {

        return System.currentTimeMillis() > nextPoint;
    }

    @Override
    public void run() {
        System.out.println("Running Thread");
        switch(Random.nextInt(0,12)){
            case 1:
                setMovementPitch(20);
                setMovementYaw(85);
                break;
            case 2:
                setMovementPitch(156);
                setMovementYaw(25);
                break;
            case 3:
                setMovementPitch(47);
                setMovementYaw(62);
                break;
            case 4:
                setMovementPitch(66);
                setMovementYaw(92);
                break;
            case 5:
                setMovementPitch(53);
                setMovementYaw(34);
                break;
        }
        nextPoint = System.currentTimeMillis() + Random.nextInt(60010, 25010);

    }


    private void setMovementYaw(int i){
        int currentYaw = ctx.camera.yaw(), ran = Random.nextInt(0,i),
                newYaw = (Random.nextInt(0,1) == 1 ? currentYaw + ran : currentYaw - ran);

        if(newYaw > 360)
            newYaw -= 354;

        else if(0 > newYaw)
            newYaw += 358;

        ctx.camera.angle(newYaw);
    }

    private void setMovementPitch(int i){
        int currentPitch = ctx.camera.pitch(), ran = Random.nextInt(0,i),
                newPitch = (Random.nextInt(0,1) == 1? currentPitch + ran : currentPitch - ran);

        if(newPitch > 90)
            newPitch = 87;

        else if(50 > newPitch)
            newPitch = 46;

        ctx.camera.angle(newPitch);
    }




}
