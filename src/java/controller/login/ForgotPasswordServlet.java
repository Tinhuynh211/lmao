package controller.login;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ForgotPasswordServlet
 */
public class ForgotPasswordServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String email = request.getParameter("email");
        RequestDispatcher dispatcher = null;
        int otpValue = 0;
        HttpSession mySession = request.getSession();

        if (email != null || !email.equals("")) {
            // sending otp
            Random rand = new Random();
            int min = 100000;
            int max = 999999;
            otpValue = rand.nextInt(max - min + 1) + min;
            /*
            - "rand.nextInt(max - min + 1)" tạo một số nguyên ngẫu nhiên từ 0 đến max - min. 
            Trong trường hợp này, max - min là 999999 - 100000 = 899999.
            - "+ min" được thêm vào để dịch chuyển phạm vi ngẫu nhiên từ 0-899999 
            thành 100000-999999, giúp đảm bảo số có đúng 6 chữ số.
             */
            

            String to = email;// change accordingly
            // Get the session object
            Properties props = new Properties();
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.socketFactory.port", "465");
            props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.port", "465");
            Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication("noreply.and.subscribe999@gmail.com",
                            "pnwf gcay jams atwz");
                    // Put your email id and
                    // password (from App passwords) here
                }
            });
            // compose message
            try {
                MimeMessage message = new MimeMessage(session);
                message.setFrom(new InternetAddress(email));// change accordingly
                message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
                message.setSubject("Forgot password in MangaUniver");
                message.setText("Your OTP is: " + otpValue);
                // send message
                Transport.send(message);
                System.out.println("message sent successfully");
            } catch (MessagingException e) {
                throw new RuntimeException(e);
            }
//            dispatcher = request.getRequestDispatcher("enterOtp.jsp");
            request.setAttribute("message", "OTP is sent to your Email");

            //       
            mySession.setAttribute("otp", otpValue);
            mySession.setAttribute("email", email);
            request.getRequestDispatcher("enterOtp.jsp").forward(request, response);
            //request.setAttribute("status", "success");
        }

    }

}
