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
<title>Add Product</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/changes.css">
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

	<%
	String message = request.getParameter("message");
	%>
	<div class="container" style="margin-top: 130px; margin-bottom: 35px">
		<div class="row"
			style="margin-top: 3px; margin-left: 1px; margin-right: 1px;">
			<form action="./AddProductSrv" method="post"
				enctype="multipart/form-data" class="col-md-6 col-md-offset-3"
				style="border: 2px solid black; border-radius: 20px; background-color: transparent; padding: 30px;">
				<div style="font-weight: bold;" class="text-center">
					<h2 style="color: grey;">Product Addition Form</h2>
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
					<div class="col-md-6 form-group">
    <label for="last_name">Product Name</label>
    <input type="text" placeholder="Enter Product Name" name="name" class="form-control" id="last_name" style="background-color: ;" required>
</div>

					<div class="col-md-6 form-group">
    <label for="producttype">Product Type</label>
    <select name="type" id="producttype" class="form-control"  style="background-color: ;" required>
        <option value="Groceries">Groceries</option>
        <option value="DairyandEggs">Dairy and Eggs</option>
        <option value="FrozenFoods">Frozen Foods</option>
        <option value="Beverages">Beverages</option>
        <option value="Snacks">Snacks</option>
        <option value="PersonalCare">Personal Care</option>
        <option value="CleaningSupplies">Cleaning Supplies</option>
    </select>
</div>

				<div class="form-group">
        <label for="last_name">Product Description</label>
        <textarea name="info" class="form-control" id="last_name" style=" ;" required></textarea>
</div>

<div class="row">
    <div class="col-md-6 form-group">
        <label for="last_name">Unit Price</label>
        <input type="number" placeholder="Enter Unit Price" name="price" class="form-control" id="last_name" style="background-color:;" required>
    </div>
    <div class="col-md-6 form-group">
        <label for="last_name">Stock Quantity</label>
        <input type="number" placeholder="Enter Stock Quantity" name="quantity" class="form-control" id="last_name" style="background-color:;" required>
    </div>
</div>

<div class="col-md-12 form-group">
    <label for="last_name">Product Image</label>
    <input type="file" placeholder="Select Image" name="image" class="form-control" id="last_name" style="background-color: ;" required>
</div>

				</div>
				
					<div class="col-md-6 text-center">
    <button type="submit" class="btn btn-success" style="background-color: #5fda5f; color: white;">Add Product</button>
</div>

				</div>
			</form>
		</div>
	</div>

	<%@ include file="footer.html"%>
</body>
</html>