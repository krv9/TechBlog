package com.techblog.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.techblog.dao.user_dao;
import com.techblog.entities.Message;
import com.techblog.entities.user;
import com.techblog.helper.ConnectionProvider;

/**
 * Servlet implementation class loginservlet
 */
@WebServlet("/loginservlet")
public class loginservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginservlet() {
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
		//fetch from data
				String userEmail=request.getParameter("email");
				String userPassword=request.getParameter("password");
				
				user_dao dao=new user_dao(ConnectionProvider.getConnection());
				
				// Get the user based on email and password
				user u = dao.getuseremailandpassword(userEmail, userPassword);

				if (u == null) {
				    // If user is not found, set a message and redirect back to login page
				    Message msg = new Message("Invalid Credentials", "error", "alert-danger");
				    HttpSession s = request.getSession();
				    s.setAttribute("msg", msg);
				    
				    // Redirect to login page or wherever the login form is located (e.g., login_page.jsp)
				    response.sendRedirect("login_page.jsp");
				} else {
				    // If the user is found, set the current user and redirect to profile page
				    HttpSession s = request.getSession();
				    s.setAttribute("currentUser", u);
				    
				    // Redirect to profile page
				    response.sendRedirect("profile.jsp");
				}

				
			}		
}


