<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="com.green.service.impl.*,com.green.service.*,com.green.beans.*,java.util.*,javax.servlet.ServletOutputStream,java.io.*"%>
<!DOCTYPE html>
<html>

<head>
<title>Cart Details</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">


<link rel="stylesheet" href="css/cart.css">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,900"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body style="background-color: #E6F9E6;">


    <% /* Checking the user credentials */
        String userName = (String) session.getAttribute("username");
        String password = (String) session.getAttribute("password");

        if (userName == null || password == null) {
            response.sendRedirect("login.jsp?message=Session Expired, Login Again!!");
        }

        String addS = request.getParameter("add");
        if (addS != null) {
            int add = Integer.parseInt(addS);
            String uid = request.getParameter("uid");
            String pid = request.getParameter("pid");
            int avail = Integer.parseInt(request.getParameter("avail"));

            int cartQty = Integer.parseInt(request.getParameter("qty"));
            CartServiceImpl cart = new CartServiceImpl();

            if (add == 1) {
                // Add Product into the cart
                cartQty += 1;
                if (cartQty <= avail) {
                    cart.addProductToCart(uid, pid, 1);
                } else {
                    response.sendRedirect("./AddtoCart?pid=" + pid + "&pqty=" + cartQty);
                }
            } else if (add == 0) {
                // Remove Product from the cart
                cart.removeProductFromCart(uid, pid);
            }
        }
    %>




	<%@ include file="/header.jsp"%>


	<!-- <script>document.getElementById('mycart').innerHTML='<i data-count="20" class="fa fa-shopping-cart fa-3x icon-white badge" style="background-color:#333;margin:0px;padding:0px; margin-top:5px;"></i>'</script>
 -->

	<!-- Start of New Product Items List -->

	<div class="CartContainer"
		style="margin-top: 130px; margin-bottom: 35px">
		<div class="Header">
			<h3 class="Heading">Shopping Cart</h3>
		</div>

        <%-- Store cart details in session --%>
        <% CartServiceImpl cartService = new CartServiceImpl();
        List<CartBean> cartItems = new ArrayList<CartBean>();
        cartItems = cartService.getAllCartItems(userName);
        double totAmount = 0;
        for (CartBean item : cartItems) {
            ProductBean product = new ProductServiceImpl().getProductDetails(item.getProdId());
            int prodQuantity = item.getQuantity();
            double currAmount = product.getProdPrice() * prodQuantity;
            totAmount += currAmount;
        %>
        
            <%-- Store cart details in session --%>
    <% 
       session.setAttribute("totAmount", totAmount);
    %>
        
        
		<div class="Cart-Items">
			<div class="image-box">
				<img src="./ShowImage?pid=<%=product.getProdId()%>"
					style="height: 120px;" />
			</div>
			<div class="about">
				<h1 class="title">
					<%=product.getProdName()%>
				</h1>
				<h3 class="subtitle">
					<%=product.getProdInfo()%>
				</h3>

			</div>
			<div class="counter">
				<a
					href="cartDetails.jsp?add=1&uid=<%=userName%>&pid=<%=product.getProdId()%>&avail=<%=product.getProdQuantity()%>&qty=<%=prodQuantity%>">
					<div class="btn">+</div>
				</a>
				<div class="count">
					<%=prodQuantity%>
				</div>
				<a
					href="cartDetails.jsp?add=0&uid=<%=userName%>&pid=<%=product.getProdId()%>&avail=<%=product.getProdQuantity()%>&qty=<%=prodQuantity%>">
					<div class="btn">-</div>
				</a>
			</div>
			<div class="prices">
				<div class="amount" style="opacity: 40%; font-size: 1.2em;">
					Rs.
					<%=product.getProdPrice()%>
				</div>
				<div class="amount">
					Rs.
					<%=currAmount%>
				</div>
			</div>

		</div>
		<hr>
        <%
        }

        if (totAmount != 0) {
        %>

		<div class="checkout">
			<div class="total">
				<div>
					<div class="Subtotal">Sub-Total</div>
				</div>
				<div class="total-amount"><%=totAmount%></div>
			</div>
			<form method="post">
			<input type="hidden" name="amount" value="<%=totAmount%>">
				<button id="checkout"
					formaction="./OrderServlet">Proceed To Pay</button>

			</form>

		</div>
        <%
        }
        %>

	</div>




	<%@ include file="footer.html"%>

</body>

</html>