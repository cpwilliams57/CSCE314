import java.util.*;

public class MessagePrinter implements Runnable
{
	private int sec = 0;//seconds passed
	Time timer = new Time();//timer
	
	public MessagePrinter(Time t, int time)//constructor
	{
		timer = t;
		sec = time;
		new Thread(this).start();
	}
	
	@Override
	public void run()
	{
		while(true)
		{
			try
			{
				Thread.sleep(1000);//every second
				timer.checkCondition(timer, sec);//checks its condition
			}
			catch(Exception e)
			{
				
			}
		}
	}
}
