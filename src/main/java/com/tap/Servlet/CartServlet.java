package com.tap.Servlet;

import java.io.IOException;

import com.tap.DAOImpl.MenuDAOImpl;
import com.tap.model.Cart;
import com.tap.model.CartItem;
import com.tap.model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/callCartServlet")
public class CartServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();

        Cart cart = (Cart) session.getAttribute("cart");

        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }

        String action = req.getParameter("action");

        // ADD ITEM
        if ("add".equals(action)) {

            int newRestaurantId =
                    Integer.parseInt(req.getParameter("restaurantId"));

            Integer currentRestaurantId =
                    (Integer) session.getAttribute("restaurantId");

            // Different restaurant
            if (currentRestaurantId != null
                    && currentRestaurantId != newRestaurantId
                    && !cart.getItems().isEmpty()) {

                session.setAttribute(
                        "pendingMenuId",
                        Integer.parseInt(req.getParameter("menuId"))
                );

                session.setAttribute(
                        "pendingQuantity",
                        Integer.parseInt(req.getParameter("quantity"))
                );

                session.setAttribute(
                        "pendingRestaurantId",
                        newRestaurantId
                );

                resp.sendRedirect("Cart.jsp?differentRestaurant=true");
                return;
            }

            // Same restaurant
            session.setAttribute("restaurantId", newRestaurantId);

            addItemToCart(req, cart);

            resp.sendRedirect("Cart.jsp");
            return;
        }

        // UPDATE QUANTITY
        else if ("update".equals(action)) {

            updateItem(req, cart);

            resp.sendRedirect("Cart.jsp");
            return;
        }

        // DELETE ITEM
        else if ("delete".equals(action)) {

            removeItemFromCart(req, cart);

            resp.sendRedirect("Cart.jsp");
            return;
        }

        // CLEAR CART
        else if ("clear".equals(action)) {

            cart = new Cart();

            session.setAttribute("cart", cart);

            session.removeAttribute("restaurantId");

            resp.sendRedirect("Cart.jsp");
            return;
        }

        // REPLACE CART
        else if ("replaceCart".equals(action)) {

            addPendingItem(session);

            resp.sendRedirect("Cart.jsp");
            return;
        }

        // CANCEL REPLACE
        else if ("cancelReplace".equals(action)) {

            session.removeAttribute("pendingMenuId");
            session.removeAttribute("pendingQuantity");
            session.removeAttribute("pendingRestaurantId");

            resp.sendRedirect("Cart.jsp");
            return;
        }

        resp.sendRedirect("Cart.jsp");
    }


    private void removeItemFromCart(
            HttpServletRequest req,
            Cart cart) {

        int menuId =
                Integer.parseInt(req.getParameter("menuId"));

        cart.removeItem(menuId);
    }


    private void updateItem(
            HttpServletRequest req,
            Cart cart) {

        int menuId =
                Integer.parseInt(req.getParameter("menuId"));

        int quantity =
                Integer.parseInt(req.getParameter("quantity"));

        cart.updateItem(menuId, quantity);
    }


    private void addItemToCart(
            HttpServletRequest req,
            Cart cart) {

        int menuId =
                Integer.parseInt(req.getParameter("menuId"));

        int quantity =
                Integer.parseInt(req.getParameter("quantity"));

        MenuDAOImpl menuDAOImpl =
                new MenuDAOImpl();

        Menu menu =
                menuDAOImpl.getMenu(menuId);

        if (menu != null) {

            HttpSession session =
                    req.getSession();

            session.setAttribute(
                    "restaurantId",
                    menu.getRestaurantId()
            );

            CartItem cartItem =
                    new CartItem(
                            menuId,
                            menu.getRestaurantId(),
                            menu.getItemName(),
                            menu.getPrice(),
                            quantity
                    );

            cart.addItem(cartItem);

            System.out.println(
                    "Cart Size : " +
                    cart.getItems().size()
            );

            System.out.println(
                    "Cart : " +
                    cart.getItems()
            );
        }
    }


    private void addPendingItem(
            HttpSession session) {

        Cart cart = new Cart();

        session.setAttribute("cart", cart);

        int menuId =
                (Integer) session.getAttribute(
                        "pendingMenuId"
                );

        int quantity =
                (Integer) session.getAttribute(
                        "pendingQuantity"
                );

        int restaurantId =
                (Integer) session.getAttribute(
                        "pendingRestaurantId"
                );

        session.setAttribute(
                "restaurantId",
                restaurantId
        );

        MenuDAOImpl menuDAOImpl =
                new MenuDAOImpl();

        Menu menu =
                menuDAOImpl.getMenu(menuId);

        if (menu != null) {

            CartItem cartItem =
                    new CartItem(
                            menuId,
                            menu.getRestaurantId(),
                            menu.getItemName(),
                            menu.getPrice(),
                            quantity
                    );

            cart.addItem(cartItem);
        }

        session.removeAttribute("pendingMenuId");
        session.removeAttribute("pendingQuantity");
        session.removeAttribute("pendingRestaurantId");
    }
}