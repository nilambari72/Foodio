<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.tap.model.Menu" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Foodio - Menu</title>

    <link rel="preconnect"
          href="https://fonts.googleapis.com">

    <link rel="preconnect"
          href="https://fonts.gstatic.com" crossorigin>

    <link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;600;700&family=Nunito:wght@400;600;700;800&display=swap"
          rel="stylesheet">


    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'DM Sans', sans-serif;
            background: #f8f8f8;
            color: #222;
        }


        /* ================= NAVBAR ================= */

        .navbar {
            width: 100%;
            height: 72px;

            background: rgba(255, 255, 255, 0.16);

            backdrop-filter: blur(18px);
            -webkit-backdrop-filter: blur(18px);

            border-bottom: 1px solid rgba(255, 255, 255, 0.25);

            display: flex;
            align-items: center;
            justify-content: space-between;

            padding: 0 7%;

            position: fixed;
            top: 0;
            left: 0;

            z-index: 1000;

            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
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
            font-family: 'Nunito', sans-serif;

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

            align-items: center;

            gap: 30px;
        }


        .nav-links a {
            text-decoration: none;

            color: white;

            font-size: 16px;

            font-weight: 600;

            transition: 0.3s;

            text-shadow:
                0 2px 6px rgba(0, 0, 0, 0.3);
        }


        .nav-links a:hover {
            color: #ff6670;
        }


        .login-btn {
            padding: 10px 20px;

            border: 1px solid rgba(255, 255, 255, 0.7);

            border-radius: 8px;

            color: white !important;

            background: rgba(255, 255, 255, 0.08);
        }


        .login-btn:hover {
            background: #e23744;

            border-color: #e23744;

            color: white !important;
        }


        .signup-btn {
            padding: 10px 20px;

            background: #e23744;

            color: white !important;

            border-radius: 8px;
        }


        .signup-btn:hover {
            background: #c91f2d;
        }


        /* ================= HERO ================= */

        .menu-hero {

            position: relative;

            height: 500px;

            width: 100%;

            display: flex;

            align-items: center;

            justify-content: center;

            text-align: center;

            color: white;

            overflow: hidden;
        }


        /* ================= BACKGROUND VIDEO ================= */

        .menu-background-video {

            position: absolute;

            top: 0;
            left: 0;

            width: 100%;
            height: 100%;

            object-fit: cover;

            z-index: 0;
        }


        /* ================= VIDEO OVERLAY ================= */

        .menu-hero::after {

            content: "";

            position: absolute;

            top: 0;
            left: 0;

            width: 100%;
            height: 100%;

            background:
                linear-gradient(
                    rgba(0, 0, 0, 0.58),
                    rgba(0, 0, 0, 0.58)
                );

            z-index: 1;
        }


        /* ================= HERO CONTENT ================= */

        .hero-content {

            position: relative;

            z-index: 2;

            padding: 20px;
        }


        .hero-content h1 {

            font-family: 'Nunito', sans-serif;

            font-size: 52px;

            font-weight: 800;

            margin-bottom: 10px;

            text-shadow:
                0 4px 15px rgba(0, 0, 0, 0.45);
        }


        .hero-content p {

            font-size: 18px;

            opacity: 0.95;

            text-shadow:
                0 2px 8px rgba(0, 0, 0, 0.4);
        }


        /* ================= MENU SECTION ================= */

        .menu-section {

            width: 86%;

            margin: 55px auto;
        }


        .section-heading {

            text-align: center;

            margin-bottom: 40px;
        }


        .section-heading h2 {

            font-family: 'Nunito', sans-serif;

            font-size: 34px;

            font-weight: 800;

            color: #222;
        }


        .section-heading p {

            margin-top: 8px;

            color: #777;

            font-size: 16px;
        }


        /* ================= MENU GRID ================= */

        .menu-grid {

            display: grid;

            grid-template-columns:
                repeat(3, 1fr);

            gap: 30px;
        }


        /* ================= MENU CARD ================= */

        .menu-card {

            background: white;

            border-radius: 16px;

            overflow: hidden;

            box-shadow:
                0 5px 18px rgba(0,0,0,0.08);

            transition: all 0.3s ease;

            animation: fadeUp 0.6s ease;
        }


        .menu-card:hover {

            transform: translateY(-8px);

            box-shadow:
                0 14px 32px rgba(0,0,0,0.14);
        }


        /* ================= IMAGE ================= */

        .menu-image-container {

            width: 100%;

            height: 220px;

            position: relative;

            overflow: hidden;

            background: #eee;
        }


        .menu-image-container img {

            width: 100%;

            height: 100%;

            object-fit: cover;

            display: block;

            transition:
                transform 0.4s ease;
        }


        .menu-card:hover
        .menu-image-container img {

            transform: scale(1.08);
        }


        /* ================= AVAILABILITY ================= */

        .availability {

            position: absolute;

            top: 15px;

            right: 15px;

            padding: 7px 13px;

            border-radius: 20px;

            font-size: 13px;

            font-weight: 700;

            background: white;

            box-shadow:
                0 3px 10px rgba(0,0,0,0.15);
        }


        .available {

            color: #188038;
        }


        .not-available {

            color: #d93025;
        }


        /* ================= CARD CONTENT ================= */

        .menu-content {

            padding: 22px;
        }


        .menu-name {

            font-family: 'Nunito', sans-serif;

            font-size: 22px;

            font-weight: 800;

            color: #222;

            margin-bottom: 7px;
        }


        .menu-id {

            font-size: 13px;

            color: #999;

            margin-bottom: 12px;
        }


        .menu-description {

            color: #666;

            font-size: 14px;

            line-height: 1.6;

            min-height: 45px;

            margin-bottom: 18px;
        }


        /* ================= BOTTOM ================= */

        .menu-bottom {

            display: flex;

            align-items: center;

            justify-content: space-between;

            margin-top: 10px;
        }


        .price {

            font-family: 'Nunito', sans-serif;

            font-size: 23px;

            font-weight: 800;

            color: #e23744;
        }


        /* ================= ADD BUTTON ================= */

        .add-button {

            border: none;

            background: #e23744;

            color: white;

            padding: 11px 20px;

            border-radius: 8px;

            font-size: 14px;

            font-weight: 700;

            cursor: pointer;

            transition: 0.3s;
        }


        .add-button:hover {

            background: #c91f2d;

            transform: scale(1.04);
        }


        .disabled-button {

            background: #aaa;

            cursor: not-allowed;
        }


        .disabled-button:hover {

            background: #aaa;

            transform: none;
        }


        /* ================= NO MENU ================= */

        .no-menu {

            grid-column: 1 / -1;

            text-align: center;

            padding: 70px 20px;

            background: white;

            border-radius: 15px;

            box-shadow:
                0 5px 18px rgba(0,0,0,0.06);
        }


        .no-menu h3 {

            font-family: 'Nunito', sans-serif;

            font-size: 25px;

            margin-bottom: 10px;

            color: #333;
        }


        .no-menu p {

            color: #777;

            font-size: 15px;
        }


        /* ================= FOOTER ================= */

        footer {

            background: #222;

            color: white;

            margin-top: 70px;

            padding: 40px 7%;

            text-align: center;
        }


        .footer-logo {

            font-family: 'Nunito', sans-serif;

            font-size: 28px;

            font-weight: 800;

            color: #e23744;

            margin-bottom: 10px;
        }


        footer p {

            color: #aaa;

            font-size: 14px;
        }


        /* ================= ANIMATION ================= */

        @keyframes fadeUp {

            from {

                opacity: 0;

                transform: translateY(25px);
            }

            to {

                opacity: 1;

                transform: translateY(0);
            }
        }


        /* ================= RESPONSIVE ================= */

        @media (max-width: 1000px) {

            .menu-grid {

                grid-template-columns:
                    repeat(2, 1fr);
            }
        }


        @media (max-width: 650px) {

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

                gap: 10px;
            }


            .nav-links a {

                font-size: 13px;
            }


            .menu-grid {

                grid-template-columns: 1fr;
            }


            .menu-section {

                width: 90%;
            }


            .menu-hero {

                height: 430px;
            }


            .hero-content h1 {

                font-size: 36px;
            }


            .hero-content p {

                font-size: 15px;
            }

        }

    </style>

