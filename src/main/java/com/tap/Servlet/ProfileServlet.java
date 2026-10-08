package com.tap.Servlet;

import java.io.IOException;
import java.util.List;

import com.tap.DAOImpl.OrderDAOImpl;
import com.tap.model.Order;
import com.tap.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/ProfileServlet")
public class ProfileServlet extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session =
                req.getSession(false);

        if (session == null ||
            session.getAttribute("loggedInUser") == null) {

            resp.sendRedirect("login.html");
            return;
        }

        User user =
                (User) session.getAttribute("loggedInUser");

        // Get logged-in user's ID
        int userId = user.getUserId();

        System.out.println(
                "Logged-in User ID: " + userId);

        // Get user's orders
        OrderDAOImpl orderDAO =
                new OrderDAOImpl();

        List<Order> orders =
                orderDAO.getOrdersByUserId(userId);

        System.out.println(
                "Orders found: " + orders.size());

        // Send data to Profile.jsp
        req.setAttribute("user", user);

        req.setAttribute("orders", orders);

        req.getRequestDispatcher("Profile.jsp")
           .forward(req, resp);
    }
}