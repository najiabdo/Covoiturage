package beans;

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
}
