package com.data;

public enum Ores {

    COPPER(436), TIN(438), IRON(440), SILVER(442), COAL(453), MITHRIL(447), ADDY(449), GOLD(358);
    private int id;


    Ores(int id){
        this.id = id;
    }

    public int getId(){
        return id;
    }

}
