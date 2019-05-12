
/**
 * Write a description of class AreaCalculator here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
public class AreaCalculator
{
    public static void calculator(Shape[] shapes){
        double areaSum = 0;
        for(Shape shape: shapes){
            double tempArea = shape.area();
            areaSum = areaSum + tempArea; 
        }
        System.out.println("Sum of shape areas: " + areaSum);
    }
}
