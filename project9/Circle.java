
/**
 * Write a description of class Circle here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
public class Circle extends Shape
{
    Point c;
    int r;
    public Circle(Point center, int radius){
        c = center;
        r = radius;
    }
     public double area(){
         return 3.14*r*r;
    }
    public Point position(){
        return c;
    }
    public boolean equals(Circle circ){
        if(this.c == circ.c && this.r == circ.r){
            return true;
        }
        return false;
    }
}
