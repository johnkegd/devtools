
public class Rare {
  public static void main(String[] args) {
    String test = "0000";
    double number = 5.2, resultNumber;
    boolean flag = false;
    boolean lol = false;
    
    System.out.println("+number = " + +number);
    // number is equal to 5.2 here.
    
    System.out.println("-number = " + -number);
    // number is equal to 5.2 here.
    
    // ++number is equivalent to number = number + 1
    System.out.println("number = " + ++number);
    // number is equal to 6.2 here.
    
    // -- number is equivalent to number = number - 1
    System.out.println("number = " + --number);
    // number is equal to 5.2 here.
    
    System.out.println("!flag = " + !flag);
    // flag is still false.
    lol = test instanceof String;
    System.out.println("boolean date" + lol);
    
    // Bitwise and Bit Shift Operators
    
    //bitwise and  & a bit must be 1 to pass
    int number1 = 12, number2 = 25, result;
        
        result = number1 & number2;
      System.out.println(result);
    
    //bitwise | both bits must be 1 to pass
        
        result = number1 | number2;
      System.out.println(result);
      
    //Bitwise Complement ~ // change every 1 to 0 and every 0 to 1 pattern
    
     int numberx = 35; 
        
        result = ~ numberx; // this return -36 every time 1 minus
        System.out.println(result);
    
    // Bitwise XOR ^ // If corresponding bits are different, it gives 1. If corresponding bits are same, it gives 0
    
        result = number1 ^ number2;
        System.out.println(result);

    // Signed Left Shift << //  shifts a bit pattern to the left by certain number of specified bits, and zero bits are shifted into the low-order positions.

    int numberj = 212;
    	
    System.out.println(numberj << 1); // 424
    System.out.println(numberj << 0); // 212
    System.out.println(numberj << 4); // 3392

    // Signed Right Shift >> //  shifts a bit pattern to the right by certain number of specified bits.

      System.out.println(numberj >> 1); // 106
    	System.out.println(numberj >> 0); // 212
      System.out.println(numberj >> 8); // 0
      
    // Unsigned Right Shift >>>  //  shifts zero into the leftmost position.

    int numberk = 5, numberg = -5;

    System.out.println(numberk >> 1); // 2
    	
    
    System.out.println(numberk >>> 1); // 2
    
    
    System.out.println(numberg >> 1); // -3
    
  
    System.out.println(numberg >>> 1); //2147483645

  }
}

