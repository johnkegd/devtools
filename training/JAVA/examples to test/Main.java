import java.util.*;




public class Main{

//constructor
public Main(){}

    public static void main(String [] arg){
        Scanner sc = new Scanner(System.in);
        System.out.println("Running the Code");
        System.out.println();
        
        ArrayList<Integer> list = new ArrayList<Integer>();
        for(int i=0; i<6; i++){
            list.add(i);
        }
        int x =0;
        Iterator<Integer> it = list.iterator();
        while(it.hasNext()){
            x += it.next();
        }
        System.out.println(x);s

        int f = 1, j=2;
        while(++j<5)
            f*=j;
            System.out.println(f);
        

       
       

        //updonw objet or casting
       /*
        A object = new B();
        A b = (A) object;
        b.print();
        */
      //  object.print();


        // prueba de abstracción con clases abstractas
        /*
        Animal perro1 = new Perro();
        perro1.moverse();
        Animal ave1 = new Ave();
        ave1.moverse();
        */



        //ejemplo especial para practicar
       /* 
       int result = 0;
        for (int i = 0; i < 5; i++) {
        if (i == 3) { 
        result += 10;
        } else {
        result += i;
        }	
        }
        System.out.println(result);
        */


        //ANOTHER ARRAY EXAMPLE
        /*
        int arr[ ] = new int[3];
        for (int i = 0; i < 3; i++) {
        arr[i] = i;
        System.out.println(i);
        } 
        int res = arr[0] + arr[2];
        System.out.println(res);
        */



        // arrays examples
        /*
        int[ ][ ] myArr = { {1, 2, 3}, {4}, {5, 6, 7} };
        myArr[0][2] = 42;
        int x = myArr[2][0]; // 4
        System.out.println(x);
        */

       
       //for each example
       /*
        int [] array = {10,20,30,50,60,90};
       int total=0;
        for(int t: array){
           
            total += t;
            
            System.out.printf("%d \t %d \n",t,total);
            
        }
        */


        //Calculator c1 = new Calculator();
        //c1.Start();


        /*
        AppMenu m1 = new AppMenu("John", "Garcia", 25,'H',true);

        m1.Menu();
            */

            //Palabras.doResverse();
           // Palabras.Salute();


           // 1- llamando lista de clase hija Palabras metodo Salute()
          /* List<Integer> item = Arrays.asList(1,2);
           System.out.println(Palabras.Salute(item));*/

        // 2- llamando metodo de hijo en instancia padre
        /*
           Palabras p1 = new Child();
           p1.message();*/

        // 3- metodo substring para controlar salida de cadena, importante el metodo String.lenght() para mapear la cadena
           /*System.out.print("ABCD".substring(2,4));*/

     
        // 4-  moviendo items entre constructor de clase
           /*A a = new A("1");

            A c = a;
            a.a1 = new String("3");
            System.out.print(a.a1);
            System.out.print(c.a1);*/
            
           


    }

/*
    static int num1=0, num2=0,num3=0;
   

    public static void nono(){
    Scanner sc = new Scanner(System.in);
    System.out.println("Numero: ");
    num1 = Integer.parseInt(sc.nextLine());
    int cifra =0;

    while(num1 !=0){
        num1 = num1 /10;
        cifra++;
    }
    System.out.println("numero de caracteres: " + cifra);
    */

    public static int myFunc(int x){
        return x*3;
    }





}
