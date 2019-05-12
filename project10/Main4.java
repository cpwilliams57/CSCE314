
import java.lang.Class;
import java.lang.reflect.*;
import static java.lang.System.err;
import java.util.*;
import java.io.*;

public class Main4//More reflection, command line arguments and automated testing
{
	public static void main(String[] args) 
	{
		String className = args[0];
		
		Class cls = null;
		try
		{
			cls = Class.forName(className);
		}
		catch(ClassNotFoundException e)
		{
			
		}
		
		Method methodList[] = cls.getDeclaredMethods();
		
		for(Method m : methodList)
		{
			if(isBooltest(m) == true)
			{
				Object obj = null;
				try
				{
					obj = m.invoke(null);
				}
				catch(Exception e)
				{
					
				}
				
				if((boolean) obj)
				{
					System.out.println("OK : " + m.getName() + " succeeded");
				}
				else
				{
					System.out.println("FAILED : " + m.getName() + " failed");
				}
			}
		}
	}

	
	static boolean isBooltest(Method m)
	{
		
		try 
		{
			Type[] typeList = m.getGenericParameterTypes();
			
			if(Modifier.isPublic(m.getModifiers())&& Modifier.isStatic(m.getModifiers()))
			{
				if( m.getGenericParameterTypes().length == 0)
				{
					if((m.getGenericReturnType().toString()).equals("boolean"))
					{
						if((m.getName()).startsWith("test"))
						{
							return true;
						}
					}
				}
			}
		}
		catch(Throwable e)
		{
			System.err.println(e);
		}
		return false;
	}
}

class MyClass
{
	public boolean test1()
	{
		return true;
	}
	public static boolean test2()
	{
		return true;
	}
	static boolean test3()
	{
		return false;
	}
	
}