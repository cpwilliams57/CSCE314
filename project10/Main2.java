
import java.util.Timer;
import java.util.TimerTask;

public class Main2
{
	public static void main(String[] args) 
	{
		Time count = new Time();

		TimePrinter timer = new TimePrinter(count);
		
		MessagePrinter msg7 = new MessagePrinter(count, 7);//7 secont timer
		MessagePrinter msg15 = new MessagePrinter(count, 15);//15 secont timer
		
		
    }
	
}