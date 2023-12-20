package com.shashi.srv;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shashi.utility.MailMessage;

@WebServlet("/fansMessage")
public class FansMessage extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String comments = request.getParameter("comments");

        String htmlTextMessage = buildEmailMessage(name, email, comments);

        String message;
        try {
            // Send email to the provided email address
            MailMessage.sendMessage(email,"Hey " + name + ", Your Question about Green SuperMarket is Successfully sent!",
                    htmlTextMessage);

            // Send email to the additional recipients
            MailMessage.sendMessage("raminda5575@gmail.com", "New Question about Green SuperMarket is asked by " + name + " | " + email,
                    htmlTextMessage);

            message = "Your Question is Successfully Sent to Both Recipients";
        } catch (Exception e) {
            e.printStackTrace(); // Log the exception for debugging
            message = "Failed: Please Configure mailer.email and password in application.properties first";
        }

        RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
        rd.include(request, response);

        response.getWriter().print("<script>alert('" + message + "')</script>");
    }

    private String buildEmailMessage(String name, String email, String comments) {
        // Escape user input to prevent XSS attacks
        String escapedName = escapeHtml(name);
        String escapedEmail = escapeHtml(email);
        String escapedComments = escapeHtml(comments);

        return "<html><head><style>"
                + "body { font-family: 'Times New Roman', serif; background-color: #f9f9f9; margin: 20px; padding: 20px; }"
                + "h2 { color: #5fda5f; } span { color: #808080; }"
                + "</style></head><body>"
                + "<h2>Official Communication from Green SuperMarket</h2>"
                + "<p>Dear Valued Customer,</p>"
                + "<p>We hope this message finds you well. Your recent inquiry regarding Green SuperMarket has been received and we appreciate your engagement with our services.</p>"
                + "<p><strong>Name:</strong> " + escapedName + ",</p>"
                + "<p><strong>Email Id:</strong> " + escapedEmail + "</p>"
                + "<p><strong>Comment:</strong> <span>" + escapedComments + "</span></p>"
                + "<p>At Green SuperMarket, we strive to provide the best possible experience for our customers, and your feedback is instrumental in helping us achieve this goal.</p>"
                + "<p>We are pleased to have you as part of our community, and we want to express our gratitude for choosing Green SuperMarket.</p>"
                + "<p>Thanks & Regards,</p>"
                + "<p>The Green SuperMarket Team</p>"
                + "</body></html>";
    }

    private String escapeHtml(String input) {
        // Implement HTML escaping logic
        return input.replace("&", "&amp;")
                .replace("<", "&lt;")
                .replace(">", "&gt;")
                .replace("\"", "&quot;")
                .replace("'", "&#39;");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
    }
}
