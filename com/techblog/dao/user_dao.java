package com.techblog.dao;
import java.sql.*;
import com.techblog.entities.user;

public class user_dao {

	private Connection con;

	public user_dao(Connection con) {
		this.con = con;
	}
	
	public boolean SaveUser(user user) {
	    boolean status = false;
	    PreparedStatement pstmt = null;

	    try {
	        // Check connection status
	        Connection con = this.con;
	        if (con == null) {
	            System.out.println("Connection is null. Failed to establish a connection.");
	            return false;
	        }

	        // If the connection is valid, create the PreparedStatement
	        String query = "INSERT INTO user(name, email, gender, password, about) VALUES (?, ?, ?, ?, ?)";
	        pstmt = con.prepareStatement(query);
	        pstmt.setString(1, user.getName());
	        pstmt.setString(2, user.getEmail());
	        pstmt.setString(3, user.getGender());
	        pstmt.setString(4, user.getPassword());
	        pstmt.setString(5, user.getAbout());

	        // Execute the query
	        int result = pstmt.executeUpdate();
	        if (result > 0) {
	            status = true;
	        }
	    } catch (Exception e) {
	        System.out.println("Error in registering user: " + e.getMessage());
	        e.printStackTrace(); // Print the exact error
	    } finally {
	        try {
	            if (pstmt != null) pstmt.close();
	            if (con != null) con.close(); // Close the connection
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	    return status;
	}
	
	//get user email &password
	
	public user getuseremailandpassword(String email,String password) {
		user user=null;
		
		try {
			
			String qry="select * from user where email=? and password=? ";
			PreparedStatement ps=con.prepareStatement(qry);
			ps.setString(1, email);
			ps.setString(2, password);

			ResultSet set=ps.executeQuery();
			
			if(set.next()) {
				user=new user();
				String name=set.getString("name");
				user.setName(name);
				user.setUser_ID(set.getInt("id"));
				user.setEmail(set.getString("email"));
				user.setPassword(set.getString("password"));
				user.setGender(set.getString("gender"));
				user.setAbout(set.getString("about"));
				user.setDate(set.getTimestamp("date"));
				user.setProfile(set.getString("profile"));
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		return user;
	}
	
	public boolean userupdate(user user) {
	    boolean updated = false;
	    try {
	        String query = "UPDATE user SET name=?, email=?, password=?, about=?, profile=? WHERE id=?";
	        PreparedStatement pstmt = this.con.prepareStatement(query);
	        
	        // Set parameters
	        pstmt.setString(1, user.getName());
	        pstmt.setString(2, user.getEmail());
	        pstmt.setString(3, user.getPassword());
	        pstmt.setString(4, user.getAbout());
	        pstmt.setString(5, user.getProfile());
	        pstmt.setInt(6, user.getUser_ID());  // Ensure you are updating the correct user based on ID

	        // Execute the update
	        int rowsAffected = pstmt.executeUpdate();
	        
	        // If rowsAffected > 0, the update was successful
	        if (rowsAffected > 0) {
	            updated = true;
	        }
	        
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return updated;
	}

	
}
