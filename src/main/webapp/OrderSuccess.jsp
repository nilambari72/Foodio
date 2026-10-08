<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.*" %>
<%@ page import="com.tap.model.Cart"%>
<%@ page import="com.tap.model.CartItem"%>

<%
Cart cart = (Cart) session.getAttribute("cart");

Collection<CartItem> cartItems = null;
double subTotal = 0;

if (cart != null) {
    cartItems = cart.getItems().values();
    for (CartItem item : cartItems) {
        subTotal += item.getPrice() * item.getQuantity();
    }
}

double delivery = 50;
double grandTotal = subTotal + delivery;

// clear the cart now that the order is placed
session.removeAttribute("cart");
session.removeAttribute("restaurantId");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Foodio | Order Confirmed</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Arial, Helvetica, sans-serif;
}

body{
    min-height:100vh;
    background:#0f0d0c;
    color:#e8e2dd;
    display:flex;
    align-items:center;
    justify-content:center;
    padding:30px;
}

.container{
    width:100%;
    max-width:500px;
    background:#1e1712;
    border:1px solid rgba(255,255,255,0.08);
    border-radius:20px;
    padding:40px;
    text-align:center;
    box-shadow:0 20px 50px rgba(0,0,0,0.4);
}

.icon{
    width:90px;
    height:90px;
    margin:0 auto 20px;
    border-radius:50%;
    background:#1a8a3c;
    display:flex;
    align-items:center;
    justify-content:center;
    font-size:46px;
    color:white;
    animation:pop .5s ease;
}

@keyframes pop{
    from{ transform:scale(.6); opacity:0; }
    to{ transform:scale(1); opacity:1; }
}

h1{
    color:#f2ede8;
    font-size:26px;
    margin-bottom:10px;
}

.subtitle{
    color:#b0a89f;
    font-size:14px;
    margin-bottom:25px;
}

.order-id{
    display:inline-block;
    background:rgba(226,55,68,0.12);
    border:1px solid rgba(226,55,68,0.3);
    color:#ff8a5c;
    padding:6px 16px;
    border-radius:20px;
    font-size:13px;
    font-weight:700;
    margin-bottom:25px;
}

.summary{
    background:#141110;
    border-radius:14px;
    padding:20px;
    text-align:left;
    margin-bottom:25px;
}

.summary-item{
    display:flex;
    justify-content:space-between;
    font-size:14px;
    color:#d8d0c8;
    margin-bottom:10px;
}

.summary hr{
    border:none;
    border-top:1px solid rgba(255,255,255,0.08);
    margin:12px 0;
}

.summary-total{
    display:flex;
    justify-content:space-between;
    font-size:16px;
    font-weight:700;
    color:#f2ede8;
}

.status-box{
    display:flex;
    align-items:center;
    gap:10px;
    background:rgba(33,150,243,0.1);
    border:1px solid rgba(33,150,243,0.3);
    padding:12px 16px;
    border-radius:12px;
    margin-bottom:25px;
    text-align:left;
}

.status-box .dot{
    width:10px;
    height:10px;
    border-radius:50%;
    background:#2196F3;
    flex-shrink:0;
}

.status-box p{
    font-size:13px;
    color:#c9ddf2;
}

.btn-group{
    display:flex;
    gap:12px;
    flex-wrap:wrap;
}

.btn{
    flex:1;
    padding:13px;
    border-radius:10px;
    text-decoration:none;
    font-weight:700;
    font-size:14px;
    transition:.3s;
}

.btn-primary{
    background:#e23744;
    color:white;
}

.btn-primary:hover{
    background:#c91f32;
}

.btn-secondary{
    border:1px solid rgba(255,255,255,0.15);
    color:#f2ede8;
}

.btn-secondary:hover{
    border-color:#e23744;
    color:#ff8a5c;
}

</style>
</head>

<body>

<div class="container">

<div class="icon">✓</div>

<h1>Order Confirmed!</h1>
<p class="subtitle">Thank you for ordering with Foodio</p>

<div class="order-id">
    Order #<%= (int)(Math.random() * 90000) + 10000 %>
</div>

<%
if (cartItems != null && !cartItems.isEmpty()) {
%>

<div class="summary">

<%
for (CartItem item : cartItems) {
    double itemTotal = item.getPrice() * item.getQuantity();
%>
    <div class="summary-item">
        <span><%= item.getName() %> x<%= item.getQuantity() %></span>
        <span>₹<%= String.format("%.2f", itemTotal) %></span>
    </div>
<%
}
%>

<hr>

<div class="summary-item">
    <span>Delivery Fee</span>
    <span>₹<%= String.format("%.2f", delivery) %></span>
</div>

<hr>

<div class="summary-total">
    <span>Total Paid</span>
    <span>₹<%= String.format("%.2f", grandTotal) %></span>
</div>

</div>

<%
}
%>

<div class="status-box">
    <div class="dot"></div>
    <p>Your order is being prepared and will arrive in 25-35 minutes.</p>
</div>

<div class="btn-group">
    <a href="Restaurant" class="btn btn-primary">🍔 Order More</a>
    <a href="Profile.jsp" class="btn btn-secondary">My Orders</a>
</div>

</div>

</body>
</html>