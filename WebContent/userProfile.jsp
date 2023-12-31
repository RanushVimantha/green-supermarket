<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.green.service.impl.*,com.green.service.*,com.green.beans.*,java.util.*,javax.servlet.ServletOutputStream,java.io.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="css/changes.css">
    <!-- Add your custom CSS files or styles here -->
    <style>
        body {
            background-color: #f4f4f4;
            font-family: Arial, sans-serif;
        }

        .profile-image {
            width: 150px;
            height: 150px;
            object-fit: cover;
            border-radius: 50%;
        }

        .card {
            border-radius: 15px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .card-title {
            color: #333;
        }

        .profile-details p {
            font-size: 16px;
        }

        hr {
            border-color: #ddd;
        }
    </style>
</head>
<body>

<%
    /* Checking the user credentials */
    String userName = (String) session.getAttribute("username");
    String password = (String) session.getAttribute("password");

    if (userName == null || password == null) {
        response.sendRedirect("login.jsp?message=Session Expired, Login Again!!");
    }

    UserService dao = new UserServiceImpl();
    UserBean user = dao.getUserDetails(userName, password);
    if (user == null)
        user = new UserBean("Test User", 98765498765L, "test@gmail.com", "ABC colony, Patna, Bihar", 87659, "lksdjf");
%>

<jsp:include page="header.jsp" />
<br><br><br><br><br>
<div class="container mt-5">
    <div class="row">
        <div class="col-lg-4 mb-4">
            <div class="card">
                <div class="card-body text-center">
                    <img src="images/profile.jpg" alt="Profile Image" class="profile-image">
                    <h5 class="my-3 text-primary">
                        Hello <%= user.getName() %>!
                    </h5>
                </div>
            </div>
        </div>
        <div class="col-lg-8">
            <div class="card">
                <div class="card-body profile-details">
                    <h3 class="card-title mb-4">My Profile</h3>
                    <div class="row mb-3">
                        <div class="col-sm-3">
                            <p class="font-weight-bold mb-0">Full Name</p>
                        </div>
                        <div class="col-sm-9">
                            <p class="text-muted mb-0"><%= user.getName() %></p>
                        </div>
                    </div>
                    <hr>
                    <div class="row mb-3">
                        <div class="col-sm-3">
                            <p class="font-weight-bold mb-0">Email</p>
                        </div>
                        <div class="col-sm-9">
                            <p class="text-muted mb-0"><%= user.getEmail() %></p>
                        </div>
                    </div>
                    <hr>
                    <div class="row mb-3">
                        <div class="col-sm-3">
                            <p class="font-weight-bold mb-0">Phone</p>
                        </div>
                        <div class="col-sm-9">
                            <p class="text-muted mb-0"><%= user.getMobile() %></p>
                        </div>
                    </div>
                    <hr>
                    <div class="row mb-3">
                        <div class="col-sm-3">
                            <p class="font-weight-bold mb-0">Address</p>
                        </div>
                        <div class="col-sm-9">
                            <p class="text-muted mb-0"><%= user.getAddress() %></p>
                        </div>
                    </div>
                    <hr>
                    <div class="row mb-3">
                        <div class="col-sm-3">
                            <p class="font-weight-bold mb-0">PinCode</p>
                        </div>
                        <div class="col-sm-9">
                            <p class="text-muted mb-0"><%= user.getPinCode() %></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<br><br><br>
<jsp:include page="footer.html" />

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- Add your custom scripts or additional JavaScript libraries here -->
</body>
</html>
