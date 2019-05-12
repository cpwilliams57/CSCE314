
/**
 * Write a description of class Main here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
import java.util.Scanner; 
public class Main
{
    public static void main(String[] args){
        AnimalShelter shelter = new AnimalShelter();
        Scanner scan = new Scanner(System.in);
        System.out.println("WELCOME TO THE DOG HOUSE");
        showMenu();
        System.out.print("\nPlease select your option: ");
        int choice = scan.nextInt();
        
        while(choice != 0){
           if(choice == 1){
               //add new animal
               System.out.println("1 for Dog or 2 for Cat ?: ");
               int type = scan.nextInt();
               if(type == 1){
                   System.out.println("Enter Dog Name: ");
                   String tempName = scan.next();
                   Dog newDog = new Dog (tempName);
                   shelter.addAnimal(newDog);
 
               }
               else if(type == 2){
                   System.out.println("Enter Cat Name: ");
                   String tempName = scan.next();
                   Cat newCat = new Cat (tempName);
                   shelter.addAnimal(newCat);
               }
           } 
           if(choice == 2){
               shelter.adopt();
           } 
           if(choice == 3){
               shelter.adoptCat();
           } 
           if(choice == 4){
               shelter.adoptDog();
           } 
           if(choice == 5){
               shelter.remainingAnimals();
           } 
           if(choice == 6){
               shelter.remainingCats();
           } 
           if(choice == 7){
               shelter.remainingDogs();
           } 
           System.out.print("Please enter next Choice: ");
           choice = scan.nextInt();
        }
        System.out.println("THANKS FOR VISITING THE DOG POUND");
    }
      public static void showMenu(){
        System.out.println("1: Add new animal");
        System.out.println("2: Adopt an animal");
        System.out.println("3: Adopt a cat");
        System.out.println("4: Adopt a dog");
        System.out.println("5: Show anaimals in the shelter ");
        System.out.println("6: Show cats in the shelter");
        System.out.println("7: Show dogs in the shelter" );
        System.out.println("0: Exit");
    }
}
