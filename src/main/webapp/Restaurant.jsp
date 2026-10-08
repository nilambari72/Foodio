<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.tap.model.Restaurant"%>

<!DOCTYPE html>

<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
    content="width=device-width, initial-scale=1.0">

<title>Foodio - Good Food. Good Mood.</title>


<style>

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

html {
    scroll-behavior: smooth;
}

body {
    font-family: Arial, Helvetica, sans-serif;
    background: #fff;
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

    /* GLASS NAVBAR */

    background: rgba(255, 255, 255, 0.12);

    backdrop-filter: blur(12px);

    -webkit-backdrop-filter: blur(12px);

    border-bottom: 1px solid rgba(255, 255, 255, 0.2);

    position: absolute;

    top: 0;

    left: 0;

    z-index: 1000;
}


/* ================= LOGO ================= */

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

    background: #e23744;

    display: flex;

    align-items: center;

    justify-content: center;

    font-size: 23px;
}


.logo-text {

    font-size: 28px;

    font-weight: 800;

    color: white;
}


.logo-text span {

    color: #e23744;
}


/* ================= NAV LINKS ================= */

.nav-links {

    display: flex;

    align-items: center;

    gap: 12px;
}


.nav-links a {

    text-decoration: none;

    color: white;

    font-size: 15px;

    font-weight: 600;

    padding: 11px 18px;

    border-radius: 8px;

    transition: .3s;
}


.nav-links a:hover {

    color: #e23744;

    background: rgba(255,255,255,0.15);
}


/* ================= SIGN UP ================= */

.signup-btn {

    border: 1px solid #e23744;

    color: white !important;
}


.signup-btn:hover {

    background: #e23744 !important;

    color: white !important;
}


/* ================= LOGIN ================= */

.login-btn {

    background: #e23744;

    color: white !important;
}


.login-btn:hover {

    background: #c91f2d !important;

    color: white !important;
}


/* ================= HERO ================= */

.hero {

    height: 620px;

    position: relative;

    overflow: hidden;

    display: flex;

    align-items: center;

    justify-content: center;
}


.hero-video {

    position: absolute;

    top: 0;

    left: 0;

    width: 100%;

    height: 100%;

    object-fit: cover;

    z-index: 0;
}


.hero-overlay {

    position: absolute;

    inset: 0;

    background:
        linear-gradient(
            90deg,
            rgba(0,0,0,0.72),
            rgba(0,0,0,0.45),
            rgba(0,0,0,0.30)
        );

    z-index: 1;
}


.hero-content {

    position: relative;

    z-index: 2;

    width: 90%;

    max-width: 900px;

    text-align: center;

    color: white;
}


.hero-content h1 {

    font-size: 58px;

    line-height: 1.1;

    margin-bottom: 20px;

    font-weight: 800;

    text-shadow:
        0 3px 10px rgba(0,0,0,0.5);
}


.hero-content h1 span {

    color: #e23744;
}


.hero-content p {

    font-size: 20px;

    line-height: 1.6;

    margin-bottom: 35px;

    color: #f5f5f5;

    text-shadow:
        0 2px 8px rgba(0,0,0,0.6);
}


.food-message {

    display: inline-block;

    padding: 12px 24px;

    margin-bottom: 25px;

    border-radius: 50px;

    background: rgba(255,255,255,0.15);

    border: 1px solid rgba(255,255,255,0.35);

    backdrop-filter: blur(8px);

    font-size: 15px;

    font-weight: 600;

    letter-spacing: .5px;

    color: white;

    animation: messageFloat 3s ease-in-out infinite;
}


@keyframes messageFloat {

    0%, 100% {
        transform: translateY(0);
    }

    50% {
        transform: translateY(-5px);
    }
}


/* ================= SEARCH ================= */

.search-box {

    width: 100%;

    max-width: 650px;

    margin: auto;

    display: flex;

    align-items: center;

    background: white;

    border-radius: 14px;

    padding: 7px;

    box-shadow:
        0 10px 35px rgba(0,0,0,0.25);
}


