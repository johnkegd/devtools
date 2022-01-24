import java.util.*;
public class PigLatin{
    public static void main(String [] args){
        Scanner sc = new Scanner(System.in);
        String response = sc.nextLine(); 
        String [] base = response.split("\\s+");
     
        for(int i =0; i < base.length; i++){
            int siz = base[i].length() +1;
            char [] move = new char [siz];

            for(int j = 0 ; j < siz ; j++){
              if(j==0){
                    move[siz-1] = base[i].charAt(j);
                    continue;
                }
              else if(j != siz-1){
                move[j] = base[i].charAt(j);         
                }              
                System.out.print(move[j]);         
            }
            System.out.print("na"+" ");
        }
        sc.close();
    }
}