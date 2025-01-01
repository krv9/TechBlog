package com.techblog.helper;
import java.sql.*;
public class ConnectionProvider {
 public static Connection con;
 public static Connection getConnection() {
	
	 try {
		if(con == null) {
			 //driver class loaded
			 Class.forName("com.mysql.cj.jdbc.Driver");
			 
			 //create connection
			 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog","root","123456");
			 if (con != null ) {
				    System.out.println("Connection successful!");
				} else {
				    System.out.println("Connection failed.");
				}
		}
	 }
	 catch(Exception e) {
		 e.printStackTrace();
	 }
	 
	 
	 
	 
	 return con;
 }
}
