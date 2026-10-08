<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.Map" %>
<%@ page import="com.tap.model.Cart" %>
<%@ page import="com.tap.model.CartItem" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Foodio - Checkout</title>

    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, Helvetica, sans-serif;
            background: #f7f7f7;
            color: #222;
        }

        /* ================= NAVBAR ================= */

        .navbar {
            height: 75px;
            width: 100%;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 7%;

            background: white;

            box-shadow: 0 2px 10px rgba(0,0,0,0.08);

            position: relative;
            z-index: 1000;
        }

        .logo {
            display: flex;
            align-items: center;
            gap: 10px;
            text-decoration: none;
        }

        .logo-icon {
            width: 42px;
            height: 42px;
            border-radius: 12px;

            /* FOODIO RED */
            background: #e23744;

            display: flex;
            align-items: center;
            justify-content: center;

            font-size: 23px;
        }

        .logo-text {
            font-size: 28px;
            font-weight: 800;
            color: #222;
        }

        .logo-text span {
            /* FOODIO RED */
            color: #e23744;
        }

        .nav-links {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .nav-links a {
            text-decoration: none;
            color: #333;
            font-size: 15px;
            font-weight: 600;
            padding: 11px 18px;
            border-radius: 8px;
            transition: 0.3s;
        }

        .nav-links a:hover {
            /* FOODIO RED */
            color: #e23744;
            background: #fff1ed;
        }

        /* ================= PAGE ================= */

        .checkout-container {
            width: 90%;
            max-width: 1100px;
            margin: 45px auto;
            display: grid;
            grid-template-columns: 1.6fr 1fr;
            gap: 30px;
        }

        /* ================= LEFT SIDE ================= */

        .checkout-left {
            background: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.08);
        }

        .checkout-left h2 {
            font-size: 26px;
            margin-bottom: 25px;
        }

        .section {
            margin-bottom: 30px;
        }

        .section h3 {
            font-size: 19px;
            margin-bottom: 15px;
        }

        /* ================= INPUT GROUP ================= */

        .input-group {
            margin-bottom: 18px;
        }

        .input-group label {
            display: block;
            font-size: 14px;
            font-weight: 600;
            margin-bottom: 7px;
            color: #333;
        }

        .input-group input {
            width: 100%;
            padding: 14px 15px;
            border: 1px solid #ddd;
            border-radius: 10px;
            font-size: 15px;
            outline: none;
            transition: 0.3s;
        }

        .input-group input:focus {
            /* FOODIO RED */
            border-color: #e23744;
            box-shadow: 0 0 0 2px rgba(226,55,68,0.1);
        }

        /* ================= ADDRESS ================= */

        .address-box {
            width: 100%;
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 10px;
            font-size: 15px;
            outline: none;
            resize: vertical;
            min-height: 100px;
        }

        .address-box:focus {
            /* FOODIO RED */
            border-color: #e23744;
            box-shadow: 0 0 0 2px rgba(226,55,68,0.1);
        }

        /* ================= PAYMENT ================= */

        .payment-option {
            border: 1px solid #ddd;
            border-radius: 10px;
            padding: 15px;
            margin-bottom: 12px;
            cursor: pointer;
            display: flex;
            align-items: center;
            gap: 12px;
            transition: 0.3s;
        }

        .payment-option:hover {
            /* FOODIO RED */
            border-color: #e23744;
            background: #fff5f5;
        }

        .payment-option input {
            /* FOODIO RED */
            accent-color: #e23744;
        }

        /* ================= RIGHT SIDE ================= */

        .order-summary {
            background: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.08);
            height: fit-content;
        }

        .order-summary h2 {
            font-size: 24px;
            margin-bottom: 25px;
        }

        /* ================= CART ITEM ================= */

        .checkout-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 0;
            border-bottom: 1px solid #eee;
        }

        .item-info {
            display: flex;
            flex-direction: column;
            gap: 5px;
        }

        .item-name {
            font-weight: 600;
            font-size: 15px;
        }

        .item-quantity {
            color: #777;
            font-size: 13px;
        }

        .item-price {
            font-weight: 600;
            color: #333;
        }

        /* ================= TOTAL ================= */

        .price-row {
            display: flex;
            justify-content: space-between;
            margin-top: 15px;
            font-size: 15px;
        }

        .price-row.total {
            border-top: 1px solid #ddd;
            padding-top: 18px;
            margin-top: 20px;
            font-size: 20px;
            font-weight: 700;
        }

        .delivery-fee {
            color: #168b45;
        }

        /* ================= BUTTON ================= */

        .place-order-btn {
            width: 100%;
            border: none;

            /* SAME AS MENU ADD TO CART */
            background: #e23744;

            color: white;
            padding: 16px;
            border-radius: 10px;
            margin-top: 25px;
            font-size: 16px;
            font-weight: 700;
            cursor: pointer;
            transition: 0.3s;
        }

        .place-order-btn:hover {
            /* SAME HOVER STYLE */
            background: #c91f2d;
            transform: translateY(-1px);
        }

        /* ================= EMPTY CART ================= */

        .empty-cart {
            text-align: center;
            padding: 80px 20px;
        }

        .empty-cart h2 {
            margin-bottom: 15px;
        }

        .empty-cart p {
            color: #777;
            margin-bottom: 25px;
        }

        .back-btn {
            display: inline-block;
            text-decoration: none;

            /* SAME AS MENU ADD TO CART */
            background: #e23744;

            color: white;
            padding: 12px 22px;
            border-radius: 8px;
            font-weight: 600;
            transition: 0.3s;
        }

        .back-btn:hover {
            background: #c91f2d;
        }

        /* ================= RESPONSIVE ================= */

        @media (max-width: 800px) {

            .checkout-container {
                grid-template-columns: 1fr;
            }

            .nav-links {
                gap: 3px;
            }

            .nav-links a {
                padding: 8px;
            }

        }

    </style>