.search-box input {

    flex: 1;

    border: none;

    outline: none;

    padding: 17px 18px;

    font-size: 16px;

    border-radius: 10px;
}


.search-btn {

    border: none;

    background: #e23744;

    color: white;

    padding: 16px 25px;

    border-radius: 10px;

    font-size: 15px;

    font-weight: 700;

    cursor: pointer;

    transition: .3s;
}


.search-btn:hover {

    background: #c91f2d;
}


/* ================= COMMON SECTION ================= */

.section {

    padding: 75px 7%;
}


.section-title {

    text-align: center;

    margin-bottom: 45px;
}


.section-title h2 {

    font-size: 36px;

    margin-bottom: 10px;
}


.section-title p {

    color: #777;

    font-size: 16px;
}


/* ================= FEATURES ================= */

.features {

    background: #fff8f5;
}


.feature-grid {

    display: grid;

    grid-template-columns: repeat(3,1fr);

    gap: 25px;

    max-width: 1100px;

    margin: auto;
}


.feature-card {

    background: white;

    padding: 35px 25px;

    text-align: center;

    border-radius: 18px;

    box-shadow:
        0 5px 20px rgba(0,0,0,0.06);

    transition: .3s;
}


.feature-card:hover {

    transform: translateY(-7px);

    box-shadow:
        0 12px 30px rgba(0,0,0,0.10);
}


.feature-icon {

    font-size: 40px;

    margin-bottom: 18px;
}


.feature-card h3 {

    font-size: 20px;

    margin-bottom: 10px;
}


.feature-card p {

    color: #777;

    line-height: 1.6;
}


/* ================= CATEGORIES ================= */

.categories {

    background: white;
}


.category-grid {

    display: grid;

    grid-template-columns: repeat(6,1fr);

    gap: 22px;
}


.category-card {

    text-align: center;

    text-decoration: none;

    color: #222;

    transition: .3s;
}


.category-card:hover {

    transform: translateY(-8px);
}


.category-image {

    width: 125px;

    height: 125px;

    margin: auto auto 15px;

    border-radius: 50%;

    overflow: hidden;

    box-shadow:
        0 5px 18px rgba(0,0,0,0.12);
}


.category-image img {

    width: 100%;

    height: 100%;

    object-fit: cover;

    transition: .4s;
}


.category-card:hover .category-image img {

    transform: scale(1.1);
}


.category-card h3 {

    font-size: 17px;
}


/* ================= RESTAURANTS ================= */

.restaurants {

    background: #f8f8f8;
}


.restaurant-grid {

    display: grid;

    grid-template-columns: repeat(3,1fr);

    gap: 28px;
}


.restaurant-card {

    background: white;

    border-radius: 18px;

    overflow: hidden;

    box-shadow:
        0 5px 20px rgba(0,0,0,0.07);

    transition: .3s;
}


.restaurant-card:hover {

    transform: translateY(-8px);

    box-shadow:
        0 15px 35px rgba(0,0,0,0.12);
}


.restaurant-image {

    width: 100%;

    height: 220px;

    overflow: hidden;
}


.restaurant-image img {

    width: 100%;

    height: 100%;

    object-fit: cover;

    transition: .4s;
}


.restaurant-card:hover .restaurant-image img {

    transform: scale(1.06);
}


.restaurant-content {

    padding: 22px;
}


.restaurant-content h3 {

    font-size: 21px;

    margin-bottom: 12px;
}


/* ================= RESTAURANT INFORMATION ================= */

.restaurant-info {

    display: flex;

    flex-direction: column;

    align-items: flex-start;

    gap: 8px;

    margin-bottom: 14px;

    color: #666;

    font-size: 14px;
}


.rating-row {

    display: flex;

    align-items: center;

    gap: 10px;
}


.rating {

    display: inline-flex;

    align-items: center;

    justify-content: center;

    gap: 3px;

    background: #e8f7ed;

    color: #168a42;

    padding: 4px 7px;

    border-radius: 5px;

    font-size: 13px;

    font-weight: 600;

    line-height: 1;

    white-space: nowrap;
}


.delivery-time,
.cuisine-type,
.restaurant-location {

    display: flex;

    align-items: center;

    gap: 4px;
}


