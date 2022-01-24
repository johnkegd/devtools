
import java.util.*;

public class HashMaps {
    

    public static class B{
        public String b1;
        
        public B(String b1){
            b1 += " lol ";
            this.b1  = b1;
        }
    }
    //jugando con hash

    public static class A{
        public String a1;
        public A(String a1){
            a1 += " lol ";
            this.a1 = a1;
        }
    }

    public static void main(String[] args){


        Scanner sc = new Scanner(System.in);

        String response = sc.nextLine();
        /*byte[] arr = response.getBytes();

        for(int i= 0; i < arr.length;i++){
            System.out.println(arr[i]);
        } */
        String [] arr = response.split("\\s+");

        String replaced;
        for(int i =arr.length -1; i >= 0; i--){
            System.out.printf("na%s ",arr[i]);
        }

        //System.out.println(replaced);

        sc.close();

    }

}