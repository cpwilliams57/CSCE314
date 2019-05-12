
/**
 * Write a description of class Triangle here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
public class Triangle extends Shape
{
    Point a;
    Point b;
    Point c;
    public Triangle(Point pointa, Point pointb, Point pointc){
        a = pointa;
        b = pointb;
        c = pointc; 
    }
    public double area(){
        int x1 = a.getX();
        int y1 = a.getY();
        int x2 = b.getX();
        int y2 = b.getY();
        int x3 = c.getX();
        int y3 = c.getY();
        double area = Math.abs(0.5*(x1*(y2-y1) + x2*(y3-y1) + x3*(y1-y2)));
        return area;
    }
    public Point position(){
        return a;
    }
     public boolean equals(Triangle tri){
        if(this.a == tri.a && this.b == tri.b && this.c == tri.c){
            return true;
        }
        return false;
    }
}
