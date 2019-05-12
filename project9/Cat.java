
/**
 * Write a description of class Cat here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
public class Cat extends Animal
{
    String cry = "meow";
    public Cat(String n){
        super(n);
    }
    public Cat(String n, int b){
        super(n,b);
    }
    public String cry(){
        return cry; 
    }
}
