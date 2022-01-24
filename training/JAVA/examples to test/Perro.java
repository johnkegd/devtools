

public class Perro extends Animal{
    public Perro(){

        super();
        setName("Perro");
    }


    public void moverse(){
        System.out.println("El " + getName() + " Esta corriendo");
    }

}