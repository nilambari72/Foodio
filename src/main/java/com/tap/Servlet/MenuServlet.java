package com.tap.Servlet;

import java.io.IOException;
import java.util.List;

import com.tap.DAOImpl.MenuDAOImpl;
import com.tap.model.Menu;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/MenuServlet")
public class MenuServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String restaurantIdParameter = req.getParameter("restaurantId");

        int restaurantId = Integer.parseInt(restaurantIdParameter);

        MenuDAOImpl mdi = new MenuDAOImpl();

        List<Menu> menus = mdi.getMenuByRestaurantId(restaurantId);

        req.setAttribute("menus", menus);

        RequestDispatcher rd = req.getRequestDispatcher("Menu.jsp");

        rd.forward(req, resp);
    }
}