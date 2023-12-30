<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
    <link rel="stylesheet" href="css/registration.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script type="application/x-javascript">
        addEventListener("load", function() {
            setTimeout(hideURLbar, 0);
        }, false);
        function hideURLbar() {
            window.scrollTo(0,1);
        }
    </script>
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
    <link href="//fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,700,700i" rel="stylesheet">
</head>
<body style="background-color: #212121;">
    <div style="background: url('https://us.123rf.com/450wm/virtosmedia/virtosmedia2302/virtosmedia230282584/199292740-supermarket-shelves-with-products-and-blurred-background-shallow-depth-of-focus.jpg?ver=6') center center fixed; background-size: cover; margin: 0; padding: 0;">
        <%@ include file="header.jsp"%>
        <div style="background-color: #212121; opacity: 0.5;">
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        </div>
        <% 
            String message = request.getParameter("message");
        %>
        <div class="main-w3layouts wrapper" style="margin-top: 70px; margin-bottom: 5px">
            <h1 style="color: white;">Registration Form</h1>
            <ul class="colorlib-bubbles" style="top: 0%">
                <li></li>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
            </ul>
            <div class="main-agileinfo">
    <div class="agileits-top">
        <form action="./RegisterSrv" method="post">
            <div class="row">
                <div class="col-md-6 form-group" style="color: white;">
                    <label for="first_name">Name</label>
                    <input type="text" name="username" class="form-control" id="first_name" required style="font-weight: bold;">
                </div>
                <div class="col-md-6 form-group" style="color: white;">
                    <label for="last_name"><strong>Email</strong></label>
                    <input type="email" name="email" class="form-control" id="last_name" required style="font-weight: bold;">
                </div>
            </div>
            <div class="form-group" style="color: white;">
                <label for="address">Address</label>
                <textarea name="address" class="form-control" id="address" required style="color: white; background-color: rgba(255, 255, 255, 0.2); font-weight: bold;'"></textarea>
            </div>
            <div class="row">
                <div class="col-md-6 form-group" style="color: white;">
                    <label for="mobile">Mobile</label>
                    <input type="number" name="mobile" class="form-control" id="mobile" required style="color: white; background-color: rgba(255, 255, 255, 0.2); font-weight: bold;">
                </div>
                <div class="col-md-6 form-group" style="color: white;">
                    <label for="postal_code">Postal Code</label>
                    <input type="number" name="pincode" class="form-control" id="postal_code" required style="color: white; background-color: rgba(255, 255, 255, 0.2); font-weight: bold;">
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 form-group" style="color: white;">
                    <label for="password">Password</label>
                    <input type="password" name="password" class="form-control" required style="font-weight: bold;">
                </div>
                <div class="col-md-6 form-group" style="color: white;">
                    <label for="confirmPassword">Confirm Password</label>
                    <input type="password" name="confirmPassword" class="form-control" required style="font-weight: bold;">
                </div>
            </div>
                        <input type="submit" value="SIGNUP">
                        <% if (message != null) { %>
                            <p style="color: white;">
                                <%= message %>
                            </p>
                        <% } %>
                    </form>
                    <p>Already have an Account? <a href="login.jsp"> Login Now!</a></p>
                </div>
            </div>
        </div>
        <%@ include file="footer.html"%>
    </div>
</body>
</html>
