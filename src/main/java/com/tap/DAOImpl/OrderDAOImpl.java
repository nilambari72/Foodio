package com.tap.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tap.DAO.OrderDAO;
import com.tap.model.Order;
import com.tap.utility.DBConnection;

public class OrderDAOImpl implements OrderDAO {

    private Connection con;

    @Override
    public int addOrder(Order order) {

        String query =
                "INSERT INTO ordertable "
                + "(UserID, OrderID, OrderDate, TotalAmount, Status, PaymentMethod, RestaurantID) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try {

            con = DBConnection.getConnection();

            PreparedStatement pstmt =
                    con.prepareStatement(query);

            pstmt.setInt(1, order.getUserID());
            pstmt.setInt(2, order.getOrderID());
            pstmt.setTimestamp(3, order.getOrderDate());
            pstmt.setFloat(4, order.getTotalAmount());
            pstmt.setString(5, order.getStatus());
            pstmt.setString(6, order.getPaymentMethod());
            pstmt.setInt(7, order.getRestaurantID());

            int rows = pstmt.executeUpdate();

            return rows;

        } catch (SQLException e) {

            e.printStackTrace();
        }

        return 0;
    }


    @Override
    public Order getOrder(int orderID) {

        String query =
                "SELECT UserID, OrderID, OrderDate, "
                + "TotalAmount, Status, PaymentMethod, RestaurantID "
                + "FROM ordertable "
                + "WHERE OrderID = ?";

        try {

            con = DBConnection.getConnection();

            PreparedStatement pstmt =
                    con.prepareStatement(query);

            pstmt.setInt(1, orderID);

            ResultSet rs =
                    pstmt.executeQuery();

            if (rs.next()) {

                Order order = new Order();

                order.setUserID(
                        rs.getInt("UserID"));

                order.setOrderID(
                        rs.getInt("OrderID"));

                order.setOrderDate(
                        rs.getTimestamp("OrderDate"));

                order.setTotalAmount(
                        rs.getFloat("TotalAmount"));

                order.setStatus(
                        rs.getString("Status"));

                order.setPaymentMethod(
                        rs.getString("PaymentMethod"));

                order.setRestaurantID(
                        rs.getInt("RestaurantID"));

                return order;
            }

        } catch (SQLException e) {

            e.printStackTrace();
        }

        return null;
    }


    @Override
    public List<Order> getOrdersByUserId(int userId) {

        List<Order> orders =
                new ArrayList<>();

        String query =
                "SELECT UserID, OrderID, OrderDate, "
                + "TotalAmount, Status, PaymentMethod, RestaurantID "
                + "FROM ordertable "
                + "WHERE UserID = ? "
                + "ORDER BY OrderDate DESC";

        try {

            con = DBConnection.getConnection();

            PreparedStatement pstmt =
                    con.prepareStatement(query);

            pstmt.setInt(1, userId);

            ResultSet rs =
                    pstmt.executeQuery();

            while (rs.next()) {

                Order order = new Order();

                order.setUserID(
                        rs.getInt("UserID"));

                order.setOrderID(
                        rs.getInt("OrderID"));

                order.setOrderDate(
                        rs.getTimestamp("OrderDate"));

                order.setTotalAmount(
                        rs.getFloat("TotalAmount"));

                order.setStatus(
                        rs.getString("Status"));

                order.setPaymentMethod(
                        rs.getString("PaymentMethod"));

                order.setRestaurantID(
                        rs.getInt("RestaurantID"));

                orders.add(order);
            }

        } catch (SQLException e) {

            e.printStackTrace();
        }

        return orders;
    }
}