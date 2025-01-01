package com.techblog.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;

import com.techblog.dao.user_dao;
import com.techblog.entities.Message;
import com.techblog.entities.user;
import com.techblog.helper.ConnectionProvider;
import com.techblog.helper.helper;

/**
 * Servlet implementation class Editservlet
 */
@WebServlet("/Editservlet")
@MultipartConfig
public class Editservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Editservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Get user parameters from the request
		String username = request.getParameter("user-name");
		String useremail = request.getParameter("user-email");
		String userpassword = request.getParameter("user-password");
		String userabout = request.getParameter("user-about");
		Part part = request.getPart("img");
		String imagename = part.getSubmittedFileName();

		// Get user from session
		HttpSession s = request.getSession();
		user currentUser = (user) s.getAttribute("currentUser");  // Retrieve the 'currentUser' from session

		// Check if 'currentUser' is null before proceeding
		if (currentUser != null) {
		    // Update user details
		    currentUser.setName(username);
		    currentUser.setEmail(useremail);
		    currentUser.setAbout(userabout);
		    currentUser.setPassword(userpassword);
		    String oldfile=user.getProfile();
		    currentUser.setProfile(imagename);
		    
		    // Update database
		    user_dao dao = new user_dao(ConnectionProvider.getConnection());
		    boolean ans = dao.userupdate(currentUser);  // Pass the updated user object to DAO

		    if (ans) {
		    	
		    	String path=request.getServletContext().getRealPath("/")+"pics"+File.separator+user.getProfile();
		    	
		    	//delete file code
		    	String oldpath=request.getServletContext().getRealPath("/")+"pics"+File.separator+oldfile;

		    	if(!oldfile.equals("default.png")) {
			    	helper.deleteFile(oldpath);

		    	}
		    	
		    		if(helper.saveFile(part.getInputStream(), path)) {
				    	response.getWriter().println("Profile updated!!!!!");
				    	 Message msg = new Message("Profile details updated!!!!!", "success", "alert-success");
						    s.setAttribute("msg", msg);
		    		}
		    		else {
		    			Message msg = new Message("Not updated properly", "danger", "alert-danger");
					    s.setAttribute("msg", msg);
		    		}
		    		
		    	
		    	// Optionally, you can set a success message and redirect
		        
		    } else {
		    	response.getWriter().println("user no updated");
		    	Message msg = new Message("Not updated properly", "danger", "alert-danger");
			    s.setAttribute("msg", msg);
		    	
		    }
		    response.sendRedirect("profile.jsp");
		} else {
		    // If user is null, redirect to login page
		    System.out.println("No user in session, redirecting to login");
		    response.sendRedirect("login_page.jsp");
		}

		
	}

}
