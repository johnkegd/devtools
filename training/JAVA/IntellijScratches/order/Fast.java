


import java.io.IOException;
import java.net.MalformedURLException;

import java.net.URISyntaxException;
import java.net.URL;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Comparator;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.Stream;


class Fast {


    public static void main(String[] args) throws IOException {
        System.out.print("enter text: ");

    }

    public static <K, V extends  Comparator<? super V>> Map<K,V> sortByValue(Map<K,V> map) {
        List<Map.Entry<K,V>> list = new ArrayList<>(map.entrySet());
//        list.sort(Map.Entry.comparingByValue());

        Map<K,V> result = new LinkedHashMap<>();
        for (Map.Entry<K,V> entry : list) {
            result.put(entry.getKey(),entry.getValue());
        }
        return result;
    }

    public static Map<String,String> mapSortByValue(Map<String,String> map) {

        return map.entrySet()
                .stream()
                .sorted(Map.Entry.comparingByValue())
                .collect(Collectors.toMap(Map.Entry::getKey, Map.Entry::getValue));
    }

    public static void toBin() {
        String v =  Integer.toString(439,2);
        System.out.println(v);
        int counter = 0;
        String [] re = v.split("0");
        List<String> list = Arrays.asList(re);
        String max = list.stream().max(Comparator.comparing(String::valueOf)).get();
        System.out.println(max);

    }

    public static String validLink(String link) {
        if(link == null || link.isEmpty() || !link.contains(".") || link.lastIndexOf(".") == 0) {
            return null;
        }
        try {
            URL url = new URL(link);
            return String.valueOf(url);
        } catch (MalformedURLException e){
            return "https://".concat(link);
        }
    }


    static void diagonal() {
        int [][] arr = {{11,2,4},{4,5,6},{10,8,-12}};
        List<List<Integer>> list = new ArrayList<>();
        int diagonalR = 0;
        int diagonalL = 0;
        int j = arr.length -1;
       for(int i = 0;i < arr.length;i++) {
           if(!(arr[i][i] < 0)) {
               diagonalR += arr[i][i];
           } else {
               diagonalR -= Math.abs(arr[i][i]);
           }
           if(!(arr[j][i] < 0)){
               diagonalL += arr[j][i];
           } else {
               diagonalL -= Math.abs(arr[j][i]);
           }
           j--;
       }
        System.out.println(diagonalR + " R");
        System.out.println(diagonalL + " L");

        System.out.println(diagonalL - diagonalR);


    }


    static void malUrl() throws MalformedURLException, URISyntaxException {
        String ui = "https://google.com";
        URL url = new URL(ui);
        System.out.println(url.toURI());
    }

    static void hackerRank() {
        String word = "welcometojava";
        String largest = "";
        String smallest = "";

        for(int i = 3 ; i <= word.length(); i++) {
            String current = word.substring(i - 3,i);
            System.out.println(current + " -- " + current.compareTo(largest));
            if (current.compareTo(largest) > 0) {
                largest = current;
            }
            if(current.compareTo(smallest) < 0) {
                smallest = current;
            }
        }
        System.out.println(smallest + " -- " + largest);

    }

    static void prinDateInfo(int year,int month, int day) {
        Calendar calendar = Calendar.getInstance();
        Date date = new GregorianCalendar(year,month-1,day).getTime();
        calendar.setTime(date);
        Locale loc = Locale.getDefault();
        SimpleDateFormat formatter = new SimpleDateFormat("EEEE",loc);
        System.out.println("Day: " + formatter.format(calendar.getTime().getTime()));
        System.out.println("Moth: " + calendar.getTime().getMonth());
        System.out.println("Year: " + formatter.format(calendar.getTime().getYear()));

    }

    static long javaCurrency() throws Exception {
        Locale[] locales = {Locale.SIMPLIFIED_CHINESE,Locale.FRANCE,Locale.US, new Locale("india","india")};
        double cantidad = 1000.100;

        for(Locale loc : locales) {
            NumberFormat formatter = NumberFormat.getCurrencyInstance(loc);
            if(loc.getDisplayCountry().equalsIgnoreCase("United States")) {
                System.out.println("US" + ": " + formatter.format(cantidad));
                continue;
            } else if(loc.getDisplayCountry().equalsIgnoreCase("india")) {
                DecimalFormatSymbols dfs = new DecimalFormatSymbols();
                dfs.setCurrencySymbol("Rs.");
                dfs.setGroupingSeparator('.');
                dfs.setMonetaryDecimalSeparator(',');
                ((DecimalFormat)formatter).setDecimalFormatSymbols(dfs);
                String indiaFormat = formatter.format(cantidad);
                System.out.println("India: " + indiaFormat.replace(" ",""));
                continue;
            }
            System.out.println(loc.getDisplayCountry() + ": " + formatter.format(cantidad));
        }
        throw new Exception("lol");

        //NumberFormat formatter = NumberFormat.getCurrencyInstance(loc);

     //   System.out.println(formatter.format(cantidad));

    }

    static void power(int n, int p) throws Exception{

        if(n <= 0 || p <= 0) {
            if(n == 0 && p == 0)
                throw new Exception("n and p should not be zero.");
            else if (!(n >=0) || !(p >=0))
                throw new Exception("n or p should not be negative.");
        }
        p = (int)Math.pow((double)n,(double)p);

        System.out.println(p);
    }

}

enum ErrorMessages{
    MISSING_REQUIRED_FIELD("Missing required field. please check documentation for required fields"),
    RECORD_ALREADY_EXIST("Record already exists"),
    INTERNAL_SERVER_ERROR("Internal server error"),
    NO_RECORD_FOUND("Record with the provided id is not found"),
    AUTHENTICATION_FAILED("Authentication failed"),
    COULD_NOT_UPDATE_RECORD("Could not update record"),
    COULD_NOT_DELETE_RECORD("Could not delete record"),
    EMAIL_ADDRESS_NOT_VERIFIED("Email address could not be verified");

    private String errorMessage;

    ErrorMessages(String errorMessage) {
        this.errorMessage = errorMessage;
    }

    public String getErrorMessage() {
        return errorMessage;
    }
}