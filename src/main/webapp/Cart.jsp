<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.Map"%>
<%@ page import="com.tap.model.Cart"%>
<%@ page import="com.tap.model.CartItem"%>

<!DOCTYPE html>

<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
    content="width=device-width, initial-scale=1.0">

<title>Foodio - Cart</title>


<style>

/* ================= GENERAL ================= */

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {

    font-family: Arial, sans-serif;

    background: #f7f7f7;

    color: #333;
}


/* ================= NAVBAR - DARK GLASS ================= */

.navbar {
    height: 72px;

    background: rgba(20, 18, 17, 0.82);

    backdrop-filter: blur(18px);
    -webkit-backdrop-filter: blur(18px);

    border-bottom: 1px solid rgba(255, 255, 255, 0.10);

    display: flex;
    align-items: center;
    justify-content: space-between;

    padding: 0 7%;

    position: sticky;
    top: 0;

    z-index: 1000;

    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.20);
}


/* ================= FOODIO LOGO ================= */

.logo {
    display: flex;
    align-items: center;
    gap: 11px;
    text-decoration: none;
}

.logo-icon {
    width: 46px;
    height: 46px;

    border-radius: 12px;

    background: #e23744;

    display: flex;
    align-items: center;
    justify-content: center;

    color: white;
    font-size: 23px;

    box-shadow:
        0 4px 12px rgba(226, 55, 68, 0.35);
}

.logo-text {
    font-size: 31px;
    font-weight: 800;

    color: white;

    letter-spacing: -0.5px;
}

.logo-text span {
    color: #e23744;
}


/* ================= NAV LINKS ================= */

.nav-links {
    display: flex;
    align-items: center;
    gap: 25px;
}

.nav-links a {
    color: white;

    text-decoration: none;

    font-weight: 700;

    padding: 9px 15px;

    border-radius: 8px;

    transition: all 0.3s ease;
}

.nav-links a:hover {
    color: #ff6670;

    background: rgba(255, 255, 255, 0.08);
}

/* ================= FOODIO LOGO ================= */

.logo {
    display: flex;
    align-items: center;
    gap: 11px;
    text-decoration: none;
}

.logo-icon {
    width: 46px;
    height: 46px;

    border-radius: 12px;

    background: #e23744;

    display: flex;
    align-items: center;
    justify-content: center;

    color: white;
    font-size: 23px;

    box-shadow:
        0 4px 12px rgba(226, 55, 68, 0.35);
}

.logo-text {
    font-size: 31px;
    font-weight: 800;

    color: #222;

    letter-spacing: -0.5px;
}

.logo-text span {
    color: #e23744;
}


/* ================= NAV LINKS ================= */

.nav-links {
    display: flex;
    align-items: center;
    gap: 25px;
}

.nav-links a {
    color: #222;              /* VISIBLE ON LIGHT GLASS */

    text-decoration: none;

    font-weight: 700;

    padding: 9px 15px;

    border-radius: 8px;

    transition: all 0.3s ease;
}

.nav-links a:hover {
    color: #e23744;

    background: rgba(226, 55, 68, 0.08);
}


/* ================= FOODIO LOGO ================= */

.logo {

    display: flex;

    align-items: center;

    gap: 11px;

    text-decoration: none;
}


.logo-icon {

    width: 46px;

    height: 46px;

    border-radius: 12px;

    background: #e23744;

    display: flex;

    align-items: center;

    justify-content: center;

    color: white;

    font-size: 23px;

    box-shadow:
        0 4px 12px rgba(226, 55, 68, 0.35);
}


.logo-text {

    font-family: Arial, sans-serif;

    font-size: 31px;

    font-weight: 800;

    color: white;

    letter-spacing: -0.5px;

    text-shadow:
        0 2px 8px rgba(0, 0, 0, 0.25);
}


.logo-text span {

    color: #e23744;
}


/* ================= NAV LINKS ================= */