.restaurant-location {

    margin-bottom: 12px;

    color: #666;

    font-size: 14px;
}


.active {

    display: inline-block;

    color: #168a42;

    font-size: 13px;

    font-weight: 600;

    margin-bottom: 12px;
}


.inactive {

    display: inline-block;

    color: #d93025;

    font-size: 13px;

    font-weight: 600;

    margin-bottom: 12px;
}


/* ================= VIEW RESTAURANT BUTTON ================= */

.view-button {

    display: inline-block;

    text-decoration: none;

    background: #e23744;

    color: white;

    padding: 11px 18px;

    border-radius: 8px;

    font-size: 14px;

    font-weight: 600;

    transition: .3s;
}


.view-button:hover {

    background: #c91f2d;

    transform: translateX(3px);
}


/* ================= SEARCH RESULT MESSAGE ================= */

.no-result {

    display: none;

    text-align: center;

    padding: 40px 20px;

    color: #777;

    grid-column: 1 / -1;
}


.no-result h3 {

    color: #444;

    margin-bottom: 8px;
}


/* ================= FOOTER ================= */

.footer {

    background: #181818;

    color: white;

    padding: 55px 7% 20px;
}


.footer-container {

    display: grid;

    grid-template-columns: 2fr 1fr 1fr 1fr;

    gap: 45px;

    max-width: 1200px;

    margin: auto;
}


.footer-logo {

    font-size: 28px;

    font-weight: 800;

    margin-bottom: 15px;
}


.footer-logo span {

    color: #e23744;
}


.footer-about p {

    color: #aaa;

    line-height: 1.7;

    max-width: 350px;
}


.footer-column h3 {

    font-size: 17px;

    margin-bottom: 20px;
}


.footer-column a {

    display: block;

    text-decoration: none;

    color: #aaa;

    margin-bottom: 12px;

    transition: .3s;
}


.footer-column a:hover {

    color: #e23744;

    transform: translateX(3px);
}


.footer-bottom {

    border-top: 1px solid #333;

    margin-top: 45px;

    padding-top: 20px;

    text-align: center;

    color: #888;

    font-size: 14px;
}


/* ================= TABLET ================= */

@media(max-width:900px) {

    .hero-content h1 {
        font-size: 45px;
    }

    .category-grid {
        grid-template-columns: repeat(3,1fr);
    }

    .restaurant-grid {
        grid-template-columns: repeat(2,1fr);
    }

    .feature-grid {
        grid-template-columns: 1fr;
    }

    .footer-container {
        grid-template-columns: repeat(2,1fr);
    }

}


/* ================= MOBILE ================= */

