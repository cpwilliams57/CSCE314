
/**
 * Write a description of class Tester here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
public class Tester
{
    public static void main(String[] args){
        
      
        Point a = new Point(0,0);
        Point b = new Point(5,3);
        Point c = new Point(3,4); 
        
        Rectangle rect = new Rectangle(a,b);
        Rectangle rect2 = new Rectangle(a,b);
        
        Circle circ = new Circle(a,5);
        Circle lil = new Circle (a,4);
        Triangle tri = new Triangle(a,b,c);
        Triangle tri2 = new Triangle(a,b,c);
        
        System.out.println(tri.area());
        System.out.println(rect.area());
        System.out.println(circ.area());
        
        Shape[] shapes = new Shape[3];
        shapes[0] = tri;
        shapes[1] = circ;
        shapes[2] = rect;
        
        AreaCalculator calc = new AreaCalculator();
        calc.calculator(shapes);
        System.out.println(circ.equals(lil));
        System.out.println(tri.equals(tri2));
        System.out.println(rect.equals(rect2));
    }
    public static void sort(){
    }
}
