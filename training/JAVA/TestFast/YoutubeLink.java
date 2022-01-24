import java.util.*;
public class YoutubeLink{

    /* 
    1.leer str con url
    2.detectar si es short o long
    3.imprimir final de cada url
    
    */                   
 static String urlLong = "https://youtu.be/jPP932x8-MY";
 static String urlShort = "https://youtu.be/jPP932x8-MY";

    public static String shortLink(String x){

        if(x.charAt(16) == '/'){
            x = x.substring(17);
        }else{
            x = null;
        }

        return x;
    }

    public static String longLink(String x){

        if(x.charAt(31) == '='){
            x = x.substring(32);
        }else{
            x = null;
        }

        return x;
    }



    public static void  main(String [] args){
       if(shortLink(urlLong) != null){
        System.out.println(shortLink(urlLong) + " short");
       }
       else if(longLink(urlLong) != null){
        System.out.println(longLink(urlLong) + " long");
       }
       
    }



}