</head>


<body>


    <!-- ================= NAVBAR ================= -->

    <nav class="navbar">

        <a href="index.html" class="logo">

            <div class="logo-icon">
                🍴
            </div>

            <div class="logo-text">
                Food<span>io</span>
            </div>

        </a>


        <div class="nav-links">

            <a href="index.html">
                Home
            </a>

            <a href="Restaurant">
                Restaurants
            </a>

            <a href="register.html" class="signup-btn">
                Sign Up
            </a>

            <a href="login.html" class="login-btn">
                Login
            </a>

        </div>

    </nav>


    <!-- ================= HERO ================= -->

    <section class="menu-hero">


        <!-- LOOPING BACKGROUND VIDEO -->

        <video
            class="menu-background-video"
            autoplay
            muted
            loop
            playsinline>

            <source
                src="<%= request.getContextPath() %>/images/VID.mp4"
                type="video/mp4">

        </video>


        <div class="hero-content">

            <h1>
                Delicious Menu
            </h1>

            <p>
                Explore delicious dishes and order your favourites
            </p>

        </div>

    </section>


    <!-- ================= MENU SECTION ================= -->

    <section class="menu-section">


        <div class="section-heading">

            <h2>
                Our Menu
            </h2>

            <p>
                Fresh, delicious and made with love ❤️
            </p>

        </div>


        <!-- ================= MENU GRID ================= -->

        <div class="menu-grid">


            <%

                List<Menu> menus =
                    (List<Menu>) request.getAttribute("menus");


                if (menus != null && !menus.isEmpty()) {


                    for (Menu menu : menus) {

            %>


            <!-- ================= MENU CARD ================= -->

            <div class="menu-card">


                <!-- IMAGE -->

                <div class="menu-image-container">

                    <img
                        src="<%= request.getContextPath() %>/<%= menu.getImagePath() %>"
                        alt="<%= menu.getItemName() %>"
                        onerror="this.src='<%= request.getContextPath() %>/images/food-default.jpg';"
                    >


                    <!-- AVAILABILITY -->

                    <% if (menu.isAvailable()) { %>

                        <span class="availability available">

                            ● Available

                        </span>

                    <% } else { %>

                        <span class="availability not-available">

                            ● Not Available

                        </span>

                    <% } %>

                </div>


                <!-- CARD CONTENT -->

                <div class="menu-content">


                    <!-- MENU NAME -->

                    <div class="menu-name">

                        <%= menu.getItemName() %>

                    </div>


                    <!-- MENU ID -->

                    <div class="menu-id">

                        Menu ID:

                        <%= menu.getMenuId() %>

                    </div>


                    <!-- DESCRIPTION -->

                    <p class="menu-description">

                        <%= menu.getDescription() %>

                    </p>


                    <!-- PRICE + BUTTON -->

                    <div class="menu-bottom">


                        <div class="price">

                            ₹<%= String.format("%.2f", menu.getPrice()) %>

                        </div>


                        <% if (menu.isAvailable()) { %>

                            <form
                                action="<%= request.getContextPath() %>/callCartServlet"
                                method="post">

                                <input
                                    type="hidden"
                                    name="action"
                                    value="add">

                                <input
                                    type="hidden"
                                    name="menuId"
                                    value="<%= menu.getMenuId() %>">

                                <input
                                    type="hidden"
                                    name="restaurantId"
                                    value="<%= menu.getRestaurantId() %>">

                                <input
                                    type="hidden"
                                    name="quantity"
                                    value="1">

                                <button
                                    type="submit"
                                    class="add-button">

                                    Add to Cart

                                </button>

                            </form>

                        <% } else { %>

                            <button
                                class="add-button disabled-button"
                                disabled>

                                Unavailable

                            </button>

                        <% } %>


                    </div>

                </div>

            </div>


            <%

                    }

                } else {

            %>


                <!-- ================= NO MENU ================= -->

                <div class="no-menu">

                    <h3>

                        No menu items found.

                    </h3>

                    <p>

                        This restaurant currently has no menu items available.

                    </p>

                </div>


            <%

                }

            %>


        </div>

    </section>


    <!-- ================= FOOTER ================= -->

    <footer>

        <div class="footer-logo">

            Foodio

        </div>

        <p>

            Delicious food delivered to your doorstep.

        </p>

        <p style="margin-top: 10px;">

            © 2026 Foodio. All Rights Reserved.

        </p>

    </footer>


</body>

</html>