</head>

<body>

    <!-- ================= NAVBAR ================= -->

    <nav class="navbar">

        <a href="Restaurant" class="logo">

            <div class="logo-icon">
                🍴
            </div>

            <div class="logo-text">
                Food<span>io</span>
            </div>

        </a>

        <div class="nav-links">

            <a href="Restaurant">
                Home
            </a>

            <a href="Restaurant#restaurants">
                Restaurants
            </a>

            <a href="Cart.jsp">
                Cart
            </a>

            <a href="login.html">
                Login
            </a>

            <a href="ProfileServlet">
                Profile
            </a>

        </div>

    </nav>


<%

    Cart cart =
        (Cart) session.getAttribute("cart");


    if (cart == null ||
        cart.getItems().isEmpty()) {

%>


    <!-- ================= EMPTY CART ================= -->

    <div class="empty-cart">

        <h2>
            Your cart is empty 🛒
        </h2>

        <p>
            Add some delicious food before proceeding to checkout.
        </p>

        <a href="Restaurant" class="back-btn">
            Browse Restaurants
        </a>

    </div>


<%

    } else {


        float subtotal = 0;


        for (CartItem item :
                cart.getItems().values()) {

            subtotal +=
                item.getPrice() *
                item.getQuantity();

        }


        float deliveryFee = 40;

        float total =
            subtotal + deliveryFee;

%>


    <!-- ================= CHECKOUT ================= -->

    <form action="PlaceOrderServlet"
          method="post">


        <div class="checkout-container">


            <!-- ================= LEFT SIDE ================= -->

            <div class="checkout-left">

                <h2>
                    Checkout
                </h2>


                <!-- ================= CUSTOMER DETAILS ================= -->

                <div class="section">

                    <h3>
                        👤 Customer Details
                    </h3>


                    <!-- FULL NAME -->

                    <div class="input-group">

                        <label for="fullName">
                            Full Name
                        </label>

                        <input
                            type="text"
                            id="fullName"
                            name="fullName"
                            placeholder="Enter your full name"
                            required>

                    </div>


                    <!-- MOBILE NUMBER -->

                    <div class="input-group">

                        <label for="mobileNumber">
                            Mobile Number
                        </label>

                        <input
                            type="tel"
                            id="mobileNumber"
                            name="mobileNumber"
                            placeholder="Enter your mobile number"
                            maxlength="10"
                            pattern="[0-9]{10}"
                            required>

                    </div>


                    <!-- DELIVERY ADDRESS -->

                    <div class="input-group">

                        <label for="address">
                            Delivery Address
                        </label>

                        <textarea
                            id="address"
                            name="address"
                            class="address-box"
                            placeholder="Enter your complete delivery address..."
                            required></textarea>

                    </div>

                </div>


                <!-- ================= PAYMENT ================= -->

                <div class="section">

                    <h3>
                        💳 Payment Method
                    </h3>


                    <!-- CASH ON DELIVERY -->

                    <label class="payment-option">

                        <input
                            type="radio"
                            name="payment"
                            value="cash on delivery"
                            checked
                            required>

                        <span>
                            💵 Cash on Delivery
                        </span>

                    </label>


                    <!-- UPI -->

                    <label class="payment-option">

                        <input
                            type="radio"
                            name="payment"
                            value="upi">

                        <span>
                            📱 UPI
                        </span>

                    </label>


                    <!-- PHONEPAY -->

                    <label class="payment-option">

                        <input
                            type="radio"
                            name="payment"
                            value="phonepay">

                        <span>
                            📲 PhonePe
                        </span>

                    </label>


                </div>

            </div>


            <!-- ================= RIGHT SIDE ================= -->

            <div class="order-summary">

                <h2>
                    Your Order
                </h2>


<%

                for (CartItem item :
                        cart.getItems().values()) {


                    float itemTotal =
                        item.getPrice() *
                        item.getQuantity();

%>


                    <div class="checkout-item">


                        <div class="item-info">

                            <span class="item-name">
                                <%= item.getName() %>
                            </span>


                            <span class="item-quantity">

                                Qty:
                                <%= item.getQuantity() %>

                            </span>

                        </div>


                        <span class="item-price">

                            ₹<%= String.format(
                                "%.2f",
                                itemTotal
                            ) %>

                        </span>


                    </div>


<%

                }

%>


                <!-- ================= PRICE DETAILS ================= -->

                <div class="price-row">

                    <span>
                        Subtotal
                    </span>

                    <span>

                        ₹<%= String.format(
                            "%.2f",
                            subtotal
                        ) %>

                    </span>

                </div>


                <div class="price-row">

                    <span>
                        Delivery Fee
                    </span>

                    <span class="delivery-fee">

                        ₹<%= String.format(
                            "%.2f",
                            deliveryFee
                        ) %>

                    </span>

                </div>


                <div class="price-row total">

                    <span>
                        Total
                    </span>

                    <span>

                        ₹<%= String.format(
                            "%.2f",
                            total
                        ) %>

                    </span>

                </div>


                <!-- ================= TOTAL AMOUNT ================= -->

                <input
                    type="hidden"
                    name="totalAmount"
                    value="<%= total %>">


                <!-- ================= PLACE ORDER ================= -->

                <button
                    type="submit"
                    class="place-order-btn">

                    Place Order →

                </button>


            </div>


        </div>

    </form>


<%

    }

%>


</body>

</html>