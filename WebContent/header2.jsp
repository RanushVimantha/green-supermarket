<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.green.service.impl.*,com.green.service.*"%>

<!DOCTYPE html>
<html>
<head>
<title>Header</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/header.css">
<link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css" />

</head>
<body style="background-color: #E6F9E6;">


	<%
	/* Checking the user credentials */
	String userType = (String) session.getAttribute("usertype");
	if (userType == null) { //LOGGED OUT
	%>

	<!-- Starting Navigation Bar -->
	<nav class="nav">
		<i class="uil uil-bars navOpenBtn"></i>
		<a href="index.jsp" class="logo"><img src="images/logo.png" style="height: 60px;" alt=""></a>
		<ul class="nav-links" style="font-size: 16px;">
			<i class="uil uil-times navCloseBtn"></i>
			<li class="nav-pages"><a href="login.jsp">Login</a></li>
			<li class="nav-pages"><a href="register.jsp">Register</a></li>
			<li class="nav-pages"><a href="index.jsp">Products</a></li>
			<div class="dropdown">
				<li class="nav-pages"><a href="#" data-toggle="dropdown" class="dropbtn">Categories</a>
					<div class="dropdown-content">
						<a href="index.jsp?type=Groceries">Groceries </a>
						<a href="index.jsp?type=DairyandEggs">Dairy and Eggs</a>
						<a href="index.jsp?type=FrozenFoods">Frozen Foods</a>
						<a href="index.jsp?type=Beverages">Beverages</a>
						<a href="index.jsp?type=Snacks">Snacks</a>
						<a href="index.jsp?type=PersonalCare">Personal Care</a>
						<a href="index.jsp?type=CleaningSupplies">Cleaning Supplies</a>
					</div>

				</li>
			</div>
			<li class="nav-pages"><a href="#">Contact Us</a></li>
		</ul>
		<form id="search" action="index.jsp" method="get">
		<i class="uil uil-search search-icon" id="searchIcon"></i>
		<div class="search-box">
		<a onclick="document.getElementById('search').submit(); return false;">
			<i class="uil uil-search search-icon"></i>
		</a>
			<input type="text" name="search" placeholder="Search here..."/>
		</div>
		</form>
	</nav>
	<%
	} else if ("customer".equalsIgnoreCase(userType)) { //CUSTOMER HEADER

	int notf = new CartServiceImpl().getCartCount((String) session.getAttribute("username"));
	%>
	<nav class="navbar navbar-default navbar-fixed-top">

		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="userHome.jsp"><span
					class="glyphicon glyphicon-home">&nbsp;</span>Shopping Center</a>
			</div>

			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="userHome.jsp"><span
							class="glyphicon glyphicon-home">Products</span></a></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">Category <span class="caret"></span>
					</a>
						<ul class="dropdown-menu">
							<li><a href="userHome.jsp?type=Groceries">Groceries</a></li>
							<li><a href="userHome.jsp?type=DairyandEggs">Dairy and Eggs</a></li>
							<li><a href="userHome.jsp?type=FrozenFoods">Frozen Foods</a></li>
							<li><a href="userHome.jsp?type=Beverages">Beverages</a></li>
							<li><a href="userHome.jsp?type=Snacks">Snacks</a></li>
							<li><a href="userHome.jsp?type=PersonalCare">Personal Care</a></li>
							<li><a href="userHome.jsp?type=CleaningSupplies">Cleaning Supplies</a></li>
						</ul></li>
					<%
					if (notf == 0) {
					%>
					<li><a href="cartDetails.jsp"> <span
							class="glyphicon glyphicon-shopping-cart"></span>Cart
					</a></li>

					<%
					} else {
					%>
					<li><a href="cartDetails.jsp"
						style="margin: 0px; padding: 0px;" id="mycart"><i
							data-count="<%=notf%>"
							class="fa fa-shopping-cart fa-3x icon-white badge"
							style="background-color: #333; margin: 0px; padding: 0px; padding-bottom: 0px; padding-top: 5px;">
						</i></a></li>
					<%
					}
					%>
					<li><a href="orderDetails.jsp">Orders</a></li>
					<li><a href="userProfile.jsp">Profile</a></li>
					<li><a href="./LogoutSrv">Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<%
	} else { //ADMIN HEADER
	%>
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="adminViewProduct.jsp"><span
					class="glyphicon glyphicon-home">&nbsp;</span>Shopping Center</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="adminViewProduct.jsp">Products</a></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">Category <span class="caret"></span>
					</a>
						<ul class="dropdown-menu">
							<li><a href="adminViewProduct.jsp?type=Groceries">Groceries</a></li>
							<li><a href="adminViewProduct.jsp?type=DairyandEggs">Dairy and Eggs</a></li>
							<li><a href="adminViewProduct.jsp?type=FrozenFoods">Frozen Foods</a></li>
							<li><a href="adminViewProduct.jsp?type=Beverages">Beverages</a></li>
							<li><a href="adminViewProduct.jsp?type=Snacks">Snacks</a></li>
							<li><a href="adminViewProduct.jsp?type=PersonalCare">Personal Care</a></li>
							<li><a href="adminViewProduct.jsp?type=CleaningSupplies">Cleaning Supplies</a></li>
						</ul></li>
					<li><a href="adminStock.jsp">Stock</a></li>
					<li><a href="shippedItems.jsp">Shipped</a></li>
					<li><a href="unshippedItems.jsp">Orders</a></li>
					<!-- <li><a href=""> <span class="glyphicon glyphicon-shopping-cart"></span>&nbsp;Cart</a></li> -->
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">Update Items <span
							class="caret"></span>
					</a>
						<ul class="dropdown-menu">
							<li><a href="addProduct.jsp">Add Product</a></li>
							<li><a href="removeProduct.jsp">Remove Product</a></li>
							<li><a href="updateProductById.jsp">Update Product</a></li>
						</ul></li>
					<li><a href="./LogoutSrv">Logout</a></li>

				</ul>
			</div>
		</div>
	</nav>
	<%
	}
	%>
	<!-- End of Navigation Bar -->
	

	<script>
		const nav = document.querySelector(".nav"),
			searchIcon = document.querySelector("#searchIcon"),
			navOpenBtn = document.querySelector(".navOpenBtn"),
			navCloseBtn = document.querySelector(".navCloseBtn");

		searchIcon.addEventListener("click", () => {
			nav.classList.toggle("openSearch");
			nav.classList.remove("openNav");
			if (nav.classList.contains("openSearch")) {
				return searchIcon.classList.replace("uil-search", "uil-times");
			}
			searchIcon.classList.replace("uil-times", "uil-search");
		});

		navOpenBtn.addEventListener("click", () => {
			nav.classList.add("openNav");
			nav.classList.remove("openSearch");
			searchIcon.classList.replace("uil-times", "uil-search");
		});
		navCloseBtn.addEventListener("click", () => {
			nav.classList.remove("openNav");
		});
	</script>

</body>
</html>