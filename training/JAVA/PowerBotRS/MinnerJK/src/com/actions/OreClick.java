package com.actions;

import com.data.Rocks;
import org.powerbot.script.Condition;
import org.powerbot.script.Filter;
import org.powerbot.script.Locatable;
import org.powerbot.script.Random;
import org.powerbot.script.rt4.*;
import java.util.concurrent.Callable;

public class OreClick {

    private final Rocks ores;
    private GameObject interacting = null, next = null;
    private final Filter<Menu.Command> menuFilter;
    private final Filter<GameObject> oreFilter;
    private final ClientContext ctx;


    public OreClick(ClientContext ctx, final Rocks ores) {
        this.ctx = ctx;
        this.ores = ores;
        menuFilter = new Filter<Menu.Command>(){

            @Override
            public boolean accept(Menu.Command obj) {
                return obj.action.equalsIgnoreCase("mine") && obj.option.startsWith(ores.getName());
            }
        };

        oreFilter = new Filter<GameObject>() {
            @Override
            public boolean accept(GameObject obj) {
                return interacting == null || interacting.tile().compareTo(obj.tile()) != 0;
            }
        };

    }

    public void clickNextOre(){
        if(next == null || !next.valid() || next.actions().length == 0){
            BasicQuery<GameObject> query = ctx.objects.nearest();
            if(query.isEmpty()){
                return;
            }else{
                query.limit(3).shuffle();
                next = query.poll();
            }
        }
        if(next != null && next.valid()){
            if(!next.inViewport()){
                ctx.camera.turnTo(next);
                ctx.movement.step(next);
                Condition.sleep(Random.nextInt(700,1250));
                Condition.wait(new Callable<Boolean>() {

                    @Override
                    public Boolean call() throws Exception {
                        return next.inViewport() || !ctx.players.local().inMotion();
                    }
                },590,4);

            }
            if(Random.nextInt(0,13) == 1){
                ctx.camera.turnTo(next);
            }
            next.bounds(-149,103, 223,-55, -118, 84);
            while(next.valid() && next.actions().length > 0 && !next.interact(String.valueOf(menuFilter))){
                if(next.inViewport() && next.valid()){
                    ctx.input.click(next.nextPoint(), true);
                    return;
                }else if(next.valid()){
                    ctx.camera.turnTo(next,25);
                    ctx.movement.step(next);
                    Condition.sleep(890);

                    Condition.wait(new Callable<Boolean>() {

                        @Override
                        public Boolean call() throws Exception {
                            return next.inViewport() || !ctx.players.local().inMotion();
                        }
                    }, 495, 5);

                }else{
                    calculateNextRock();
                }
            }
            interacting = next;
            next = null;
        }

    }

    public boolean isCurrentOreValid(){
        return interacting != null && interacting.valid();
    }


    public void calculateNextRock(){
        GameObject go = getNextRock();
        if(go != null)
            if(interacting == null)
                next = go;

    }


    public void checkCloserOre(){
        if(next == null)
            return;

        GameObject go = getNextRock();

        if(go == null)
            return;

        if(next.valid() || go.tile().distanceTo(ctx.players.local().tile()) < next.tile()
                .distanceTo(ctx.players.local().tile()))

            next = go;

    }


    public GameObject getNextRock(){
        BasicQuery<GameObject> query = ctx.objects.select(oreFilter).id(ores.getIds())
                .nearest().limit(3);

        if(query.isEmpty())
            return null;

        GameObject temp = query.peek();
        Locatable workingFrom = interacting == null ? ctx.players.local() : interacting;

        if (temp.tile().distanceTo(workingFrom) < 2.5)
            return temp;
        else{
            query.limit(4).shuffle();
            return query.poll();
        }
    }


    public void hoverNextOre(){
        if (next != null)
            ctx.input.move(next.nextPoint());
    }


    public boolean hasCloserNextOre(){
        if(next == null)
            return true;

        GameObject go = getNextRock();
        if (go == null)
            return false;

        if (go.tile().distanceTo(ctx.players.local().tile()) < next.tile().distanceTo(ctx.players.local().tile()))
            return true;

        return false;
    }


    public void clearInteraction(){
        interacting = null;
    }


}
