package com.green.utility;

import jakarta.mail.MessagingException;

public class MailMessage {
	public static void registrationSuccess(String emailId, String name) {
		String recipient = emailId;
		String subject = "Registration Successfull";
		String htmlTextMessage = "<html><body style='font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background-color: #f9f9f9; color: #333; padding: 20px; margin: 0;'>"
			    + "<h2 style='color: rgb(95, 218, 95); margin-bottom: 20px;'>Welcome to Green Supermarket</h2>"
			    + "<p style='font-size: 16px;'>Hi " + name + ",</p>"
			    + "<p style='font-size: 16px; margin-bottom: 20px;'>Thank you for choosing Green Supermarket. We're thrilled to have you join our community!</p>"
			    + "<p style='font-size: 16px; margin-bottom: 20px;'>Explore our latest assortment of high-quality goods, products, and commodities on our beautifully designed platform.</p>"
			    + "<p style='font-size: 16px; margin-bottom: 20px;'>Our online store is flourishing, and we owe it all to your invaluable support. As a token of our gratitude, enjoy hassle-free home delivery with no additional charges.</p>"
			    + "<p style='font-size: 16px; margin-bottom: 20px;'>Discover a vast collection of branded items, carefully curated for you. Experience the convenience of having your favorites delivered straight to your doorstep.</p>"
			    + "<p style='font-size: 16px; margin-bottom: 20px;'>We are dedicated to providing you with an exceptional shopping experience. Should you have any questions or special requests, our team is here to assist you.</p>"
			    + "<p style='font-size: 16px; margin-bottom: 20px;'>Thank you once again for being a cherished member of the Green Supermarket family. We eagerly anticipate the pleasure of serving you for many years to come.</p>"
			    + "<p style='font-size: 16px; margin-bottom: 20px;'>Wishing you a fantastic day filled with joy and delightful discoveries!</p>"
			    + "</body></html>";

		try {
			JavaMailUtil.sendMail(recipient, subject, htmlTextMessage);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static void transactionSuccess(String recipientEmail, String name, String transId, double transAmount) {
		String recipient = recipientEmail;
		String subject = "Order Placed at Green Supermarket";
		String htmlTextMessage = "<html><body style='font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background-color: #f9f9f9; color: #333; padding: 20px; margin: 0;'>"
			    + "<p style='font-size: 16px;'>Hey " + name + ",<br/><br/>"
			    + "We are delighted that you chose to shop with Green Supermarket!<br/><br/>"
			    + "Your order has been successfully placed and is currently being processed for shipment."
			    + "<br/>Here are your transaction details:<br/><br/>"
			    + "<span style='color: red; font-weight: bold;'>Order Id:</span> <span style='color: rgb(95, 218, 95); font-weight: bold;'>" + transId + "</span><br/><br/>"
			    + "<span style='color: red; font-weight: bold;'>Amount Paid:</span> <span style='color: rgb(95, 218, 95); font-weight: bold;'>" + transAmount + "</span>"
			    + "<br/><br/>Thanks for choosing Green Supermarket!<br/><br/>"
			    + "Come shop again!<br/><span style='color: rgb(95, 218, 95); font-weight: bold;'>Green Supermarket</span>"
			    + "</p></body></html>";

		try {
			JavaMailUtil.sendMail(recipient, subject, htmlTextMessage);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

	public static void orderShipped(String recipientEmail, String name, String transId, double transAmount) {
		String recipient = recipientEmail;
		String subject = "Your Order has been Shipped from Green Supermarket";
		String htmlTextMessage = "<html><body style='font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background-color: #f9f9f9; color: #333; padding: 20px; margin: 0;'>"
			    + "<p style='font-size: 16px;'>Hey " + name + ",<br/><br/>"
			    + "We're thrilled that you chose to shop with Green Supermarket!<br/><br/>"
			    + "Exciting news! Your order has been successfully shipped and is on its way to be delivered soon."
			    + "<br/>Here are your transaction details:<br/><br/>"
			    + "<span style='color: red; font-weight: bold;'>Order Id:</span> <span style='color: rgb(95, 218, 95); font-weight: bold;'>" + transId + "</span><br/><br/>"
			    + "<span style='color: red; font-weight: bold;'>Amount Paid:</span> <span style='color: rgb(95, 218, 95); font-weight: bold;'>" + transAmount + "</span>"
			    + "<br/><br/>Thanks for choosing Green Supermarket!<br/><br/>"
			    + "Your satisfaction is our priority. Should you have any questions or need assistance, feel free to reach out.<br/><br/>"
			    + "Come shop again!<br/><span style='color: rgb(95, 218, 95); font-weight: bold;'>Green Supermarket</span>"
			    + "</p></body></html>";


		try {
			JavaMailUtil.sendMail(recipient, subject, htmlTextMessage);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

	public static void productAvailableNow(String recipientEmail, String name, String prodName, String prodId) {
		String recipient = recipientEmail;
		String subject = "Product " + prodName + " is Now Available at Green Supermarket";
		String htmlTextMessage = "<html><body style='font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background-color: #f9f9f9; color: #333; padding: 20px; margin: 0;'>"
			    + "<p style='font-size: 16px;'>Hey " + name + ",<br/><br/>"
			    + "We're delighted that you choose to shop with Green Supermarket!<br/><br/>"
			    + "Based on your recent browsing history, it seems you were searching for an item that was not available in sufficient quantity at that time."
			    + "<br/><br/>"
			    + "Great news! The product named <span style='color: rgb(95, 218, 95); font-weight: bold;'>" + prodName + "</span> with "
			    + "Product Id <span style='color: rgb(95, 218, 95); font-weight: bold;'>" + prodId + "</span> is now available in our store!"
			    + "<br/>Here are the details of the product now available for you to shop:<br/><br/>"
			    + "<span style='color: red; font-weight: bold;'>Product Id:</span> <span style='color: rgb(95, 218, 95); font-weight: bold;'>" + prodId + "</span><br/><br/>"
			    + "<span style='color: red; font-weight: bold;'>Product Name:</span> <span style='color: rgb(95, 218, 95); font-weight: bold;'>" + prodName + "</span>"
			    + "<br/><br/>Thanks for considering Green Supermarket!<br/><br/>"
			    + "We look forward to serving you again!<br/><br/><span style='color: rgb(95, 218, 95); font-weight: bold;'>Green Supermarket</span>"
			    + "</p></body></html>";


		try {
			JavaMailUtil.sendMail(recipient, subject, htmlTextMessage);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

	public static String sendMessage(String toEmailId, String subject, String htmlTextMessage) {
		try {
			JavaMailUtil.sendMail(toEmailId, subject, htmlTextMessage);
		} catch (MessagingException e) {
			e.printStackTrace();
			return "System Failed To Send the Email";
		}
		return "SUCCESS";
	}
}
