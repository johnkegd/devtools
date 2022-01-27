package com;

import org.powerbot.script.PollingScript;
import org.powerbot.script.Script;
import org.powerbot.script.rt4.ClientContext;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Script.Manifest(name = "ChopperTraining", description = "cuts willow and logs " , properties = "client=4; topic=0;")
public class PowerChopper extends PollingScript<ClientContext> {
    private int [] treeIds = {38616,38627,58006};
    private List<Task> taskList = new ArrayList<Task>();


    @Override
    public void start() {

        taskList.addAll(Arrays.asList(new Chop(ctx), new Drop(ctx)));

    }


    @Override
    public void poll() {
        for(Task task : taskList)
            if(task.activate())
                task.execute();

    }


}