.nav-links {

    display: flex;

    gap: 25px;

    align-items: center;
}


.nav-links a {

    color: white;

    text-decoration: none;

    font-weight: bold;

    transition: 0.3s;

    text-shadow:
        0 2px 6px rgba(0, 0, 0, 0.3);
}


.nav-links a:hover {

    color: #ff6670;
}


/* ================= CART ================= */

.cart-container {

    width: 90%;

    max-width: 1100px;

    margin: 40px auto;
}


.cart-title {

    font-size: 30px;

    margin-bottom: 25px;
}


/* ================= TABLE ================= */

.cart-table {

    width: 100%;

    background: white;

    border-radius: 12px;

    overflow: hidden;

    border-collapse: collapse;

    box-shadow:
        0 3px 15px rgba(0,0,0,0.08);
}


.cart-table th {

    background: #e23744;

    color: white;

    padding: 16px;

    text-align: left;
}


.cart-table td {

    padding: 16px;

    border-bottom: 1px solid #eee;
}


/* ================= QUANTITY ================= */

.quantity-container {

    display: flex;

    align-items: center;

    gap: 10px;
}


.quantity-container form {

    display: inline;
}


.quantity-btn {

    width: 32px;

    height: 32px;

    border: 1px solid #ddd;

    background: white;

    border-radius: 5px;

    cursor: pointer;

    font-size: 18px;
}


.quantity-btn:hover {

    background: #fff0f1;

    border-color: #e23744;
}


/* ================= REMOVE ================= */

.remove-btn {

    background: #e23744;

    color: white;

    border: none;

    padding: 8px 13px;

    border-radius: 5px;

    cursor: pointer;
}


.remove-btn:hover {

    background: #c91f2d;
}


/* ================= SUMMARY ================= */

.cart-summary {

    margin-top: 30px;

    margin-left: auto;

    width: 350px;

    background: white;

    padding: 25px;

    border-radius: 12px;

    box-shadow:
        0 3px 15px rgba(0,0,0,0.08);
}


.summary-row {

    display: flex;

    justify-content: space-between;

    margin-bottom: 15px;
}


.grand-total {

    font-size: 20px;

    font-weight: bold;

    border-top: 1px solid #ddd;

    padding-top: 15px;
}


/* ================= BUTTONS ================= */

.cart-actions {

    display: flex;

    justify-content: flex-end;

    gap: 12px;

    margin-top: 20px;
}


.cart-btn {

    padding: 12px 18px;

    border-radius: 7px;

    text-decoration: none;

    font-weight: bold;

    cursor: pointer;
}


.add-more {

    background: #e23744;

    color: white;
}


.add-more:hover {

    background: #c91f2d;
}


.clear-cart {

    background: #555;

    color: white;

    border: none;
}


.clear-cart:hover {

    background: #333;
}


.checkout {

    background: #28a745;

    color: white;
}


.checkout:hover {

    background: #218838;
}


/* ================= EMPTY CART ================= */

.empty-cart {

    background: white;

    padding: 60px;

    text-align: center;

    border-radius: 12px;

    box-shadow:
        0 3px 15px rgba(0,0,0,0.08);
}


.empty-cart h2 {

    margin-bottom: 15px;
}


.empty-cart p {

    color: #777;

    margin-bottom: 25px;
}


/* ================= POPUP ================= */

.popup-overlay {

    position: fixed;

    top: 0;

    left: 0;

    width: 100%;

    height: 100%;

    background: rgba(0,0,0,0.55);

    display: flex;

    justify-content: center;

    align-items: center;

    z-index: 9999;
}


.popup-box {

    background: white;

    width: 420px;

    max-width: 90%;

    padding: 30px;

    border-radius: 12px;

    text-align: center;

    box-shadow:
        0 5px 25px rgba(0,0,0,0.25);
}


.popup-box h2 {

    margin-bottom: 15px;

    color: #222;
}


