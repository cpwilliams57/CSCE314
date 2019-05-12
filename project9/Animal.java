
/**
 * Abstract class Animal - write a description of the class here
 * 
 * @author (your name here)
 * @version (version barcodeber or date here)
 */
public abstract class Animal
{
    String name;
    int barcode;
    String cry; 
    public Animal (String n){
        name = n; 
    }
     public Animal (String n, int b){
        name = n; 
        barcode = b;
    }
    public String getName(){
        return name;
    }
    public int getbarcode(){
        return barcode;
    }
    public String cry(){
        return cry;
    }
    public boolean isOlderThan(Animal other) {
		return barcode < other.barcode;
	}
}
