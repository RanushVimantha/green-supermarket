package com.green.utility;

import jakarta.mail.MessagingException;

public class TestMail {
	public static void main(String[] args) {
		try {
			String recipient = "raminda5575@gmail.com";
			String subject = "Mail Configuration Successfull";
			String htmlTextMessage = "<html><body style='font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background-color: #f9f9f9; color: #333; padding: 20px; margin: 0;'>"
				    + "<h2 style='color: rgb(95, 218, 95); margin-bottom: 20px;'>Welcome to Green Supermarket</h2>"
				    + "<p style='font-size: 16px;'>Hi,</p>"
				    + "<p style='font-size: 16px; margin-bottom: 20px;'>Thank you for choosing Green Supermarket. We're thrilled to have you join our community!</p>"
				    + "<p style='font-size: 16px; margin-bottom: 20px;'>Explore our latest assortment of high-quality goods, products, and commodities on our beautifully designed platform.</p>"
				    + "<p style='font-size: 16px; margin-bottom: 20px;'>Our online store is flourishing, and we owe it all to your invaluable support. As a token of our gratitude, enjoy hassle-free home delivery with no additional charges.</p>"
				    + "<p style='font-size: 16px; margin-bottom: 20px;'>Discover a vast collection of branded items, carefully curated for you. Experience the convenience of having your favorites delivered straight to your doorstep.</p>"
				    + "<p style='font-size: 16px; margin-bottom: 20px;'>We are dedicated to providing you with an exceptional shopping experience. Should you have any questions or special requests, our team is here to assist you.</p>"
				    + "<p style='font-size: 16px; margin-bottom: 20px;'>Thank you once again for being a cherished member of the Green Supermarket family. We eagerly anticipate the pleasure of serving you for many years to come.</p>"
				    + "<p style='font-size: 16px; margin-bottom: 20px;'>Wishing you a fantastic day filled with joy and delightful discoveries!</p>"
				    + "</body></html>";
			JavaMailUtil.sendMail(recipient, subject, htmlTextMessage);
			System.out.println("Mail Sent Successfully!");

		} catch (MessagingException e) {
			System.out.println("Mail Sending Failed With Error: " + e.getMessage());
			e.printStackTrace();
		}
	}

}
