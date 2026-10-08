package com.tap.Servlet;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Map;

import com.tap.DAOImpl.OrderDAOImpl;
import com.tap.DAOImpl.OrderItemDAOImpl;
import com.tap.model.Cart;
import com.tap.model.CartItem;
import com.tap.model.Order;
import com.tap.model.OrderItem;
import com.tap.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/PlaceOrderServlet")
public class PlaceOrderServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();

        // ------------------------------------------------
        // 1. CHECK LOGIN
        // ------------------------------------------------

        User user = (User) session.getAttribute("loggedInUser");

        if (user == null) {

            resp.sendRedirect("login.html");
            return;
        }

        // ------------------------------------------------
        // 2. GET CART
        // ------------------------------------------------

        Cart cart = (Cart) session.getAttribute("cart");

        if (cart == null || cart.getItems().isEmpty()) {

            resp.sendRedirect("Cart.jsp");
            return;
        }

        // ------------------------------------------------
        // 3. GET CHECKOUT DETAILS
        // ------------------------------------------------

        String fullName = req.getParameter("fullName");
        String mobileNumber = req.getParameter("mobileNumber");
        String address = req.getParameter("address");
        String payment = req.getParameter("payment");

        // ------------------------------------------------
        // 4. GET TOTAL
        // ------------------------------------------------

        float totalAmount = 0;

        for (CartItem item : cart.getItems().values()) {

            totalAmount += item.getPrice() * item.getQuantity();
        }

        // Delivery charge
        totalAmount += 40;

        // ------------------------------------------------
        // 5. GET RESTAURANT ID
        // ------------------------------------------------

        Integer restaurantId =
                (Integer) session.getAttribute("restaurantId");

        if (restaurantId == null) {

            for (CartItem item : cart.getItems().values()) {

                restaurantId = item.getResturantId();
                break;
            }
        }

        // ------------------------------------------------
        // 6. GENERATE ORDER ID
        // ------------------------------------------------

        int orderID = (int) (System.currentTimeMillis() / 1000);

        // ------------------------------------------------
        // 7. CREATE ORDER OBJECT
        // ------------------------------------------------

        Order order = new Order();

        order.setOrderID(orderID);
        order.setUserID(user.getUserId());
        order.setRestaurantID(restaurantId);
        order.setPaymentMethod(payment);
        order.setTotalAmount(totalAmount);
        order.setStatus("pending");
        order.setOrderDate(new Timestamp(System.currentTimeMillis()));

        // ------------------------------------------------
        // 8. INSERT INTO ORDERTABLE
        // ------------------------------------------------

        OrderDAOImpl orderDAO = new OrderDAOImpl();

        int orderResult = orderDAO.addOrder(order);

        if (orderResult == 0) {

            req.setAttribute(
                    "errorMessage",
                    "Unable to place order. Please try again."
            );

            req.getRequestDispatcher("Checkout.jsp")
               .forward(req, resp);

            return;
        }

        // ------------------------------------------------
        // 9. INSERT CART ITEMS INTO ORDERITEM
        // ------------------------------------------------

        OrderItemDAOImpl orderItemDAO =
                new OrderItemDAOImpl();

        int orderItemID =
                (int) (System.currentTimeMillis() / 1000);

        for (Map.Entry<Integer, CartItem> entry :
                cart.getItems().entrySet()) {

            CartItem cartItem = entry.getValue();

            float itemTotal =
                    cartItem.getPrice()
                    * cartItem.getQuantity();

            OrderItem orderItem = new OrderItem();

            orderItem.setOrderID(orderID);
            orderItem.setOrderItemID(orderItemID++);
            orderItem.setQuantity(cartItem.getQuantity());
            orderItem.setItemTotal(itemTotal);
            orderItem.setMenuID(cartItem.getMenuId());

            orderItemDAO.addOrderItem(orderItem);
        }

        // ------------------------------------------------
        // 10. STORE ORDER DETAILS FOR CONFIRMATION PAGE
        // ------------------------------------------------

        session.setAttribute("lastOrderID", orderID);
        session.setAttribute("lastOrderAmount", totalAmount);
        session.setAttribute("lastOrderPayment", payment);
        session.setAttribute("lastOrderName", fullName);
        session.setAttribute("lastOrderMobile", mobileNumber);
        session.setAttribute("lastOrderAddress", address);

        // ------------------------------------------------
        // 11. CLEAR CART
        // ------------------------------------------------

        session.removeAttribute("cart");
        session.removeAttribute("restaurantId");

        // ------------------------------------------------
        // 12. GO TO ORDER SUCCESS PAGE
        // ------------------------------------------------

        resp.sendRedirect("OrderSuccess.jsp");
    }
}