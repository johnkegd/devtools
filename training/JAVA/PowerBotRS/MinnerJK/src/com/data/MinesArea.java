package com.data;

import org.powerbot.script.Area;
import org.powerbot.script.Tile;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;

public enum MinesArea {
    VARROCK_WEST("Varrock West", new Tile(3179, 3369), new Tile(3187, 3439),
            new Tile[]{new Tile(3186, 3441, 0),
                    new Tile(3182, 3431, 0),
                    new Tile(3172, 3429, 0),
                    new Tile(3170, 3419, 0),
                    new Tile(3169, 3409, 0),
                    new Tile(3168, 3399, 0),
                    new Tile(3173, 3390, 0),
                    new Tile(3176, 3380, 0),
                    new Tile(3179, 3370, 0)},
            new Rocks[]{Rocks.COPPER, Rocks.TIN, Rocks.IRON, Rocks.SILVER}, new Area(
            new Tile(3181, 3381, 0),
            new Tile(3173, 3374, 0),
            new Tile(3165, 3368, 0),
            new Tile(3173, 3362, 0),
            new Tile(3183, 3363, 0),
            new Tile(3191, 3369, 0),
            new Tile(3189, 3379, 0),
            new Tile(3179, 3382, 0)
    )
    ),
    VARROCK_EAST("Varrock East", new Tile(3284, 3365), new Tile(3252, 3418),
            new Tile[]{new Tile(3253, 3421, 0),
                    new Tile(3259, 3429, 0),
                    new Tile(3269, 3430, 0),
                    new Tile(3279, 3429, 0),
                    new Tile(3288, 3424, 0),
                    new Tile(3291, 3414, 0),
                    new Tile(3292, 3404, 0),
                    new Tile(3291, 3394, 0),
                    new Tile(3294, 3384, 0),
                    new Tile(3291, 3374, 0),
                    new Tile(3285, 3366, 0)},
            new Rocks[]{Rocks.COPPER, Rocks.TIN, Rocks.IRON}, new Area(
            new Tile(3281, 3374, 0),
            new Tile(3275, 3366, 0),
            new Tile(3278, 3356, 0),
            new Tile(3288, 3354, 0),
            new Tile(3298, 3357, 0),
            new Tile(3294, 3367, 0),
            new Tile(3292, 3373, 0)
    )
    );

    private String name;
    private Tile location, bank;
    private Rocks[] ores;
    private Tile[] bankToLocation;
    private Area mineArea;

    MinesArea(String name, Tile location, Tile bank, Tile bankToLocation[], Rocks [] ores, Area mineArea){
        this.name = name;
        this.location = location;
        this.bank = bank;
        this.ores = ores;
        this.bankToLocation = bankToLocation;
        this.mineArea = mineArea;
    }


    public Area getMineArea(){
        return mineArea;
    }

    public Tile getLocation(){
        return location;
    }

    public Tile getBank(){
        return bank;
    }

    public String getName(){
        return name;
    }

    public Rocks [] getOres(){
        return ores;
    }

    public Tile [] getBankToLocation(){
        return bankToLocation;
    }


    public Tile[] getLocationToBank(){
        ArrayList<Tile> rev = new ArrayList<Tile>();
        rev.addAll(Arrays.asList(getBankToLocation()));
        Collections.reverse(rev);
        return rev.toArray(new Tile[rev.size()]);
    }



}
