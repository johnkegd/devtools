package com.testing;


import org.powerbot.script.Filter;
import org.powerbot.script.PollingScript;
import org.powerbot.script.rt4.ClientContext;
import org.powerbot.script.rt4.GameObject;
import org.powerbot.script.rt4.Objects;

//@Script.Manifest(name="Hello", description = "hola", properties="client=4; author=Johnkegd; topic=999;")
public class Hello extends PollingScript<ClientContext> {
    int [] oreIds = {1192,1191};

    @Override
    public void poll() {
        Filter<Objects> filterOres = new Filter<Objects>(){

            @Override
            public boolean accept(Objects ores) {

                boolean oreEmpty = ores.isEmpty();
                return oreEmpty;
            }

        };


        GameObject ore = ctx.objects.select().id(oreIds).nearest().select((Iterable<GameObject>) filterOres).poll();


    }


    @Override
    public void start() {
       // System.out.println("hi");
    }




}
