import java.io.*;
import java.util.*;

public class Solution {

    public static void main(String[] args) {
        /* Enter your code here. Read input from STDIN. Print output to STDOUT. Your class should be named Solution. */

        Scanner sc = new Scanner(System.in);
        int t = Integer.parseInt(sc.nextLine());
        String [] array = new String [t];
        //System.out.println(array[0]);
        for(int i = 0; i < t;i++){
            array[i] = sc.nextLine();

            for(int j =0; j < array[i].length();j++){
                if(j % 2 ==0){
                    System.out.print(array[i].charAt(j));
                }
                
            }
            
            System.out.print(" ");

            for(int x =0; x < array[i].length();x++){
                if(x % 2 != 0){
                    System.out.print(array[i].charAt(x));
                }
            }

            System.out.println();
        }

        

            
            


    }
}