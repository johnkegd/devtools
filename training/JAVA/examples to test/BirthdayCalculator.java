// Created by Johnkegd

import java.util.Scanner;
public class Program
{
    public static void main(String[] args) {
       Scanner input = new Scanner (System.in);
       
       System.out.print("Created by Johnkegd\n");
       
//birth year 1960
int byr = input.nextInt();
//birth month 01
int bmon = input.nextInt();
//current year 2019
int cyr = input.nextInt();
//current month 01
int cmon = input.nextInt();

int year = cyr - byr;
int age = year;
int mth = cmon - bmon; 

if ( cmon > bmon ) { 
            mth = cmon - bmon ; }
     else { mth = bmon - cmon ; }
if ( cmon < bmon ) { age = age - 1; }
       System.out.print("Your age is ");
       System.out.println(age);
       System.out.print("You were born in ");
       System.out.print(bmon);
       System.out.print(" ");
       System.out.println(byr);
       System.out.print("You are actually ");
       System.out.print(age);
       System.out.print(" years and ");
       System.out.print(mth);
       System.out.print(" months");
if ( cmon < bmon ) { System.out.print(" to go til your birthday"); }
    }
}