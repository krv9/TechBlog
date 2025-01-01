package com.techblog.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.util.regex.Pattern;

import com.techblog.dao.user_dao;
import com.techblog.entities.user;
import com.techblog.helper.ConnectionProvider;

/**
 * Servlet implementation class SignupServlet
 */
@WebServlet("/signupservlet")
@MultipartConfig
public class signupservlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public signupservlet() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Fetch form data
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String about = request.getParameter("about");
        String gender = request.getParameter("gender");
        String check = request.getParameter("check");

        // Log input data for debugging
        System.out.println("Name: " + name);
        System.out.println("Email: " + email);
        System.out.println("Password: " + password);
        System.out.println("Gender: " + gender);
        System.out.println("About: " + about);
        System.out.println("Checkbox: " + check);

        // Email validation with proper regex pattern
        String emailPattern = "^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,7}$";
        if (!Pattern.matches(emailPattern, email)) {
            response.getWriter().println("Invalid email format. Please try again.");
            return; // Stop execution if email is invalid
        }

        // Check if checkbox (terms and conditions) is checked
        if (check == null) {
            response.getWriter().println("You must accept the terms and conditions.");
            return; // Stop execution if checkbox is not checked
        }

        Connection con = null; // Initialize the connection variable

        try {
            // Create a new database connection for each signup
            con = ConnectionProvider.getConnection();
            
            // Create a User object with the form data
            user user = new user(name, email, gender, password, about);

            // Create UserDao object and attempt to save the user
            user_dao dao = new com.techblog.dao.user_dao(con);
            boolean success = dao.SaveUser(user);

            // Send response to client based on the outcome
            if (success) {
                // Redirect to avoid form resubmission (PRG pattern)
                response.sendRedirect("signup_success.jsp"); // You can create this page to display success
            } else {
                response.getWriter().println("Error in registering user.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error in processing request.");
        } finally {
            if (con != null) {
                try {
                    con.close(); // Always close the connection after the operation
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }
}
