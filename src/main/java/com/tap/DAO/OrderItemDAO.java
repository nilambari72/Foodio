
package com.tap.DAO;

import java.util.List;

import com.tap.model.OrderItem;

public interface OrderItemDAO {

    // Add an order item
    void addOrderItem(OrderItem orderItem);

    // Get all items belonging to an order
    List<OrderItem> getOrderItems(int orderId);

}

