<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="com.green.service.impl.*,com.green.service.*,com.green.beans.*,java.util.*,javax.servlet.ServletOutputStream,java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Admin Home</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Open Graph -->
<meta property="og:type" content="website">
<meta property="og:url" content="https://nsbm.redwindinternational.com/">
<meta property="og:title" content="Green Supermarket - Online Shopping for Quality Products">
<meta property="og:description" content="Experience convenient and secure online shopping at Green Supermarket. Explore a massive range of quality products, enjoy online payment options, and receive real-time updates on your orders.">
<meta property="og:image" itemprop="image" content="https://nsbm.redwindinternational.com/images/meta_img.png">

<!-- Twitter -->
<meta property="twitter:card" content="summary_large_image">
<meta property="twitter:url" content="https://nsbm.redwindinternational.com/">
<meta property="twitter:title" content="Green Supermarket - Online Shopping for Quality Products">
<meta property="twitter:description" content="Experience convenient and secure online shopping at Green Supermarket. Explore a massive range of quality products, enjoy online payment options, and receive real-time updates on your orders.">
<meta property="twitter:image" content="https://nsbm.redwindinternational.com/images/meta_img.png">


</head>
<body style="background-color: #E6F9E6;">
	<%
	/* Checking the user credentials */
	String userType = (String) session.getAttribute("usertype");
	String userName = (String) session.getAttribute("username");
	String password = (String) session.getAttribute("password");

	if (userType == null || !userType.equals("admin")) {

		response.sendRedirect("login.jsp?message=Access Denied, Login as admin!!");

	}

	else if (userName == null || password == null) {

		response.sendRedirect("login.jsp?message=Session Expired, Login Again!!");

	}
	%>

	<jsp:include page="header.jsp" />
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

	<div class="products" style="background-color: #E6F9E6; style="margin-top: 130px; margin-bottom: 35px">

		<div class="tab" align="center" style="margin-top: 130px; margin-bottom: 35px">
			<form>
				<button type="submit" formaction="adminViewProduct.jsp">View
					products</button>
				<br>
				<br>
				<button type="submit" formaction="addProduct.jsp">Add
					products</button>
				<br>
				<br>
				<button type="submit" formaction="removeProduct.jsp">Remove
					Products</button>
				<br>
				<br>
				<button type="submit" formaction="updateProductById.jsp">Update
					Products</button>
				<br>
				<br>
			</form>
		</div>
	</div>

	<%@ include file="footer.html"%>
</body>
</html>