.popup-box p {

    color: #666;

    line-height: 1.6;

    margin-bottom: 25px;
}


.popup-buttons {

    display: flex;

    justify-content: center;

    gap: 12px;
}


.replace-btn,
.cancel-btn {

    padding: 12px 18px;

    border-radius: 7px;

    font-weight: bold;

    cursor: pointer;
}


.replace-btn {

    border: none;

    background: #e23744;

    color: white;
}


.replace-btn:hover {

    background: #c91f2d;
}


.cancel-btn {

    border: 1px solid #ddd;

    color: #333;

    background: white;
}


/* ================= RESPONSIVE ================= */

@media (max-width: 700px) {

    .navbar {

        padding: 0 5%;
    }

    .logo-text {

        font-size: 25px;
    }

    .logo-icon {

        width: 40px;

        height: 40px;

        font-size: 20px;
    }

    .nav-links {

        gap: 12px;
    }

    .nav-links a {

        font-size: 13px;
    }

    .cart-container {

        width: 95%;
    }

    .cart-table {

        font-size: 13px;
    }

    .cart-table th,
    .cart-table td {

        padding: 10px;
    }

    .cart-summary {

        width: 100%;
    }

    .cart-actions {

        flex-wrap: wrap;
    }

}

</style>

</head>


<body>


<!-- ================= NAVBAR ================= -->

<div class="navbar">


    <a href="index.html" class="logo">

        <div class="logo-icon">
            🍴
        </div>

        <div class="logo-text">
            Food<span>io</span>
        </div>

    </a>


    <div class="nav-links">

        <a href="<%= request.getContextPath() %>/Restaurant">
            Restaurants
        </a>

        <a href="Profile.jsp">
            Profile
        </a>

    </div>

</div>



<%

Cart cart =
        (Cart) session.getAttribute("cart");

if (cart == null) {

    cart = new Cart();

}

Map<Integer, CartItem> items =
        cart.getItems();

boolean differentRestaurant =
        "true".equals(
            request.getParameter(
                "differentRestaurant"
            )
        );

Integer currentRestaurantId =
        (Integer) session.getAttribute(
            "restaurantId"
        );

%>



<div class="cart-container">


<%

