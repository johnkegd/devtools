import java.io.IOException;
import java.util.*;
/*
1.Detectar cadena string
2.dividir cadena por palabras
3. detectar numeros
4. cambiar numeros 10-0 enteros por string
*/ 

public class NumberDectector{

//static String str = "2 panes para 5 personas";
static String [] num = {"cero","one","two","three","four","five","six","seven","eigth","nine","zehn"};


public static void esNumber(String str){
    String [] arr = str.split("\\s+");

   int i = 0;
   for(int j =0; j < arr.length; j++){
       try{
        i = Integer.parseInt(arr[j]);
        arr[j] = num[i];
       }catch(Exception e){
        System.err.println("no es numero.");
       }
       System.out.print(arr[j] + " ");
   }

  
}


public static void main(String [] args){
    Scanner sc = new Scanner(System.in);
    String str = sc.nextLine();


    esNumber(str);
    sc.close();

}
    
}