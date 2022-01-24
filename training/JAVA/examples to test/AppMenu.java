import java.util.*;

public class AppMenu extends Main{

    private String Name;
    private String Apellido;
    private int Edad;
    private char Sexo;
    private boolean Especialidad;
    private int respose;


    public AppMenu(String Name, String Apellido, int Edad, char Sexo, boolean Especialidad){
        this.Name = Name;
        this.Apellido = Apellido;
        this.Edad = Edad;
        this.Sexo = Sexo;
        this.Especialidad = Especialidad;
    }

    public void Menu(){

        System.out.println("Bienvenido al Menu");
        System.out.println("Opciones Seleccionando con Numeros");
        System.out.println("1. Registro Usuarios");
        System.out.println("2. Nuevo Usuario");
        System.out.println("3. Borrar Usuario");
        System.out.println("0. SALIR");

        Scanner sc = new Scanner(System.in);

        try {
             respose = Integer.parseInt(sc.nextLine());
        } catch (Exception e) {
            //TODO: handle exception
            System.out.println("¡¡Opción Erronea.!!");
        }
        

        switch(respose){
            case 0:
                System.out.println("Ha finalizado el programa");
                System.exit(0);
            break;
            case 1:
                System.out.println("Bienvenido al Registro de Usuarios");
                System.out.println();
                System.out.println("1. Total Usuarios Actuales");
                System.out.println("2. Total Mujeres");
                System.out.println("3. Total Hombres");
                System.out.println("4. Especialistas");
                System.out.println("5. Menu Principal");
                System.out.println("0. SALIR");
            break;
            case 2:
                System.out.println("Nuevo Usuario");
            break;
            case 3:
                System.out.println("Borrar un Usuario");
            break;
            default:
            System.out.println("No existe está Opcion");
            break;
        }



    }


    class RegUsuarios{

        

    }




}