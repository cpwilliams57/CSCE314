import java.util.*;

public class TimePrinter implements Runnable
{
	private Time counter;
	
	public TimePrinter(Time t)//constructor
	{
		counter = t;
		new Thread(this).start();
	}
	
	@Override
	public void run()
	{
		while(true)
		{
			try
			{
				counter.increment(counter);//increments the counter 
				Thread.sleep(1000);
			}
			catch(Exception e){}
		}
	}
}