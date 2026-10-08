```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>Foodio | Sign Up</title>


<style>

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: Arial, Helvetica, sans-serif;
}


/* ================= BODY ================= */

body {
    min-height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 20px 0;
    position: relative;
    overflow-x: hidden;
}


/* ================= BACKGROUND VIDEO ================= */

.background-video {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    object-fit: cover;
    z-index: -2;
}


/* ================= VIDEO OVERLAY ================= */

.video-overlay {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.68);
    z-index: -1;
}


/* ================= CONTAINER ================= */

.container {
    width: 400px;

    /* ONLY CHANGE: FORM MADE SLIGHTLY DARKER */
    background: rgba(18, 13, 10, 0.97);

    border: 1px solid rgba(255,255,255,0.08);
    padding: 20px 30px;
    border-radius: 18px;
    box-shadow: 0 20px 50px rgba(0,0,0,0.4);
    backdrop-filter: blur(10px);
    -webkit-backdrop-filter: blur(10px);
}


/* ================= LOGO ================= */

.logo {
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 8px;
    margin-bottom: 10px;
}


.logo-icon {
    width: 36px;
    height: 36px;
    border-radius: 10px;
    background: #e23744;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 19px;
}


.logo-text {
    font-size: 22px;
    font-weight: 800;
    color: #f2ede8;
}


.logo-text span {
    color: #ff8a5c;
}


/* ================= HEADING ================= */

h2 {
    text-align: center;
    color: #f2ede8;
    margin-bottom: 3px;
    font-size: 20px;
}


.subtitle {
    text-align: center;
    color: #b0a89f;
    font-size: 12px;
    margin-bottom: 12px;
}


/* ================= ERROR ================= */

.error-box {
    background: rgba(217,48,37,0.12);
    border: 1px solid rgba(217,48,37,0.4);
    color: #ff6b5c;
    padding: 7px 10px;
    border-radius: 8px;
    font-size: 12px;
    margin-bottom: 10px;
    text-align: center;
}


/* ================= LABEL ================= */

label {
    display: block;
    color: #b0a89f;
    font-size: 12px;
    font-weight: 600;
    margin-bottom: 3px;
}


/* ================= INPUT ================= */

input,
textarea {
    width: 100%;
    padding: 8px 11px;
    margin-bottom: 9px;
    border: 1px solid rgba(255,255,255,0.1);
    outline: none;
    border-radius: 8px;
    font-size: 13px;
    background: #141110;
    color: #f2ede8;
    resize: none;
}


input:focus,
textarea:focus {
    border-color: #e23744;
}


/* ================= ROLE ================= */

.role-title {
    color: #b0a89f;
    font-size: 12px;
    font-weight: 600;
    margin-bottom: 5px;
}


.role-options {
    display: flex;
    gap: 8px;
    margin-bottom: 12px;
}


.role-option {
    flex: 1;
    position: relative;
}


.role-option input {
    position: absolute;
    opacity: 0;
    width: 0;
    height: 0;
}


.role-option label {
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 8px;
    margin: 0;
    border: 1px solid rgba(255,255,255,0.1);
    border-radius: 8px;
    color: #b0a89f;
    cursor: pointer;
    transition: 0.3s;
    font-size: 13px;
}


.role-option input:checked + label {
    background: #e23744;
    border-color: #e23744;
    color: white;
}


.role-option label:hover {
    border-color: #e23744;
    color: #ff8a5c;
}


/* ================= BUTTON ================= */

button {
    width: 100%;
    padding: 10px;
    border: none;
    border-radius: 8px;
    background: #e23744;
    color: white;
    font-size: 14px;
    font-weight: 700;
    cursor: pointer;
    transition: .3s;
}


button:hover {
    background: #c91f32;
}


/* ================= FOOTER ================= */

p.footer-text {
    text-align: center;
    margin-top: 10px;
    color: #b0a89f;
    font-size: 12px;
}


a {
    color: #ff8a5c;
    text-decoration: none;
    font-weight: 700;
}


a:hover {
    text-decoration: underline;
}


/* ================= MOBILE ================= */

@media(max-width:650px) {

    .container {
        width: 90%;
        padding: 18px 20px;
    }

    .logo-text {
        font-size: 20px;
    }

    h2 {
        font-size: 19px;
    }

}

</style>

</head>


<body>


<!-- ================= BACKGROUND VIDEO ================= -->

<video
    class="background-video"
    autoplay
    muted
    loop
    playsinline>

    <source
        src="images/ACC.mp4"
        type="video/mp4">

</video>


<!-- ================= VIDEO OVERLAY ================= -->

<div class="video-overlay"></div>


<!-- ================= SIGNUP CONTAINER ================= -->

<div class="container">


    <!-- LOGO -->

    <div class="logo">

        <div class="logo-icon">
            🍴
        </div>

        <div class="logo-text">
            Food<span>io</span>
        </div>

    </div>


    <h2>
        Create Account
    </h2>


    <p class="subtitle">
        Sign up to start ordering
    </p>


    <!-- ERROR MESSAGE -->

    <%

    String error = request.getParameter("error");

    if(error != null){

    %>

        <div class="error-box">

            That username is already taken.
            Please choose another.

        </div>

    <%

    }

    %>


    <!-- ================= FORM ================= -->

    <form action="RegisterServlet" method="post">


        <!-- USERNAME -->

        <label for="userName">
            Username
        </label>

        <input
            type="text"
            id="userName"
            name="userName"
            placeholder="Choose a username"
            required>


        <!-- EMAIL -->

        <label for="email">
            Email
        </label>

        <input
            type="email"
            id="email"
            name="email"
            placeholder="Enter your email"
            required>


        <!-- PASSWORD -->

        <label for="password">
            Password
        </label>

        <input
            type="password"
            id="password"
            name="password"
            placeholder="Create a password"
            required>


        <!-- ADDRESS -->

        <label for="address">
            Address
        </label>

        <textarea
            id="address"
            name="address"
            rows="2"
            placeholder="Enter your address"
            required></textarea>


        <!-- ROLE -->

        <div class="role-title">
            Select Role
        </div>


        <div class="role-options">


            <!-- CUSTOMER -->

            <div class="role-option">

                <input
                    type="radio"
                    id="customer"
                    name="role"
                    value="customer"
                    checked>

                <label for="customer">
                    Customer
                </label>

            </div>


            <!-- RESTAURANT -->

            <div class="role-option">

                <input
                    type="radio"
                    id="restaurant"
                    name="role"
                    value="restaurant">

                <label for="restaurant">
                    Restaurant
                </label>

            </div>


        </div>


        <!-- BUTTON -->

        <button type="submit">
            Sign Up
        </button>


    </form>


    <!-- LOGIN -->

    <p class="footer-text">

        Already have an account?

        <a href="login.html">
            Login
        </a>

    </p>


</div>


</body>

</html>
```
