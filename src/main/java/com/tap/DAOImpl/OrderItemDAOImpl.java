package com.tap.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tap.DAO.OrderItemDAO;
import com.tap.model.OrderItem;
import com.tap.utility.DBConnection;

public class OrderItemDAOImpl implements OrderItemDAO {

    private Connection con;

    @Override
    public void addOrderItem(OrderItem orderItem) {

        String query = "INSERT INTO orderitem "
                + "(OrderID, OrderItemID, Quantity, ItemTotal, MenuID) "
                + "VALUES (?, ?, ?, ?, ?)";

        try {

            con = DBConnection.getConnection();

            PreparedStatement pstmt = con.prepareStatement(query);

            pstmt.setInt(1, orderItem.getOrderID());
            pstmt.setInt(2, orderItem.getOrderItemID());
            pstmt.setInt(3, orderItem.getQuantity());
            pstmt.setFloat(4, orderItem.getItemTotal());
            pstmt.setInt(5, orderItem.getMenuID());

            pstmt.executeUpdate();

        } catch (SQLException e) {

            e.printStackTrace();
        }
    }

    @Override
    public List<OrderItem> getOrderItems(int orderId) {

        List<OrderItem> orderItems = new ArrayList<>();

        String query = "SELECT OrderID, OrderItemID, Quantity, "
                + "ItemTotal, MenuID "
                + "FROM orderitem WHERE OrderID = ?";

        try {

            con = DBConnection.getConnection();

            PreparedStatement pstmt = con.prepareStatement(query);

            pstmt.setInt(1, orderId);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {

                OrderItem orderItem = new OrderItem();

                orderItem.setOrderID(rs.getInt("OrderID"));
                orderItem.setOrderItemID(rs.getInt("OrderItemID"));
                orderItem.setQuantity(rs.getInt("Quantity"));
                orderItem.setItemTotal(rs.getFloat("ItemTotal"));
                orderItem.setMenuID(rs.getInt("MenuID"));

                orderItems.add(orderItem);
            }

        } catch (SQLException e) {

            e.printStackTrace();
        }

        return orderItems;
    }
}