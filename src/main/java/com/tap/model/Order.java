
package com.tap.model;

import java.sql.Timestamp;

public class Order {

    private int orderID;
    private int userID;
    private int restaurantID;

    private String paymentMethod;

    private float totalAmount;

    private String status;

    private Timestamp orderDate;


    public Order() {
        super();
    }


    public Order(int orderID, int userID, int restaurantID,
                 String paymentMethod, float totalAmount,
                 String status, Timestamp orderDate) {

        super();

        this.orderID = orderID;
        this.userID = userID;
        this.restaurantID = restaurantID;
        this.paymentMethod = paymentMethod;
        this.totalAmount = totalAmount;
        this.status = status;
        this.orderDate = orderDate;
    }


    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }


    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }


    public int getRestaurantID() {
        return restaurantID;
    }

    public void setRestaurantID(int restaurantID) {
        this.restaurantID = restaurantID;
    }


    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }


    public float getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(float totalAmount) {
        this.totalAmount = totalAmount;
    }


    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }


    public Timestamp getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Timestamp orderDate) {
        this.orderDate = orderDate;
    }


    @Override
    public String toString() {

        return "Order [orderID=" + orderID
                + ", userID=" + userID
                + ", restaurantID=" + restaurantID
                + ", paymentMethod=" + paymentMethod
                + ", totalAmount=" + totalAmount
                + ", status=" + status
                + ", orderDate=" + orderDate
                + "]";
    }
}

