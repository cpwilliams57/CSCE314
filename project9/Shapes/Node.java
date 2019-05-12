
/**
 * Write a description of class Node here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
public class Node <T extends Shape>
{
    public final T v;
    public Node<T> next;
    public Node (T val, Node<T> link) { 
        v = val; next = link; 
    }
}
