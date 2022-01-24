public class MyClass {
    public static void main(String[ ] args) {
        Person j;
        Person k;
        j = new Person("John");
        j.setAge(20);
        celebrateBirthday(j);
        System.out.println(j.getAge());
        
        
        k = new Person("Kleider");
        k.setAge(27);
        celebrateBirthday(k);
        System.out.println(k.getName()+ " "+k.getAge());
  }
    
    static void celebrateBirthday(Person p) {
        p.setAge(p.getAge() + 1);
    }
}

 final class Person extends MyClass{
    private String name;
    private int age;
    
    Person (String n) {
        this.name = n;
    }
    
    public int getAge() {
        return age;
    }
    
    public void setAge(int a) {
        this.age = a;
    }
    
    public String getName(){
        return name;
    }
    public void setName(String name){
        this.name = name;
    }
}
    