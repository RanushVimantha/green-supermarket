<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="com.green.utility.*,com.green.utility.payment.*, com.green.service.impl.*,com.green.service.*,com.green.beans.*,java.util.*,javax.servlet.ServletOutputStream,java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Payments</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="css/changes.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
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
	%>



	<jsp:include page="header.jsp" />

<br><br><br><br><br><br><br>

<form id="payHereForm" method="post" action="https://sandbox.payhere.lk/pay/checkout">   
    <input type="hidden" name="merchant_id" value="1225349">    <!-- Replace your Merchant ID -->
    <input type="hidden" name="return_url" value="http://sample.com/return">
    <input type="hidden" name="cancel_url" value="http://sample.com/cancel">
    <input type="hidden" name="notify_url" value="http://sample.com/notify">  
    </br></br>Item Details
    <input type="text" name="order_id" value="Green Supermarket">
    <input type="hidden" name="items" value="Green Supermarket" readonly>
    
    </br></br>Customer Details
    <input type="text" name="first_name" value="Saman">
    <input type="text" name="last_name" value="Perera">
    <input type="text" name="email" value="samanp@gmail.com">
    <input type="text" name="phone" value="0771234567">
    <input type="text" name="address" value="No.1, Galle Road">
    <input type="text" name="city" value="Colombo">
    <input type="hidden" name="country" value="Sri Lanka">
    <input type="hidden" name="hash" value="<%=HashCodeGenerator.generatecode("Green Supermarket", amount, "NTU3MzEzNTEyNDI2OTE0OTEyMjMwMTYzMTU0ODI0NTMyMTczMTM=", "1225349", "LKR")%>">
    <!-- Replace with generated hash -->
    <input type="text" name="amount" value="<%=amount%>" readonly>
    <input type="text" name="currency" value="LKR">
    <input type="submit" value="Buy Now">   
</form>
<br><br><br><br><br><br>
<script>
        function submitForm() {
            document.getElementById("payHereForm").submit();
        }
    </script> 


	<!-- ENd of Product Items List -->


	<%@ include file="footer.html"%>

</body>
</html>