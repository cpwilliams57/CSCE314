
/**
 * Write a description of class Rectangle here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
public class Rectangle extends Shape
{
    Point tl; //top left corner 
    Point br; // bottom right corner 
    public Rectangle(Point a, Point b){
        tl = a; 
        br = b;
    }
    public double area(){
        int topLeftx = tl.getX();
        int topLefty = tl.getX();
        int bottomRightx = br.getX();
        int bottomRighty = br.getY();
        int length = topLeftx - bottomRightx;
        int height = topLefty - bottomRighty;
        return length * height; //calculating height 
    }
    public Point position(){
        return tl;
    }
    public boolean equals(Rectangle rect){
        if(this.tl == rect.tl && this.br == rect.br){
            return true;
        }
        return false;
    }
}
