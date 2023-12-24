<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style>
    body {
      background-image: url('https://img.freepik.com/free-vector/leaves-wallpaper-with-metallic-foil-concept_79603-942.jpg?w=996&t=st=1703328896~exp=1703329496~hmac=806ab9baf198116d629d4a7a40db5f7ee8551937b9cef8f5af9f09f3613d5fe4'); 
      background-size: cover;
      background-repeat: no-repeat;
      background-attachment: fixed;
    }
  </style>
<title>Update Product</title>
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
	String userType = (String) session.getAttribute("usertype");
	String userName = (String) session.getAttribute("username");
	String password = (String) session.getAttribute("password");

	if (userType == null || !userType.equals("admin")) {
		response.sendRedirect("login.jsp?message=Access Denied, Login As Admin!!");
		return;

	} else if (userName == null || password == null) {
		response.sendRedirect("login.jsp?message=Session Expired, Login Again!!");
		return;
	}
	%>

	<jsp:include page="header.jsp" />

	<%
	String message = request.getParameter("message");
	%>
	<div class="container">
		<div class="row"
			style="margin-top: 5px; margin-left: 2px; margin-right: 2px;">
			<form action="updateProduct.jsp" method="post"
				class="col-md-4 col-md-offset-4"
				style="border: 0px; solid black; border-radius: 10px; background-color: transparent; padding: 10px;">
				<div style="font-weight: bold;" class="text-center">
					<h3 style="color: grey;">Product Update Form</h3>
					<%
					if (message != null) {
					%>
					<p style="color: #5fda5f;">
						<%=message%>
					</p>
					<%
					}
					%>
				</div>
				<div></div>
				<div class="row">
					<div class="col-md-12 form-group">
						<label for="last_name"></label> <input type="text"
							placeholder="Enter Product Id" name="prodid" class="form-control"
							id="last_name" required>
					</div>
				</div>
				
					<div class="col-md-6 text-center">
    <button type="submit" class="btn" style="background-color: #5fda5f; color: white;">Update Product</button>
</div>

				</div>
			</form>
		</div>
	</div>

	<%@ include file="footer.html"%>
</body>
</html>