
/**
 * Write a description of class Dog here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
public class Dog extends Animal
{
    String cry = "bark";
    public Dog(String n){
        super(n);
    }
     public Dog(String n, int b){
        super(n,b);
    }
    public String cry(){
        return cry; 
    }
}
