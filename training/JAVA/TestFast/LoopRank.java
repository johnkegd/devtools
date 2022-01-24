import java.util.*;
import java.io.*;

/*
1. Detectar n series
2. Hacer n seies (a + ?^2 *b)

1*3+2*3+4*3+8*3

*/
class LoopRank{
    public static void main(String []argh){

        int n = 5;
        int a = 5, b =3;
        for(int i = 0; i < n; i++){           
           a+= (int)Math.pow(2,i) * b;
            System.out.print(a + " ");
            System.out.println(Math.pow(2,i)); // 2 x 0; 2 x 1; 2 x 2; 2 x 3; 2 x 4
        }
        System.out.println(); 
    }


}