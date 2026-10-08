package com.tap.Servlet;

import java.io.IOException;
import java.util.List;

import com.tap.DAO.RestaurantDAO;
import com.tap.DAOImpl.RestaurantDAOImpl;
import com.tap.model.Restaurant;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/Restaurant")
public class RestaurantServlet extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        RestaurantDAO restaurantDAO =new RestaurantDAOImpl();

              

        List<Restaurant> allRestaurant =
                restaurantDAO.getAllRestaurant();


        for (Restaurant restaurant : allRestaurant) {

            System.out.println(restaurant);

        }


        request.setAttribute(
                "allRestaurants",
                allRestaurant
        );


        RequestDispatcher rd =
                request.getRequestDispatcher(
                        "Restaurant.jsp"
                );

        rd.forward(request, response);
    }
}