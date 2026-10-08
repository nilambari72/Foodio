package com.tap.DAO;

import java.util.List;

import com.tap.model.Order;

public interface OrderDAO {

    int addOrder(Order order);

    Order getOrder(int orderID);

    List<Order> getOrdersByUserId(int userId);
}