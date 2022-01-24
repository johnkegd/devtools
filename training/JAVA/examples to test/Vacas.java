import java.util.*;

class Vacas {
    public static void main(String args[]) {
        final String target = getNum();
        System.out.println("COWS AND BULLS:");
        Scanner in = new Scanner(System.in);
        for (int i = 1; i <= 7; i++) {
            System.out.print(i+". ");
            String guess = in.next();
            int feedback = feedback(target, guess);
            System.out.println(guess+" - "+(feedback/10)+" bulls, "+(feedback%10)+" cows");
            if (feedback == 40) {System.out.println("CONGRATULATIONS! YOU WIN!"); return;}
        }
        System.out.println("You have run out of moves. The number was - "+target);
    }

    static String getNum() {
        ArrayList<String> possib = new ArrayList<String>();
        for (int a = 1; a <= 9; a++) { 
            for (int b = 1; b <= 9; b++) {
                if (b == a) continue;
                for (int c = 1; c <= 9; c++) {
                    if (c == b || c == a) continue;
                    for (int d = 1; d <= 9; d++) {
                        if (d == a || d == b || d == c) continue;
                        String cnt = ""+a+b+c+d;
                        possib.add(cnt);
                    }
                }
            }
        }
        String guess = possib.get((int)(Math.random() * possib.size()));
        return guess;
    }

    static int feedback(String ans,String guess) {
        int bulls = 0, cows = 0;
        for (int i = 0; i < guess.length(); i++) {
            int ind = ans.indexOf(guess.charAt(i));
            if (ind == i) bulls++;
            else if (ind >= 0) cows++;
        }
        return bulls * 10 + cows;
    }
}