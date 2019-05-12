
/**
 * Write a description of class AnimalShelter here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */

import java.util.ArrayDeque;
public class AnimalShelter
{
    ArrayDeque<Animal> all = new ArrayDeque<>();
    ArrayDeque<Dog> dogs = new ArrayDeque<>();
    ArrayDeque<Cat> cats = new ArrayDeque<>();
    int barcode = 1; 
    public AnimalShelter(){
    }
    
    //adds animal to all animals array and to the according cats or dogs que
    public void addAnimal(Animal animal){
        all.add(animal);
        animal.barcode = barcode++;
        if (animal instanceof Cat) {
            cats.add((Cat) animal);
        } else if (animal instanceof Dog) {
            dogs.add((Dog) animal);
        }
        System.out.println(animal.getName() + " has been added \n"); 
    }
    
    public void adopt(){
        Animal temp; 
        if (dogs.isEmpty()) {
			temp = cats.remove();
			System.out.println("Animal " + temp.getName() + " has been adopted\n");
		}
		if (cats.isEmpty()) {
		    temp = dogs.remove();
		    System.out.println("Animal " + temp.getName() + " has been adopted\n");
		}
		if (dogs.peek().isOlderThan(cats.peek())) {
			temp = dogs.remove();
			System.out.println("Animal " + temp.getName() + " has been adopted\n");
		} else {
			temp = cats.remove();
			System.out.println("Animal " + temp.getName() + " has been adopted\n");
		}
    }
    
    public void adoptCat(){
        Cat adoptedCat = cats.remove();
        System.out.println("Cat " + adoptedCat.getName() + " has been adopted\n");
    }
    
    public void adoptDog(){
        Dog adoptedDog = dogs.remove(); 
        System.out.println("Dog " + adoptedDog.getName() + " has been adopted\n");
    }
    
    public void remainingAnimals(){
        System.out.print("\nRemaining animals in Shelter: \n");
        for (Dog dog : dogs) {
            System.out.print(dog.getbarcode() + " " + dog.getName() + " " + dog.cry() + "\n") ;
        }
         for (Cat cat : cats) {
            System.out.print(cat.getbarcode() + " " + cat.getName() + " " + cat.cry() + "\n") ;
        }
        System.out.println();
    }
    
     public void remainingDogs(){
        System.out.print("\nRemaining Dogs in Shelter: \n");
        for (Dog dog : dogs) {
            System.out.print(dog.getbarcode() + " " + dog.getName() + " " + dog.cry() + "\n") ;
        }
        System.out.println();
    }
    
     public void remainingCats(){
        System.out.print("\nRemaining Cats in Shelter:\n");
        for (Cat cat : cats) {
            System.out.print(cat.getbarcode() + " " + cat.getName() + " " + cat.cry() + "\n") ;
        }
        System.out.println();
    }
}
