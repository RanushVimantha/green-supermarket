<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    
<!-- Primary Meta Tags -->
<title>Green Supermarket - Online Shopping for Quality Products</title>
<meta name="title" content="Green Supermarket - Online Shopping for Quality Products">
<meta name="description" content="Experience convenient and secure online shopping at Green Supermarket. Explore a massive range of quality products, enjoy online payment options, and receive real-time updates on your orders.">

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

    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/login.css">
 </head>
<body style="background: url('https://www.visittci.com/core/graceway-gourmet-dairy_2048x1365.jpg') center center fixed; background-size: cover; margin: 0; padding: 0;">
    <%@ include file="header.jsp"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <%
        String message = request.getParameter("message");
    %>


    <div class="login-page">
        <div class="form">
            
            <img src="data:image/png;base64,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" alt="Logo" class="logo">


            <form class="login-form" form action="./LoginSrv" method="post">
                <input type="text" placeholder="username" name="username"/>
                <input type="password" placeholder="password" name="password"/>
                
                <!-- Add the following code for the dropdown menu -->
                <div class="row">
                    <div class="col-md-12 form-group">
                        <label for="userrole">Login As</label>
                        <select name="usertype" id="userrole" class="form-control" required>
                            <option value="customer" selected>CUSTOMER</option>
                            <option value="admin">ADMIN</option>
                        </select>
                    </div>
                </div>
                
                <button>login</button>
                <p class="message">Not registered? <a href="register.jsp">Create an account</a></p>
            </form>
            
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
    </div>
    <%@ include file="footer.html"%>
</body>
</html>