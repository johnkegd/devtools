//Johnkegd:)
import java.net.*;
import java.io.*;
import java.util.*;

public class Live_Score {
public static void main(String[] args) throws Exception{
     try{
     //URL web= new URL("https://www.cricbuzz.com/cricket-match/live-scores"); 
     URL url=null , web1=new URL("http://www.carenadosgp.com");
    HttpURLConnection conn = (HttpURLConnection)web1.openConnection();
    conn.connect(); 
    BufferedReader in = new BufferedReader(new InputStreamReader(web1.openStream()));
        String input,str ,links[]=new String[60];
        outerloop:
        while((input = in.readLine()) != null)
        {str=input.split("<a class=\"cb-lv-scrs-well cb-lv-scrs-well-live\" href=\"")[1].split("\"")[0];    
        url= new URL("https://www.carenadosgp.com"+input.split("<a class=\"cb-lv-scrs-well cb-lv-scrs-well-live\" href=\"")[1].split("\"")[0]); 
        in.close();
        conn.disconnect();
        conn = (HttpURLConnection)url.openConnection();
        conn.connect();
        in=new BufferedReader(new InputStreamReader(url.openStream()));
        while((input = in.readLine()) != null)
            System.out.println(input+"\n"+i++);
         if(input.contains("<span class=\"cb-font-20 text-bold\"> ")){
             { links=input.split("<span class",38);
                for(int j=0;j<links.length;j++){
                    if(links[j].contains("=\"cb-font-20 text-bold\"> "))
                    { System.out.println(links[j].substring(25).replaceAll(" </span> ","")+"\n"+j);
                    break outerloop;
                    }
                }
                 System.out.println(input.split("<span class",38)[6].substring(25).replaceAll(" </span> ", "")); 
             }
          if(input.contains("<title>"))
          { System.out.println(input.replaceAll("<title>","").replaceAll("</title>",""));
          break outerloop;
         }
             }   
            System.out.println("Powered by Johnkegd");
     }
     catch (IOException e) {   
            System.out.println("Internet Connection error");
        }
      catch (Exception e) { 
            System.out.println(e);
        }
 }   
}
