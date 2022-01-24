import java.util.*;

public class Palabras extends Main{
   
    public static void doResverse(){
        Scanner sc = new Scanner(System.in);
        System.out.println("Palabra: ");
        String input = sc.nextLine();
        String output= "";
    
        for(int i = input.length() -1; i >= 0; i--){
    
            output += input.charAt(i);

            
        }
        System.out.println(output);
    
    }

    public static double Salute(List<?extends Number> list){
       double s = 0.0;
       
       for(Number n: list){
           s += n.doubleValue();
           
       }

        return s;
    }


    public void message(){
        System.out.println("Parent");
    }


}