@media(max-width:650px) {

    .navbar {
        padding: 0 4%;
    }

    .nav-links {
        gap: 2px;
    }

    .nav-links a {
        padding: 8px 7px;
        font-size: 13px;
    }

    .logo-text {
        font-size: 23px;
    }

    .logo-icon {
        width: 36px;
        height: 36px;
        font-size: 19px;
    }

    .hero {
        height: 580px;
    }

    .hero-content h1 {
        font-size: 37px;
    }

    .hero-content p {
        font-size: 16px;
    }

    .search-box {
        flex-direction: column;
        background: transparent;
        box-shadow: none;
    }

    .search-box input {
        width: 100%;
        margin-bottom: 8px;
    }

    .search-btn {
        width: 100%;
    }

    .category-grid {
        grid-template-columns: repeat(2,1fr);
    }

    .restaurant-grid {
        grid-template-columns: 1fr;
    }

    .footer-container {
        grid-template-columns: 1fr;
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

        <a href="#restaurants">
            Restaurants
        </a>

        <a href="Cart.jsp">
            Cart
        </a>

        <a href="login.html">
            Login
        </a>

        <a href="signup.jsp" class="signup-btn">
            Sign Up
        </a>

        <a href="Profile.jsp">
            Profile
        </a>

    </div>

</nav>


<!-- ================= HERO ================= -->

<section class="hero">


    <video
        class="hero-video"
        autoplay
        muted
        loop
        playsinline>

        <source
            src="images/food-video.mp4"
            type="video/mp4">

        Your browser does not support video.

    </video>


    <div class="hero-overlay"></div>


    <div class="hero-content">


        <div class="food-message">

            🔥 Freshly cooked. Hot. Delicious.
            Delivered to you.

        </div>


        <h1>

            Good Food.
            <span>Good Mood.</span>

        </h1>


        <p>

            Discover delicious food from your favourite
            restaurants and get it delivered right to your door.

        </p>


        <!-- SEARCH -->

        <div class="search-box">

            <input
                type="text"
                id="searchInput"
                placeholder="Search for restaurants or dishes..."
                onkeyup="searchRestaurants()">


            <button
                type="button"
                class="search-btn"
                onclick="searchRestaurants()">

                Search

            </button>

        </div>


    </div>

</section>


<!-- ================= FEATURES ================= -->

<section class="section features">


    <div class="section-title">

        <h2>
            Why Choose Foodio?
        </h2>

        <p>
            Everything you need for a delicious food experience.
        </p>

    </div>


    <div class="feature-grid">


        <div class="feature-card">

            <div class="feature-icon">
                ⚡
            </div>

            <h3>
                Lightning Fast
            </h3>

            <p>
                Hot food at your door
            </p>

        </div>


        <div class="feature-card">

            <div class="feature-icon">
                🥗
            </div>

            <h3>
                Fresh & Quality
            </h3>

            <p>
                Delicious food made fresh
            </p>

        </div>


        <div class="feature-card">

            <div class="feature-icon">
                🎁
            </div>

            <h3>
                Great Offers
            </h3>

            <p>
                Delicious food, better prices
            </p>

        </div>


    </div>

</section>


<!-- ================= CATEGORIES ================= -->

<section class="section categories">


    <div class="section-title">

        <h2>
            Explore Food Categories
        </h2>

        <p>
            Find something delicious for every craving.
        </p>

    </div>


    <div class="category-grid">


        <a href="#" class="category-card">

            <div class="category-image">

                <img
                    src="images/pizza.jpg"
                    alt="Pizza">

            </div>

            <h3>
                Pizza
            </h3>

        </a>


        <a href="#" class="category-card">

            <div class="category-image">

                <img
                    src="images/burger.jpg"
                    alt="Burgers">

            </div>

            <h3>
                Burgers
            </h3>

        </a>


        <a href="#" class="category-card">

            <div class="category-image">

                <img
                    src="images/biryani.jpg"
                    alt="Biryani">

            </div>

            <h3>
                Biryani
            </h3>

        </a>


        <a href="#" class="category-card">

            <div class="category-image">

                <img
                    src="images/chinese.jpg"
                    alt="Chinese">

            </div>

            <h3>
                Chinese
            </h3>

        </a>


        <a href="#" class="category-card">

            <div class="category-image">

                <img
                    src="images/dessert.jpg"
                    alt="Desserts">

            </div>

            <h3>
                Desserts
            </h3>

        </a>


        <a href="#" class="category-card">

            <div class="category-image">

                <img
                    src="images/beverages.jpg"
                    alt="Beverages">

            </div>

            <h3>
                Beverages
            </h3>

        </a>


    </div>

</section>


<!-- ================= RESTAURANTS ================= -->

<section
    class="section restaurants"
    id="restaurants">


    <div class="section-title">

        <h2>
            Popular Restaurants
        </h2>

        <p>
            Explore delicious food from restaurants near you.
        </p>

    </div>


    <div class="restaurant-grid">


<%

List<Restaurant> allRestaurants =
    (List<Restaurant>)
    request.getAttribute("allRestaurants");


if (allRestaurants != null &&
    !allRestaurants.isEmpty()) {


    for (Restaurant restaurant :
         allRestaurants) {

%>


        <!-- RESTAURANT CARD -->

        <div
            class="restaurant-card"
            data-name="<%= restaurant.getName() %>"
            data-cuisine="<%= restaurant.getCuisineType() %>"
            data-address="<%= restaurant.getAddress() %>">


            <div class="restaurant-image">

                <img
                    src="<%= restaurant.getImagePath() %>"
                    alt="<%= restaurant.getName() %>">

            </div>


            <div class="restaurant-content">


                <h3>
                    <%= restaurant.getName() %>
                </h3>


                <div class="restaurant-info">


                    <div class="rating-row">


                        <span class="rating">

                            ⭐
                            <%= restaurant.getRating() %>

                        </span>


                        <!-- DELIVERY TIME -->

                        <span class="delivery-time">

                            ⚡
                            <%= restaurant.getDeliveryTime() %>
                            mins

                        </span>


                    </div>


                    <span class="cuisine-type">

                        🍽️
                        <%= restaurant.getCuisineType() %>

                    </span>


                </div>


                <div class="restaurant-location">

                    📍
                    <%= restaurant.getAddress() %>

                </div>


<%

                if (restaurant.isIsActive()) {

%>


                <span class="active">

                    ● Open

                </span>


<%

                } else {

%>


                <span class="inactive">

                    ● Closed

                </span>


<%

                }

%>


                <br>


                <a
                    href="MenuServlet?restaurantId=<%= restaurant.getRestaurantId() %>"
                    class="view-button">

                    View Restaurant →

                </a>


            </div>

        </div>


<%

    }

} else {

%>


        <div
            style="
                grid-column:1/-1;
                text-align:center;
                padding:50px;
                color:#777;
            ">

            <h3>
                No restaurants available
            </h3>

            <p>
                Please check back later.
            </p>

        </div>


<%

}

%>


        <!-- SEARCH NO RESULT MESSAGE -->

        <div
            id="noResult"
            class="no-result">

            <h3>
                No restaurants found 😔
            </h3>

            <p>
                Try searching for another restaurant or cuisine.
            </p>

        </div>


    </div>

</section>


<!-- ================= FOOTER ================= -->

<footer class="footer">


    <div class="footer-container">


        <div class="footer-about">

            <div class="footer-logo">

                Food<span>io</span>

            </div>

            <p>

                Bringing delicious food from your
                favourite restaurants straight to your
                doorstep.

            </p>

        </div>


        <div class="footer-column">

            <h3>
                Company
            </h3>

            <a href="index.html">
                Home
            </a>

            <a href="#">
                About Us
            </a>

            <a href="#">
                Careers
            </a>

        </div>


        <div class="footer-column">

            <h3>
                Support
            </h3>

            <a href="#">
                Help Center
            </a>

            <a href="#">
                Contact Us
            </a>

            <a href="#">
                Terms & Conditions
            </a>

        </div>


        <div class="footer-column">

            <h3>
                Follow Us
            </h3>

            <a href="#">
                Instagram
            </a>

            <a href="#">
                Facebook
            </a>

            <a href="#">
                LinkedIn
            </a>

        </div>


    </div>


    <div class="footer-bottom">

        © 2026 Foodio. All Rights Reserved.

    </div>


</footer>


<!-- ================= SEARCH JAVASCRIPT ================= -->

<script>

function searchRestaurants() {

    let searchText =
        document
            .getElementById("searchInput")
            .value
            .toLowerCase()
            .trim();


    let restaurants =
        document.querySelectorAll(
            ".restaurant-card"
        );


    let found = false;


    restaurants.forEach(function(card) {

        let name =
            card
                .getAttribute("data-name")
                .toLowerCase();


        let cuisine =
            card
                .getAttribute("data-cuisine")
                .toLowerCase();


        let address =
            card
                .getAttribute("data-address")
                .toLowerCase();


        if (
            name.includes(searchText) ||
            cuisine.includes(searchText) ||
            address.includes(searchText)
        ) {

            card.style.display = "";

            found = true;

        } else {

            card.style.display = "none";

        }

    });


    let noResult =
        document.getElementById("noResult");


    if (
        searchText !== "" &&
        !found
    ) {

        noResult.style.display = "block";

    } else {

        noResult.style.display = "none";

    }


    if (searchText !== "") {

        document
            .getElementById("restaurants")
            .scrollIntoView({
                behavior: "smooth"
            });

    }

}

</script>


</body>

</html>