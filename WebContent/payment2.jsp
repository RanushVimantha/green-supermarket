<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="com.green.utility.*,com.green.utility.payment.*, com.green.service.impl.*,com.green.service.*,com.green.beans.*,java.util.*,javax.servlet.ServletOutputStream,java.io.*"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>Payments</title>
	<link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css" />

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>


	<link rel="stylesheet" href="css/checkout.css" />


</head>

<body style="background-color: #E6F9E6;">

	
	<%
	/* Checking the user credentials */
	String userName = (String) session.getAttribute("username");
	String password = (String) session.getAttribute("password");

	if (userName == null || password == null) {

		response.sendRedirect("login.jsp?message=Session Expired, Login Again!!");
	}

	String sAmount = request.getParameter("amount");

	double amount = 0;

	if (sAmount != null) {
		amount = Double.parseDouble(sAmount);
	}
	UserService dao = new UserServiceImpl();
	UserBean user = dao.getUserDetails(userName, password);
	if (user == null)
		user = new UserBean("Test User", 98765498765L, "test@gmail.com", "ABC colony, Patna, bihar", 87659, "lksdjf");
	%>

	<jsp:include page="header.jsp" />


	<div class="iphone" style="margin-top: 120px; margin-bottom: 15px">
	<div class="contain">
		<header class="header">
			<h1>Checkout</h1>
		</header>

		<form class="form" id="payHereForm" method="post" action="https://sandbox.payhere.lk/pay/checkout">

			<input type="hidden" name="merchant_id" value="1225349"> <!-- Replace your Merchant ID -->
			<input type="hidden" name="return_url" value="http://sample.com/return">
			<input type="hidden" name="cancel_url" value="http://sample.com/cancel">
			<input type="hidden" name="notify_url" value="http://sample.com/notify">

			<!-- Item Details -->
			<input type="hidden" name="order_id" value="Green Supermarket"> <!-- Can show the orderid if u want -->
			<input type="hidden" name="items" value="Green Supermarket" readonly>

			<div>
				<h2>First Name</h2>

				<div class="card">

					<input class="card-input" type="text" name="first_name" value="<%=user.getName()%>" required>

				</div>
			</div>

			<div>
				<h2>Last Name</h2>

				<div class="card">

					<input class="card-input" type="text" name="last_name" placeholder="Type Your Last Name" value=""
						required>

				</div>
			</div>

			<div>
				<h2>Email Adress</h2>

				<div class="card">

					<input class="card-input" type="text" name="email" value="<%=user.getEmail()%>" required>

				</div>
			</div>

			<div>
				<h2>Mobile Number</h2>

				<div class="card">

					<input class="card-input" type="text" name="phone" value="<%=user.getMobile()%>" required>

				</div>
			</div>

			<div>
				<h2>Address</h2>

				<div class="card">
				
					<input class="card-input" type="text" name="address" value="<%=user.getAddress()%>" required>

				</div>
			</div>

		<!-- Passing Values -->
		<input type="hidden" name="city" value="Colombo">
		<input type="hidden" name="country" value="Sri Lanka">
		<input type="hidden" name="hash" value="<%=HashCodeGenerator.generatecode("Green Supermarket", amount, "NTU3MzEzNTEyNDI2OTE0OTEyMjMwMTYzMTU0ODI0NTMyMTczMTM=", "1225349", "LKR")%>">
		<!-- Replace with generated hash -->
		<input type="hidden" name="amount" value="<%=amount%>" readonly>
		<input type="hidden" name="currency" value="LKR">


			<div>
				<h2>Shopping Bill</h2>

				<table>
					<tbody>

						<tr>
							<td>Discount 0%</td>
							<td align="right">-Rs. 0.00</td>
						</tr>
						<tr>
							<td>Price Total</td>
							<td align="right">Rs. <%=amount%></td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td>Total</td>
							<td align="right">Rs. <%=amount%></td>
						</tr>
					</tfoot>
				</table>
			</div>

			<div>
				<button class="button button--full" type="submit"><svg class="icon">
						<use xlink:href="#icon-shopping-bag" />
					</svg>Buy Now</button>
			</div>
		</form>
	</div>
	</div>

	<script>
        function submitForm() {
            document.getElementById("payHereForm").submit();
        }
    </script> 

	<svg style="display: none">

		<symbol id="icon-shopping-bag" viewBox="0 0 24 24">
			<path
				d="M20 7h-4v-3c0-2.209-1.791-4-4-4s-4 1.791-4 4v3h-4l-2 17h20l-2-17zm-11-3c0-1.654 1.346-3 3-3s3 1.346 3 3v3h-6v-3zm-4.751 18l1.529-13h2.222v1.5c0 .276.224.5.5.5s.5-.224.5-.5v-1.5h6v1.5c0 .276.224.5.5.5s.5-.224.5-.5v-1.5h2.222l1.529 13h-15.502z" />
	</svg>

	<%@ include file="footer.html"%>

</body>

</html>