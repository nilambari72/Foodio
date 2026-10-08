
<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.tap.model.User" %>
<%@ page import="com.tap.model.Order" %>
<%@ page import="com.tap.DAOImpl.OrderDAOImpl" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Foodio - Profile</title>

    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            min-height: 100vh;
            background: #0f0d0c;
            color: #e8e2dd;
            font-family: Arial, Helvetica, sans-serif;
        }


        /* ================= NAVBAR ================= */

        .navbar {
            height: 70px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 7%;
            background: #1e1712;
            border-bottom: 1px solid rgba(255,255,255,0.08);
            position: sticky;
            top: 0;
            z-index: 1000;
        }

        .logo {
            display: flex;
            align-items: center;
            gap: 10px;
            text-decoration: none;
        }

        .logo-icon {
            width: 38px;
            height: 38px;
            border-radius: 11px;
            background: #e23744;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 20px;
        }

        .logo-text {
            font-size: 23px;
            font-weight: 700;
            color: #f2ede8;
        }

        .logo-text span {
            color: #ff8a5c;
        }

        .nav-links {
            display: flex;
            align-items: center;
            gap: 28px;
        }

        .nav-links a {
            color: #cfc7c0;
            text-decoration: none;
            font-size: 14px;
            transition: 0.3s;
        }

        .nav-links a:hover {
            color: #ff8a5c;
        }


        /* ================= PROFILE ================= */

        .container {
            min-height: calc(100vh - 70px);
            display: flex;
            justify-content: center;
            align-items: flex-start;
            padding: 50px 20px;
        }

        .profile-card {
            width: 100%;
            max-width: 520px;
            background: #1e1712;
            border: 1px solid rgba(255,255,255,0.08);
            border-radius: 18px;
            padding: 35px;
            box-shadow: 0 20px 50px rgba(0,0,0,0.35);
        }


        /* ================= AVATAR ================= */

        .avatar {
            width: 85px;
            height: 85px;
            border-radius: 50%;
            background: #e23744;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 18px;
            color: white;
            font-size: 35px;
            font-weight: bold;
        }

        .profile-card h2 {
            text-align: center;
            color: #f2ede8;
            margin-bottom: 10px;
            font-size: 24px;
        }

        .role-badge {
            display: table;
            margin: 0 auto 30px;
            padding: 5px 13px;
            border-radius: 20px;
            background: rgba(255,138,92,0.12);
            border: 1px solid rgba(255,138,92,0.25);
            color: #ff8a5c;
            font-size: 11px;
            font-weight: 600;
        }


        /* ================= USER INFORMATION ================= */

        .info-group {
            margin-bottom: 18px;
        }

        .info-group label {
            display: block;
            color: #928981;
            font-size: 12px;
            margin-bottom: 7px;
        }

        .info-value {
            background: #141110;
            border: 1px solid rgba(255,255,255,0.07);
            border-radius: 10px;
            padding: 13px 14px;
            color: #e8e2dd;
            font-size: 14px;
        }


        /* ================= MY ORDERS ================= */

        .orders-section {
            margin-top: 28px;
            padding-top: 25px;
            border-top: 1px solid rgba(255,255,255,0.08);

            /* Scroll only inside My Orders */
            max-height: 420px;
            overflow-y: auto;

            /* Space for scrollbar */
            padding-right: 8px;
        }

        .orders-section h3 {
            color: #f2ede8;
            margin-bottom: 16px;
            font-size: 18px;

            /* Keep heading visible while scrolling */
            position: sticky;
            top: 0;
            z-index: 5;
            background: #1e1712;
            padding: 5px 0 10px;
        }


        /* ================= CUSTOM SCROLLBAR ================= */

        .orders-section::-webkit-scrollbar {
            width: 6px;
        }

        .orders-section::-webkit-scrollbar-track {
            background: #141110;
            border-radius: 10px;
        }

        .orders-section::-webkit-scrollbar-thumb {
            background: #e23744;
            border-radius: 10px;
        }

        .orders-section::-webkit-scrollbar-thumb:hover {
            background: #ff4d5a;
        }


        /* ================= ORDER CARD ================= */

        .order-card {
            background: #141110;
            border: 1px solid rgba(255,255,255,0.08);
            border-radius: 12px;
            padding: 16px;
            margin-bottom: 12px;
        }

        .order-top {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 12px;
        }

        .order-top strong {
            color: #f2ede8;
            font-size: 14px;
        }

        .status {
            color: #ff8a5c;
            background: rgba(226,55,68,0.12);
            border: 1px solid rgba(226,55,68,0.3);
            border-radius: 20px;
            padding: 4px 10px;
            font-size: 11px;
            text-transform: capitalize;
        }

        .order-info p {
            display: flex;
            justify-content: space-between;
            gap: 15px;
            color: #b0a89f;
            font-size: 13px;
            padding: 5px 0;
        }

        .order-info p span {
            color: #f2ede8;
            font-weight: 600;
        }

        .empty-orders {
            background: #141110;
            border: 1px solid rgba(255,255,255,0.08);
            border-radius: 10px;
            padding: 15px;
            text-align: center;
            color: #b0a89f;
            font-size: 13px;
        }


        /* ================= BUTTONS ================= */

        .btn-group {
            display: flex;
            gap: 12px;
            margin-top: 28px;
        }

        .btn {
            flex: 1;
            text-align: center;
            text-decoration: none;
            padding: 13px;
            border-radius: 10px;
            font-size: 14px;
            font-weight: 600;
            transition: 0.3s;
        }

        .btn-primary {
            background: #e23744;
            color: white;
        }

        .btn-primary:hover {
            background: #ff4d5a;
            transform: translateY(-2px);
        }

        .btn-secondary {
            background: #141110;
            color: #e8e2dd;
            border: 1px solid rgba(255,255,255,0.1);
        }

        .btn-secondary:hover {
            background: #241c17;
            transform: translateY(-2px);
        }


        /* ================= MOBILE ================= */

        @media (max-width: 600px) {

            .navbar {
                padding: 0 20px;
            }

            .nav-links {
                gap: 12px;
            }

            .nav-links a {
                font-size: 12px;
            }

            .profile-card {
                padding: 25px 20px;
            }

            .container {
                padding: 30px 15px;
            }

            .btn-group {
                flex-direction: column;
            }

            .order-info p {
                flex-direction: column;
                gap: 4px;
            }

            /* Smaller orders area on mobile */
            .orders-section {
                max-height: 350px;
            }
        }

    </style>

