package beans;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

public class Tools {
	public static boolean isInt(String s)
	{
	 try
	  { 
		 Integer.parseInt(s); 
		 return true; 
	   }
	 catch(NumberFormatException er)
	  { return false; }
	}
	public static boolean isEmpty(String s)
	{
		String l=s.trim();
			return l.isEmpty();
	}
	
	public static int year(String s)
	{   int i;
		String z = "";
		for( i=0;s.charAt(i)!='-' && s.charAt(i)!='/';i++)
			z+=s.charAt(i);
		if(i>2)
			return Integer.parseInt(z);
		else
		{
			z="";
			for(i=s.length()-1;s.charAt(i)!='-' && s.charAt(i)!='/';i--);
			i++;
			for(;i<s.length();i++)
				z+=s.charAt(i);
			return Integer.parseInt(z);
		}
	}
	public static int month(String s)
	{
		int i;
		String z = "";
		for( i=0;s.charAt(i)!='-' && s.charAt(i)!='/';i++);
		for(i++;s.charAt(i)!='-' && s.charAt(i)!='/';i++)
			z+=s.charAt(i);
		return Integer.parseInt(z);
	}
	public static int day(String s)
	{   int i;
		String z = "";
		for( i=0;s.charAt(i)!='-' && s.charAt(i)!='/';i++)
			z+=s.charAt(i);
		if(i>2)
		{
			z="";
		    for(i++;s.charAt(i)!='-' && s.charAt(i)!='/';i++);
		    for(i++;i<s.length();i++)
				z+=s.charAt(i);
		    return Integer.parseInt(z);
		}
		else
		{
			return Integer.parseInt(z);
		}
		
	}
	public static boolean validTrajetDate(String s) throws ParseException
	{
		    DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");  
		   LocalDateTime now = LocalDateTime.now();    
		   if(year(dtf.format(now))<year(s))
		   {

			   return true;
		   }
		   if (year(dtf.format(now))==year(s))
		    {
		        if(month(dtf.format(now))<month(s))
		            return true;
  
		        if(month(dtf.format(now))==month(s))
		            if(day(dtf.format(now))<day(s))
		            	return true;
		    }
		return false;
	      
	}
}
