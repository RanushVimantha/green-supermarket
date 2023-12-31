<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <style>
    @import url(https://fonts.googleapis.com/css?family=Roboto:400,300,600,400italic);
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      -webkit-box-sizing: border-box;
      -moz-box-sizing: border-box;
      -webkit-font-smoothing: antialiased;
      -moz-font-smoothing: antialiased;
      -o-font-smoothing: antialiased;
      font-smoothing: antialiased;
      text-rendering: optimizeLegibility;
    }

    body {
      font-family: "Roboto", Helvetica, Arial, sans-serif;
      font-weight: 100;
      font-size: 12px;
      line-height: 30px;
      color: #777;
      background: #4CAF50;
    }

    .container {
      max-width: 700px;
      width: 100%;
      margin: 0 auto;
      position: relative;
    }

    #contact input[type="text"],
    #contact input[type="email"],
    #contact input[type="tel"],
    #contact input[type="url"],
    #contact textarea,
    #contact button[type="submit"] {
      font: 400 12px/16px "Roboto", Helvetica, Arial, sans-serif;
    }

    #contact {
      background: #ffffff;
      padding: 25px;
      margin: 150px 0;
      box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
    }

    #contact h3 {
      display: block;
      font-size: 35px;
      font-weight: 300;
      margin-bottom: 0px;
      margin-bottom: 5px;
      text-align: center;
    }

    #contact h4 {
      margin: 5px 0 15px;
      display: block;
      font-size: 13px;
      font-weight: 400;
    }

    fieldset {
      border: medium none !important;
      margin: 0 0 10px;
      min-width: 100%;
      padding: 0;
      width: 100%;
    }

    #contact input[type="text"],
    #contact input[type="email"],
    #contact input[type="tel"],
    #contact input[type="url"],
    #contact textarea {
      width: 100%;
      border: 1px solid #ccc;
      background: #FFF;
      margin: 0 0 5px;
      padding: 10px;
    }

    #contact input[type="text"]:hover,
    #contact input[type="email"]:hover,
    #contact input[type="tel"]:hover,
    #contact input[type="url"]:hover,
    #contact textarea:hover {
      -webkit-transition: border-color 0.3s ease-in-out;
      -moz-transition: border-color 0.3s ease-in-out;
      transition: border-color 0.3s ease-in-out;
      border: 1px solid #aaa;
    }

    #contact textarea {
      height: 100px;
      max-width: 100%;
      resize: none;
    }

    #contact button[type="submit"] {
      cursor: pointer;
      width: 100%;
      border: none;
      background: #5fda5f;
      color: #FFF;
      margin: 0 0 5px;
      padding: 10px;
      font-size: 15px;
    }

    #contact button[type="submit"]:hover {
      background: #5fda5f;
      -webkit-transition: background 0.3s ease-in-out;
      -moz-transition: background 0.3s ease-in-out;
      transition: background-color 0.3s ease-in-out;
    }

    #contact button[type="submit"]:active {
      box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.5);
    }

    .copyright {
      text-align: center;
    }

    #contact input:focus,
    #contact textarea:focus {
      outline: 0;
      border: 1px solid #aaa;
    }

    ::-webkit-input-placeholder {
      color: #888;
    }

    :-moz-placeholder {
      color: #888;
    }

    ::-moz-placeholder {
      color: #888;
    }

    :-ms-input-placeholder {
      color: #888;
    }
  </style>
</head>
<body>
  <div class="container">  
    <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Contact Form </title>
  <style>
    
    body {
      font-family: Arial, sans-serif;
      margin: 20px;
    }

    #contact {
      max-width: 600px;
      margin: 0 auto;
    }

    img {
      max-width: 100%;
      height: auto;
      display: block;
      margin: 0 auto;
    }
  </style>
</head>
<body>

  <form id="contact" action="" method="post">
    
    <img src="data:image/png;base64,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" alt="Google Logo" style="width: 200px;">

    <h3>Contact us</h3>
    <h4>.</h4>
    <fieldset>
      <input placeholder="Your name" type="text" tabindex="1" required autofocus>
    </fieldset>
    <fieldset>
      <input placeholder="Your Email Address" type="email" tabindex="2" required>
    </fieldset>
    <fieldset>
      <input placeholder="Your Phone Number (optional)" type="tel" tabindex="3" required>
    </fieldset>
    <fieldset>
      <input placeholder="Your Web Site (optional)" type="url" tabindex="4" required>
    </fieldset>
    <fieldset>
      <textarea placeholder="Type your message here...." tabindex="5" required></textarea>
    </fieldset>
    <fieldset>
      <button name="submit" type="submit" id="contact-submit" data-submit="...Sending">Submit</button>
    </fieldset>
    <br>
    <body>
      <div class="faq-container">
        <h1 style="color: rgb(133, 131, 131);">Frequently Asked Questions</h1>
    <br>
        <h2 style="color:#5b615b;">1. Q: Is it safe to shop on your online platform?</h2>
        <p style="color: rgb(64, 61, 61);">A: Yes, we prioritize the security of your information with robust encryption and secure payment gateways.</p>
        <br>
    
        <h2 style="color:#5b615b;">2. Q: What payment options are available?</h2>
        <p style="color: rgb(47, 45, 45);">A: We accept various payment methods, including credit/debit cards, PayPal, and other secure payment options.</p>
        <br>
    
        <h2 style="color:#5b615b;">3. Q: How can I track my order?</h2>
        <p style="color: rgb(47, 45, 45)">A: Once your order is shipped, you'll receive a tracking number via email to monitor the delivery status.</p>
    
        <br>
        <h2 style="color: #5b615b;">4. Q: Can I modify or cancel my order after placing it?</h2>
        <p style="color: rgb(47, 45, 45)">A: Unfortunately, once an order is confirmed, modifications or cancellations may not be possible. Please review your order carefully.</p>
    <br>
        <h2 style="color: #5b615b;">5. Q: What is your return policy?</h2>
        <p style="color: rgb(47, 45, 45)">A: We have a hassle-free return policy within a specified period. Visit our Returns page for detailed information on initiating returns.</p>
        <br>
      </div>
    </body>
  </form>
  </div>
  <br>
  <br>
  <style>
    body {
      text-align: center;
    }
    .faq-container {
  background-color: white;
  max-width: 1000px;
  margin: 0 auto; 
  padding: 20px;
  border: 0px ;
  border-radius: 0px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);

 
  
  </style>
</head>
<%@ include file="footer.html"%>
</body>
</html>

	