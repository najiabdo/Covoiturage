package beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class SqlData {
	private static String nomDB="covoiturage";
    private static String url="jdbc:mysql://localhost:3306/"+nomDB;
    private static String jdbc="com.mysql.cj.jdbc.Driver";
    private static String login="root";
    private static String mdp="";
    private static Connection connection=null;
    private static Statement statement=null;
    
    public static void connection()
	{
		try {
			Class.forName(jdbc);		
		} catch (ClassNotFoundException e) {
                System.out.println("Probleme At ForName");
                e.printStackTrace();
                
		}
			try {
				connection=DriverManager.getConnection(url,login,mdp);
			} catch (SQLException e1) {
				System.out.println("Probleme At Connection");
				e1.printStackTrace();
			}

		try {
			statement=connection.createStatement();
		} catch (SQLException e) {
			System.out.println("Probleme At Statement");
			e.printStackTrace();
		}
	}
	public static void disconection()
	{
		try {
			connection.close();
		} catch (SQLException e) {
			System.out.println("Probleme Pendant La Fermeture");
			e.printStackTrace();
		}
	}
	public static int miseAJour(String sql) 
	{
		int a = 0;
		try {
			 a=statement.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return a;
	}
	public static int miseAJourWithException(String sql) throws SQLException 
	{
		int a = 0;
			 a=statement.executeUpdate(sql);
		return a;
	}
	
	public static ResultSet selectQuery(String sql)
	{
		ResultSet rs=null;
		try {
			rs=statement.executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
	
}
