

public abstract class Animal extends Main implements interface_Animal{
    private String name;
    public Animal(){

    }

    public abstract void moverse();

    public void setName(String name){
        this.name = name;
    }
    public String getName(){
        return name;
    }



}