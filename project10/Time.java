import java.util.*;
import java.util.concurrent.locks.*;

public class Time
{
	int timer;
	
	private Condition divisible;
	private Lock msgLock;
	
	public Time()//constructor
	{
		msgLock = new ReentrantLock();
		divisible = msgLock.newCondition();
		timer = 0;
	}
	
	public int increment(Time t)//increments and displays the incremented time
	{
		t.msgLock.lock();
		
		try
		{
			timer++;
			divisible.signalAll();
			return timer;
		}
		finally
		{
			t.msgLock.unlock();
			System.out.print(timer + " ");//prints second it is at
		}
	}
	
	public void checkCondition(Time t, int interval)
	{
		t.msgLock.lock();
		
		try
		{
			while((t.timer%interval) != 0)
			{
				divisible.await();
			}
			if((t.timer%interval) == 0)
			{
				System.out.println();
				System.out.println(interval + " second messages");
			}
		}
		catch(InterruptedException e)
		{
			System.out.println(" ");
		}
		finally
		{
			t.msgLock.unlock();
			
		}
	}
	
}