if (items.isEmpty()) {

%>


    <!-- EMPTY CART -->

    <div class="empty-cart">

        <h2>

            Your Cart is Empty

        </h2>

        <p>

            Add some delicious food to your cart.

        </p>

        <a
            href="<%= request.getContextPath() %>/Restaurant"
            class="cart-btn add-more">

            Browse Restaurants

        </a>

    </div>


<%

} else {

%>


    <h1 class="cart-title">

        Your Cart

    </h1>



    <table class="cart-table">

        <tr>

            <th>
                Item
            </th>

            <th>
                Price
            </th>

            <th>
                Total
            </th>

            <th>
                Quantity
            </th>

            <th>
                Action
            </th>

        </tr>



<%

float subtotal = 0;

for (CartItem item : items.values()) {

    float itemTotal =
        item.getPrice() * item.getQuantity();

    subtotal += itemTotal;

%>


        <tr>

            <td>

                <%= item.getName() %>

            </td>


            <td>

                ₹<%= item.getPrice() %>

            </td>


            <td>

                ₹<%= itemTotal %>

            </td>


            <td>

                <div class="quantity-container">


                    <!-- MINUS -->

                    <form
                        action="<%= request.getContextPath() %>/callCartServlet"
                        method="post">

                        <input
                            type="hidden"
                            name="action"
                            value="update">

                        <input
                            type="hidden"
                            name="menuId"
                            value="<%= item.getMenuId() %>">

                        <input
                            type="hidden"
                            name="quantity"
                            value="<%= item.getQuantity() - 1 %>">

                        <button
                            type="submit"
                            class="quantity-btn">

                            −

                        </button>

                    </form>



                    <span>

                        <%= item.getQuantity() %>

                    </span>



                    <!-- PLUS -->

                    <form
                        action="<%= request.getContextPath() %>/callCartServlet"
                        method="post">

                        <input
                            type="hidden"
                            name="action"
                            value="update">

                        <input
                            type="hidden"
                            name="menuId"
                            value="<%= item.getMenuId() %>">

                        <input
                            type="hidden"
                            name="quantity"
                            value="<%= item.getQuantity() + 1 %>">

                        <button
                            type="submit"
                            class="quantity-btn">

                            +

                        </button>

                    </form>


                </div>

            </td>


            <td>

                <form
                    action="<%= request.getContextPath() %>/callCartServlet"
                    method="post">

                    <input
                        type="hidden"
                        name="action"
                        value="delete">

                    <input
                        type="hidden"
                        name="menuId"
                        value="<%= item.getMenuId() %>">

                    <button
                        type="submit"
                        class="remove-btn">

                        Remove

                    </button>

                </form>

            </td>

        </tr>


<%

}

%>


    </table>



<%

float deliveryFee = 50;

float grandTotal =
        subtotal + deliveryFee;

%>


    <!-- SUMMARY -->

    <div class="cart-summary">


        <div class="summary-row">

            <span>
                Subtotal
            </span>

            <span>
                ₹<%= subtotal %>
            </span>

        </div>


        <div class="summary-row">

            <span>
                Delivery Fee
            </span>

            <span>
                ₹<%= deliveryFee %>
            </span>

        </div>


        <div class="summary-row grand-total">

            <span>
                Grand Total
            </span>

            <span>
                ₹<%= grandTotal %>
            </span>

        </div>

    </div>



    <!-- ACTION BUTTONS -->

    <div class="cart-actions">


<%

if (currentRestaurantId != null) {

%>


        <!-- ADD MORE FROM SAME RESTAURANT -->

        <a
            href="<%= request.getContextPath() %>/MenuServlet?restaurantId=<%= currentRestaurantId %>"
            class="cart-btn add-more">

            🛍 Add More Items

        </a>


<%

} else {

%>


        <a
            href="<%= request.getContextPath() %>/Restaurant"
            class="cart-btn add-more">

            🛍 Add More Items

        </a>


<%

}

%>



        <!-- CLEAR CART -->

        <form
            action="<%= request.getContextPath() %>/callCartServlet"
            method="post">

            <input
                type="hidden"
                name="action"
                value="clear">

            <button
                type="submit"
                class="cart-btn clear-cart">

                Clear Cart

            </button>

        </form>



        <!-- CHECKOUT -->

        <a
            href="Checkout.jsp"
            class="cart-btn checkout">

            Proceed to Checkout

        </a>


    </div>


<%

}

%>


</div>



<!-- ================= DIFFERENT RESTAURANT POPUP ================= -->

<%

if (differentRestaurant && !items.isEmpty()) {

%>


<div class="popup-overlay">


    <div class="popup-box">


        <h2>

            Items from another restaurant

        </h2>


        <p>

            Your cart contains items from another
            restaurant.

            Do you want to replace your existing cart?

        </p>


        <div class="popup-buttons">


            <!-- YES -->

            <form
                action="<%= request.getContextPath() %>/callCartServlet"
                method="post">

                <input
                    type="hidden"
                    name="action"
                    value="replaceCart">

                <button
                    type="submit"
                    class="replace-btn">

                    Yes, Replace Cart

                </button>

            </form>


            <!-- CANCEL -->

            <form
                action="<%= request.getContextPath() %>/callCartServlet"
                method="post">

                <input
                    type="hidden"
                    name="action"
                    value="cancelReplace">

                <button
                    type="submit"
                    class="cancel-btn">

                    Cancel

                </button>

            </form>


        </div>

    </div>

</div>


<%

}

%>


</body>

</html>