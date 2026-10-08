package com.tap.Servlet;

import java.io.IOException;

import org.mindrot.jbcrypt.BCrypt;

import com.tap.DAOImpl.UserDAOImpl;
import com.tap.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
	        throws ServletException, IOException {

	    String name = req.getParameter("name");
	    String password = req.getParameter("password");

	    User user = UserDAOImpl.getUserByUsername(name);

	    if (user != null) {

	        System.out.println("Entered username: " + name);
	        System.out.println("Entered password: " + password);
	        System.out.println("DB username: " + user.getUserName());
	        System.out.println("DB password hash: " + user.getPassword());

	        boolean passwordMatches =
	                BCrypt.checkpw(password, user.getPassword());

	        System.out.println("Password matches: " + passwordMatches);

	        if (passwordMatches) {

	            HttpSession session = req.getSession();
	            session.setAttribute("loggedInUser", user);

	            resp.sendRedirect("Restaurant");

	        } else {

	            resp.sendRedirect("login.html?error=1");
	        }

	    } else {

	        resp.sendRedirect("login.html?error=1");
	    }
}
}