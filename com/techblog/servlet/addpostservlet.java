package com.techblog.servlet;

import jakarta.servlet.ServletContext;
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

import org.apache.jasper.tagplugins.jstl.core.Out;

import com.techblog.dao.post_dao;
import com.techblog.entities.post;
import com.techblog.entities.user;
import com.techblog.helper.ConnectionProvider;
import com.techblog.helper.helper;

@WebServlet("/addpostservlet")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2, // 2MB
    maxFileSize = 1024 * 1024 * 10, // 10MB
    maxRequestSize = 1024 * 1024 * 50 // 50MB
)
public class addpostservlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public addpostservlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Fetch form data
            int cid = Integer.parseInt(request.getParameter("cid"));
            String ptitle = request.getParameter("ptitle");
            String pcontent = request.getParameter("pcontent");
            String pcode = request.getParameter("pcode");
            Part part = request.getPart("ppic");

            // Ensure the user is logged in
            HttpSession session = request.getSession();
            user currentUser = (user) session.getAttribute("currentUser");

//            if (currentUser == null) {
//                response.getWriter().println("Error: User not logged in.");
//                return;
//            }
//
//            int userId = currentUser.getUser_ID();

            // Create post object
            post p = new post(ptitle, pcontent, pcode, part.getSubmittedFileName(), null, cid, user.getUser_ID());

            // Save post in the database
            post_dao dao = new post_dao(ConnectionProvider.getConnection());
            if (dao.savePost(p)) {

                String path = request.getServletContext().getRealPath("/") + "blogpics" + File.separator + part.getSubmittedFileName();
                helper.saveFile(part.getInputStream(), path);
                response.getWriter().println("done");
            } else {
                response.getWriter().println("error");
            }
        } catch (Exception e) {
            response.getWriter().println( e.getMessage());
            e.printStackTrace();
        }
    }
}
