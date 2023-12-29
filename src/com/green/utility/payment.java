package com.green.utility;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.DecimalFormat;
/**
 * Servlet implementation class payment
 */
@WebServlet("/payment")
public class payment {
	public static void main(String[] args) {
        String merahantID     = "1225349";
        String merchantSecret = "NTU3MzEzNTEyNDI2OTE0OTEyMjMwMTYzMTU0ODI0NTMyMTczMTM=";
        String orderID        = "12345";
        double amount         = 100;
        String currency       = "LKR";
        DecimalFormat df       = new DecimalFormat("0.00");
        String amountFormatted = df.format(amount);
        String hash    = getMd5(merahantID + orderID + amountFormatted + currency + getMd5(merchantSecret));
        System.out.println("Generated Hash: " + hash);
    }

public static String getMd5(String input) {
    try {
        MessageDigest md = MessageDigest.getInstance("MD5");
        byte[] messageDigest = md.digest(input.getBytes());
        BigInteger no = new BigInteger(1, messageDigest);
        String hashtext = no.toString(16);
        while (hashtext.length() < 32) {
            hashtext = "0" + hashtext;
        }
        return hashtext.toUpperCase();
    }
    catch (NoSuchAlgorithmException e) {
        throw new RuntimeException(e);
    }
}
}