</head>


<body>


<%

    /* ================= GET LOGGED-IN USER ================= */

    User user =
        (User) session.getAttribute("loggedInUser");

    if (user == null) {

        response.sendRedirect("login.html");

        return;
    }


    /* ================= GET USER ORDERS ================= */

    OrderDAOImpl orderDAO =
        new OrderDAOImpl();

    List<Order> orders =
        orderDAO.getOrdersByUserId(
            user.getUserId()
        );

%>


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
            Restaurants
        </a>

        <a href="Cart.jsp">
            Cart
        </a>

        <a href="ProfileServlet">
            Profile
        </a>

        <a href="logout">
            Logout
        </a>

    </div>

</nav>


<!-- ================= PROFILE CONTAINER ================= -->

<div class="container">

    <div class="profile-card">


        <!-- ================= AVATAR ================= -->

        <div class="avatar">

            <%= user.getUserName()
                    .substring(0,1)
                    .toUpperCase() %>

        </div>


        <!-- ================= USER NAME ================= -->

        <h2>

            <%= user.getUserName() %>

        </h2>


        <!-- ================= ROLE ================= -->

        <span class="role-badge">

            <%= user.getRole() %>

        </span>


        <!-- ================= EMAIL ================= -->

        <div class="info-group">

            <label>
                Email
            </label>

            <div class="info-value">

                <%= user.getEmail() %>

            </div>

        </div>


        <!-- ================= ADDRESS ================= -->

        <div class="info-group">

            <label>
                Address
            </label>

            <div class="info-value">

                <%= user.getAddress() %>

            </div>

        </div>


        <!-- ================= ACCOUNT CREATED ================= -->

        <div class="info-group">

            <label>
                Account Created
            </label>

            <div class="info-value">

                <%= user.getCreateDate() %>

            </div>

        </div>


        <!-- ================= LAST LOGIN ================= -->

        <div class="info-group">

            <label>
                Last Login
            </label>

            <div class="info-value">

                <%= user.getLastLoginDate() %>

            </div>

        </div>


        <!-- ================= MY ORDERS ================= -->

        <div class="orders-section">

            <h3>
                📦 My Orders
            </h3>


            <% if (orders == null || orders.isEmpty()) { %>


                <div class="empty-orders">

                    You haven't placed any orders yet.

                </div>


            <% } else { %>


                <% for (Order order : orders) { %>


                    <div class="order-card">


                        <div class="order-top">

                            <strong>

                                Order #<%= order.getOrderID() %>

                            </strong>


                            <span class="status">

                                <%= order.getStatus() %>

                            </span>

                        </div>


                        <div class="order-info">


                            <p>

                                <span>
                                    📅 Date
                                </span>

                                <%= order.getOrderDate() %>

                            </p>


                            <p>

                                <span>
                                    💰 Total
                                </span>

                                ₹<%= String.format(
                                    "%.0f",
                                    order.getTotalAmount()
                                ) %>

                            </p>


                            <p>

                                <span>
                                    💳 Payment
                                </span>

                                <%= order.getPaymentMethod() %>

                            </p>


                            <p>

                                <span>
                                    🍴 Restaurant
                                </span>

                                #<%= order.getRestaurantID() %>

                            </p>


                        </div>

                    </div>


                <% } %>


            <% } %>

        </div>


        <!-- ================= BUTTONS ================= -->

        <div class="btn-group">

            <a href="Restaurant"
               class="btn btn-primary">

                🍔 Order Food

            </a>


            <a href="logout"
               class="btn btn-secondary">

                Logout

            </a>

        </div>


    </div>

</div>


</body>

</html>
```
