<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="com.shashi.service.impl.*, com.shashi.service.*,com.shashi.beans.*,java.util.*,javax.servlet.ServletOutputStream,java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Green Supermarket</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/ProductCard.css">

</head>

<body style="background-color: #E6F9E6;">

	<%
	/* Checking the user credentials */
	String userName = (String) session.getAttribute("username");
	String password = (String) session.getAttribute("password");
	String userType = (String) session.getAttribute("usertype");

	boolean isValidUser = true;

	if (userType == null || userName == null || password == null || !userType.equals("customer")) {

		isValidUser = false;
	}

	ProductServiceImpl prodDao = new ProductServiceImpl();
	List<ProductBean> products = new ArrayList<ProductBean>();

	String search = request.getParameter("search");
	String type = request.getParameter("type");
	String message = "All Products";
	if (search != null) {
		products = prodDao.searchAllProducts(search);
		message = "Showing Results for '" + search + "'";
	} else if (type != null) {
		products = prodDao.getAllProductsByType(type);
		message = "Showing Results for '" + type + "'";
	} else {
		products = prodDao.getAllProducts();
	}
	if (products.isEmpty()) {
		message = "No items found for the search '" + (search != null ? search : type) + "'";
		products = prodDao.getAllProducts();
	}
	%>

	<jsp:include page="header2.jsp" />

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">


	<div class="text-center"
		style="color: black; font-size: 20px; font-weight: bold; margin-top: 130px; margin-bottom: 35px"><%=message%></div>
	<div class="text-center" id="message"
		style="color: black; font-size: 14px; font-weight: bold;"></div>
	<!-- Start of Product Items List -->
	<div class="container" style="justify-content: center; margin: 0% auto; width: 81%;">
		<div class="row text-center" style="justify-content: center; width: 100%; margin: 0% auto;">

			<%
			for (ProductBean product : products) {
				int cartQty = new CartServiceImpl().getCartItemCount(userName, product.getProdId());
			%>
			<div class="col-sm-5" style='height: 500px; width: 290px; justify-content: center;'>
				<div class="thumbnail" style="position: relative; width: 100%; height: 460px; background: #5fda5f; border-radius: 20px; overflow: hidden; margin: 0% auto;">
					<img src="./ShowImage?pid=<%=product.getProdId()%>" alt="Product"
						style="position: relative; width: auto; height: 230px; display: flex; justify-content: center; align-items: center; padding-top: 1.8rem; z-index: 1;">
					<h3 class="contentBox" style="position: relative; padding: 1.4rem; display: flex; justify-content: center; align-items: center; flex-direction: column; z-index: 2; font-size: 1.8rem; color: white; font-weight: 500; text-transform: uppercase; letter-spacing: 1px;">
					<%=product.getProdName()%>
					</h3>
					<%
					String description = product.getProdInfo();
					description = description.substring(0, Math.min(description.length(), 100));
					%>
					
<%-- 					<p class="productinfo"><%=description%>.. --%>
<!-- 					</p> -->

					<p class="price" style="position: relative; padding: 1rem; display: flex; justify-content: center; align-items: center; flex-direction: column; z-index: 2; font-size: 2rem; color: white; font-weight: 700; letter-spacing: 0.1rem;">
						Rs.
						<%=product.getProdPrice()%>
					</p>
					<form method="post">
						<%
						if (cartQty == 0) {
						%>
						<button type="submit" 
							formaction="./AddtoCart?uid=<%=userName%>&pid=<%=product.getProdId()%>&pqty=1"
							class="buy">Add to Cart</button>
						<%
						} else {
						%>
						<button type="submit"
							formaction="./AddtoCart?uid=<%=userName%>&pid=<%=product.getProdId()%>&pqty=0"
							class="remove">Remove From Cart</button>
						&nbsp;&nbsp;&nbsp;
						<button type="submit" formaction="cartDetails.jsp"
							class="buy">Checkout</button>
						<%
						}
						%>
					</form>
					<br />
				</div>
			</div>

			<%
			}
			%>

		</div>
	</div>
	<!-- ENd of Product Items List -->


	<%@ include file="footer.html"%>

</body>
</html>