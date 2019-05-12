import java.lang.Class;
import java.lang.reflect.*;
import static java.lang.System.err;
import java.util.*;
import java.io.*;

public class Main3 //reflection
{
	
	public static void main(String[] args) 
	{
		A a = new A();
		displayMethodInfo(a);
    }
	
	static void displayMethodInfo(Object obj)//displays basic info about a class
	{
		Class c = obj.getClass();
		Method m[] = c.getDeclaredMethods();
		
		try 
		{
			for (int i = 0; i < m.length; i++)
			{
				//name
				System.out.print(m[i].getName() + "(");
				
				//name of class
				if(!(Modifier.isStatic(m[i].getModifiers())))
				{
					String s = m[i].getDeclaringClass().toString();
					String[] sList = s.split(" ");
	
					System.out.print(sList[1]);
				}
				
				//arguments
				Type[] typeList = m[i].getGenericParameterTypes();
				for(Type t : typeList)
				{
					System.out.print(", " + t.toString());
				}
				
				//type return
				System.out.println(") -> " + m[i].getGenericReturnType().toString());
			}
		}
		catch(Throwable e)
		{
			System.err.println(e);
		}
	}
	
}
