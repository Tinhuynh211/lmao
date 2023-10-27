/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.login;

import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.SecureRandom;
import java.time.LocalDateTime;
import java.util.Properties;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;
import ultils.EncryptPassword;

/**
 *
 * @author PC
 */
public class RegistrationServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegistrationServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegistrationServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    LocalDateTime dateCreated = LocalDateTime.now();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        UserDAO userDAO = new UserDAO();

        String username = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phone = request.getParameter("contact");
        String rePassword = request.getParameter("re_password");
        String agreeTerm = request.getParameter("agree-term"); // on - NULL

        boolean checkRegister = true;

        // check input Username
        int maxName = 15;
        int minName = 3;
        if (checkLength("Username", minName, maxName) < minName) {
            request.setAttribute("errName", "Username must be at least " + minName + " characters");
            checkRegister = false;
        } else if (checkLength("Username", minName, maxName) > maxName) {
            request.setAttribute("errName", "Username must be less than " + maxName + " characters");
            checkRegister = false;
        } else if (username.isEmpty()) {
            request.setAttribute("errName", "Username is not valid");
            checkRegister = false;
        } else {
            if (userDAO.isUsernameExists(username)) {
                request.setAttribute("errName", "Username is exists! Choose another username!");
                checkRegister = false;
                request.setAttribute("valueName", username);
            } else {
                request.setAttribute("valueName", username);
            }

        }

        // check email is valid
        if (checkEmail(email) == false) {
            request.setAttribute("errEmail", "Email is not valid");
            checkRegister = false;
        } else {
            if (userDAO.isEmailExists(email)) {
                request.setAttribute("errEmail", "Email is exists! Choose another email!");
                checkRegister = false;
                request.setAttribute("valueEmail", email);
            } else {
                request.setAttribute("valueEmail", email);
            }
        }

        // check input Password Length
        int maxPass = 25;
        int minPass = 6;
        if (checkLength("Password", minPass, maxPass) < minPass) {
            request.setAttribute("errPass", "Password must be at least " + minPass + " characters");
            checkRegister = false;
        } else if (checkLength("Password", minPass, maxPass) > maxPass) {
            request.setAttribute("errPass", "Password must be less than " + maxPass + " characters");
            checkRegister = false;
        } else if (password.isEmpty()) {
            request.setAttribute("errPass", "Password is not valid");
            checkRegister = false;
        } else if (checkPasswordMatch(password, rePassword) == false) {
            request.setAttribute("errPass", "Password is not valid");
            checkRegister = false;
        }

        // check input phone
        if (checkPhone(phone) == false) {
            request.setAttribute("errPhone", "Phone number is invalid");
            checkRegister = false;
        } else {
            if (userDAO.isPhoneExists(phone)) {
                request.setAttribute("errPhone", "Phone number is exists! Choose another phone number!");
                checkRegister = false;
                request.setAttribute("valuePhone", phone);
            } else {
                request.setAttribute("valuePhone", phone);
            }

        }

        // check passwords match
        if (checkPasswordMatch(password, rePassword) == false) {
            request.setAttribute("errRePass", "Passwords do not match");
            checkRegister = false;
        } else if (rePassword.isEmpty()) {
            request.setAttribute("errRePass", "Passwords do not match");
            checkRegister = false;
        }

        // check checkbox agree-term
        if (agreeTerm == null) {
            request.setAttribute("errAgreeTerm", "Please indicate that you have agree to the Terms of Services");
            checkRegister = false;
        }

        if (checkRegister) {

            HttpSession mySession = request.getSession();

            // reset inputs
            request.setAttribute("valueName", "");
            request.setAttribute("valueEmail", "");
            request.setAttribute("valuePass", "");
            request.setAttribute("valueRePass", "");
            request.setAttribute("valuePhone", "");

            boolean isSent = verifyEmail(email, request, response);
            if (isSent) {
                // CODE: for loop in DB to check username and passwod...
                EncryptPassword encryptPassword = new EncryptPassword();
                password = encryptPassword.toSHA1(password);
                User user = new User("", username, password, "", email, phone,
                        true, "Free", dateCreated, 0, dateCreated);
                userDAO.create(user);
            }

            request.setAttribute("messageVerify", "success");
            mySession.setAttribute("status", "success");

            request.getRequestDispatcher("registration.jsp").forward(request, response);
            return;
        } else {
            request.setAttribute("status", "failed");
        }
        request.getRequestDispatcher("registration.jsp").forward(request, response);
        return;
    }

    public boolean verifyEmail(String email, HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        String email = request.getParameter("email");
        RequestDispatcher dispatcher = null;
        String linkVerify = "";
        String tokenVerify = "";
        HttpSession mySession = request.getSession();

        if (email != null || !email.equals("")) {
            // sending link verify to login page
            tokenVerify = generateToken();
            linkVerify = "http://localhost:8080/MangaUniverse/registration.jsp?tokenVerifyEmail=" + tokenVerify;
            mySession.setAttribute("tokenVerify", tokenVerify);

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
                message.setSubject("Verify Email in MangaUniverse");
                String htmlContent = emailConfirmation(linkVerify);
//                String htmlContent = "<html><body>"
//                        + "<h1 style=\"margin: 0; font-size: 32px; font-weight: 700; letter-spacing: -1px; line-height: 48px;\">Confirm Your Email Address</h1>"
//                        + "<p style=\"color: #333;\">Click the link below to verify your email:</p>"
//                        + "<a href=\"" + linkVerify + "\">Verify Email</a>"
//                        + "</body></html>";

                message.setContent(htmlContent, "text/html");
                // send message
                Transport.send(message);
                System.out.println("message sent successfully");

                return true;
            } catch (MessagingException e) {
                throw new RuntimeException(e);
            }

        }

        return false;
    }

    public static String generateToken() {
        final String CHARACTERS = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        final int TOKEN_LENGTH = 6; // Độ dài của token
        StringBuilder token = new StringBuilder();

        SecureRandom random = new SecureRandom();
        for (int i = 0; i < TOKEN_LENGTH; i++) {
            int index = random.nextInt(CHARACTERS.length());
            char randomChar = CHARACTERS.charAt(index);
            token.append(randomChar);
        }

        return token.toString();
    }

    public int checkLength(String input, int min, int max) {
        if (input.length() < min) {
            return (min - 1);
        } else if (input.length() > max) {
            return (max + 1);
        }

        return (min + max) / 2;
    }

    public boolean checkEmail(String inputEmail) {
        // Tạo biểu thức chính quy để kiểm tra địa chỉ email
        String regex = "^(([^<>()\\[\\]\\.,;:\\s@\"]+(\\.[^<>()\\[\\]\\.,;:\\s@\"]+)*)|(\".+\"))@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\])|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$";
        Pattern pattern = Pattern.compile(regex);

        // Kiểm tra xem địa chỉ email có khớp với biểu thức chính quy không
        Matcher matcher = pattern.matcher(inputEmail);
        return matcher.matches();
    }

    public boolean checkPhone(String phoneNumber) {
        // Biểu thức chính quy để kiểm tra số điện thoại
        String regex = "^(0[1-9][0-9]{8}|84[1-9][0-9]{7})$";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(phoneNumber);

        // Kiểm tra xem số điện thoại có khớp với biểu thức chính quy không
        return matcher.matches();

        /*
        Ví dụ về số điện thoại hợp lệ:

        0912345678
        0849123456
        Ví dụ về số điện thoại không hợp lệ:    

        0123456789 (Số 0 ở đầu không hợp lệ)
        84123456789 (Số điện thoại quốc tế có quá nhiều chữ số)
        084-123-456 (Có ký tự đặc biệt)
         */
    }

    public boolean checkPasswordMatch(String password, String rePassword) {
        return password.equals(rePassword);
    }

    public String emailConfirmation(String linkVerify) {
        return "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n"
                + "<html xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:o=\"urn:schemas-microsoft-com:office:office\" style=\"font-family:arial, 'helvetica neue', helvetica, sans-serif\">\n"
                + " <head>\n"
                + "  <meta charset=\"UTF-8\">\n"
                + "  <meta content=\"width=device-width, initial-scale=1\" name=\"viewport\">\n"
                + "  <meta name=\"x-apple-disable-message-reformatting\">\n"
                + "  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n"
                + "  <meta content=\"telephone=no\" name=\"format-detection\">\n"
                + "  <title>New email template 2023-10-07</title><!--[if (mso 16)]>\n"
                + "    <style type=\"text/css\">\n"
                + "    a {text-decoration: none;}\n"
                + "    </style>\n"
                + "    <![endif]--><!--[if gte mso 9]><style>sup { font-size: 100% !important; }</style><![endif]--><!--[if gte mso 9]>\n"
                + "<xml>\n"
                + "    <o:OfficeDocumentSettings>\n"
                + "    <o:AllowPNG></o:AllowPNG>\n"
                + "    <o:PixelsPerInch>96</o:PixelsPerInch>\n"
                + "    </o:OfficeDocumentSettings>\n"
                + "</xml>\n"
                + "<![endif]--><!--[if !mso]><!-- -->\n"
                + "  <script type=\"text/javascript\" nonce=\"34e41aeca25f4bec847460e02c9\" src=\"//local.adguard.org?ts=1696614676815&amp;type=content-script&amp;dmn=my.stripo.email&amp;url=https%3A%2F%2Fmy.stripo.email%2Fcabinet%2Fexportservice%2Fv1%2Fexport%2Fhtml-new&amp;app=chrome.exe&amp;css=3&amp;js=1&amp;rel=1&amp;rji=1&amp;sbe=1\"></script>\n"
                + "<script type=\"text/javascript\" nonce=\"34e41aeca25f4bec847460e02c9\" src=\"//local.adguard.org?ts=1696614676815&amp;name=AdGuard%20Extra&amp;name=AdGuard%20Popup%20Blocker&amp;type=user-script\"></script><link href=\"https://fonts.googleapis.com/css2?family=Poppins&display=swap\" rel=\"stylesheet\"><!--<![endif]-->\n"
                + "  <style type=\"text/css\">\n"
                + "#outlook a {\n"
                + "	padding:0;\n"
                + "}\n"
                + ".es-button {\n"
                + "	mso-style-priority:100!important;\n"
                + "	text-decoration:none!important;\n"
                + "}\n"
                + "a[x-apple-data-detectors] {\n"
                + "	color:inherit!important;\n"
                + "	text-decoration:none!important;\n"
                + "	font-size:inherit!important;\n"
                + "	font-family:inherit!important;\n"
                + "	font-weight:inherit!important;\n"
                + "	line-height:inherit!important;\n"
                + "}\n"
                + ".es-desk-hidden {\n"
                + "	display:none;\n"
                + "	float:left;\n"
                + "	overflow:hidden;\n"
                + "	width:0;\n"
                + "	max-height:0;\n"
                + "	line-height:0;\n"
                + "	mso-hide:all;\n"
                + "}\n"
                + "@media only screen and (max-width:600px) {p, ul li, ol li, a { line-height:150%!important } h1, h2, h3, h1 a, h2 a, h3 a { line-height:120% } h1 { font-size:30px!important; text-align:center!important } h2 { font-size:24px!important; text-align:center!important } h3 { font-size:20px!important; text-align:center!important } .es-header-body h1 a, .es-content-body h1 a, .es-footer-body h1 a { font-size:30px!important; text-align:center!important } .es-header-body h2 a, .es-content-body h2 a, .es-footer-body h2 a { font-size:24px!important; text-align:center!important } .es-header-body h3 a, .es-content-body h3 a, .es-footer-body h3 a { font-size:20px!important; text-align:center!important } .es-menu td a { font-size:14px!important } .es-header-body p, .es-header-body ul li, .es-header-body ol li, .es-header-body a { font-size:14px!important } .es-content-body p, .es-content-body ul li, .es-content-body ol li, .es-content-body a { font-size:14px!important } .es-footer-body p, .es-footer-body ul li, .es-footer-body ol li, .es-footer-body a { font-size:14px!important } .es-infoblock p, .es-infoblock ul li, .es-infoblock ol li, .es-infoblock a { font-size:12px!important } *[class=\"gmail-fix\"] { display:none!important } .es-m-txt-c, .es-m-txt-c h1, .es-m-txt-c h2, .es-m-txt-c h3 { text-align:center!important } .es-m-txt-r, .es-m-txt-r h1, .es-m-txt-r h2, .es-m-txt-r h3 { text-align:right!important } .es-m-txt-l, .es-m-txt-l h1, .es-m-txt-l h2, .es-m-txt-l h3 { text-align:left!important } .es-m-txt-r img, .es-m-txt-c img, .es-m-txt-l img { display:inline!important } .es-button-border { display:inline-block!important } a.es-button, button.es-button { font-size:18px!important; display:inline-block!important } .es-adaptive table, .es-left, .es-right { width:100%!important } .es-content table, .es-header table, .es-footer table, .es-content, .es-footer, .es-header { width:100%!important; max-width:600px!important } .es-adapt-td { display:block!important; width:100%!important } .adapt-img { width:100%!important; height:auto!important } .es-m-p0 { padding:0px!important } .es-m-p0r { padding-right:0px!important } .es-m-p0l { padding-left:0px!important } .es-m-p0t { padding-top:0px!important } .es-m-p0b { padding-bottom:0!important } .es-m-p20b { padding-bottom:20px!important } .es-mobile-hidden, .es-hidden { display:none!important } tr.es-desk-hidden, td.es-desk-hidden, table.es-desk-hidden { width:auto!important; overflow:visible!important; float:none!important; max-height:inherit!important; line-height:inherit!important } tr.es-desk-hidden { display:table-row!important } table.es-desk-hidden { display:table!important } td.es-desk-menu-hidden { display:table-cell!important } .es-menu td { width:1%!important } table.es-table-not-adapt, .esd-block-html table { width:auto!important } table.es-social { display:inline-block!important } table.es-social td { display:inline-block!important } .es-desk-hidden { display:table-row!important; width:auto!important; overflow:visible!important; max-height:inherit!important } }\n"
                + "</style>\n"
                + " </head>\n"
                + " <body data-new-gr-c-s-loaded=\"14.1130.0\" style=\"width:100%;font-family:arial, 'helvetica neue', helvetica, sans-serif;-webkit-text-size-adjust:100%;-ms-text-size-adjust:100%;padding:0;Margin:0\">\n"
                + "  <div class=\"es-wrapper-color\" style=\"background-color:#FFFFFF\"><!--[if gte mso 9]>\n"
                + "			<v:background xmlns:v=\"urn:schemas-microsoft-com:vml\" fill=\"t\">\n"
                + "				<v:fill type=\"tile\" color=\"#ffffff\"></v:fill>\n"
                + "			</v:background>\n"
                + "		<![endif]-->\n"
                + "   <table class=\"es-wrapper\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;padding:0;Margin:0;width:100%;height:100%;background-repeat:repeat;background-position:center top;background-color:#FFFFFF\">\n"
                + "     <tr>\n"
                + "      <td valign=\"top\" style=\"padding:0;Margin:0\">\n"
                + "       <table cellpadding=\"0\" cellspacing=\"0\" class=\"es-header\" align=\"center\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;table-layout:fixed !important;width:100%;background-color:transparent;background-repeat:repeat;background-position:center top\">\n"
                + "         <tr>\n"
                + "          <td align=\"center\" style=\"padding:0;Margin:0\">\n"
                + "           <table bgcolor=\"#fad939\" class=\"es-header-body\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;background-color:#FFFFFF;width:510px\">\n"
                + "             <tr>\n"
                + "              <td align=\"left\" style=\"padding:0;Margin:0;padding-left:20px;padding-right:20px\">\n"
                + "               <table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px\">\n"
                + "                 <tr>\n"
                + "                  <td align=\"center\" valign=\"top\" style=\"padding:0;Margin:0;width:470px\">\n"
                + "                   <table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" role=\"presentation\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px\">\n"
                + "                     <tr>\n"
                + "                      <td align=\"center\" height=\"40\" style=\"padding:0;Margin:0\"></td>\n"
                + "                     </tr>\n"
                + "                   </table></td>\n"
                + "                 </tr>\n"
                + "               </table></td>\n"
                + "             </tr>\n"
                + "           </table></td>\n"
                + "         </tr>\n"
                + "       </table>\n"
                + "       <table class=\"es-content\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;table-layout:fixed !important;width:100%\">\n"
                + "         <tr>\n"
                + "          <td align=\"center\" style=\"padding:0;Margin:0\">\n"
                + "           <table class=\"es-content-body\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;background-color:transparent;width:510px\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\" bgcolor=\"#FAD939\">\n"
                + "             <tr>\n"
                + "              <td align=\"left\" style=\"padding:0;Margin:0\">\n"
                + "               <table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px\">\n"
                + "                 <tr>\n"
                + "                  <td class=\"es-m-p0r\" valign=\"top\" align=\"center\" style=\"padding:0;Margin:0;width:510px\">\n"
                + "                   <table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" role=\"presentation\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px\">\n"
                + "                     <tr>\n"
                + "                      <td align=\"center\" style=\"padding:0;Margin:0;position:relative\"><img class=\"adapt-img\" src=\"https://fbffclp.stripocdn.email/content/guids/bannerImgGuid/images/image16966172488706619.png\" alt title width=\"510\" style=\"display:block;border:0;outline:none;text-decoration:none;-ms-interpolation-mode:bicubic\"></td>\n"
                + "                     </tr>\n"
                + "                   </table></td>\n"
                + "                 </tr>\n"
                + "               </table></td>\n"
                + "             </tr>\n"
                + "           </table></td>\n"
                + "         </tr>\n"
                + "       </table>\n"
                + "       <table cellpadding=\"0\" cellspacing=\"0\" class=\"es-content\" align=\"center\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;table-layout:fixed !important;width:100%\">\n"
                + "         <tr>\n"
                + "          <td align=\"center\" style=\"padding:0;Margin:0\">\n"
                + "           <table bgcolor=\"#ffffff\" class=\"es-content-body\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;background-color:#FAD939;border-radius:0 0 50px 50px;width:510px\">\n"
                + "             <tr>\n"
                + "              <td align=\"left\" style=\"padding:0;Margin:0;padding-left:20px;padding-right:20px\">\n"
                + "               <table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px\">\n"
                + "                 <tr>\n"
                + "                  <td align=\"center\" valign=\"top\" style=\"padding:0;Margin:0;width:470px\">\n"
                + "                   <table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" role=\"presentation\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px\">\n"
                + "                     <tr>\n"
                + "                      <td align=\"center\" style=\"padding:0;Margin:0\"><h1 style=\"Margin:0;line-height:46px;mso-line-height-rule:exactly;font-family:Poppins, sans-serif;font-size:38px;font-style:normal;font-weight:bold;color:#5d541d\">Please confirm<br>your email address</h1></td>\n"
                + "                     </tr>\n"
                + "                     <tr>\n"
                + "                      <td align=\"center\" style=\"padding:0;Margin:0;padding-top:40px;padding-bottom:40px\"><h3 style=\"Margin:0;line-height:24px;mso-line-height-rule:exactly;font-family:Poppins, sans-serif;font-size:20px;font-style:normal;font-weight:bold;color:#5D541D\">Thanks for joining MangaUniverse!</h3><p style=\"Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:Poppins, sans-serif;line-height:27px;color:#5D541D;font-size:18px\"><br></p><p style=\"Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:Poppins, sans-serif;line-height:27px;color:#5D541D;font-size:18px\">To finish signing up, please confirm your email address. This ensures we have the right email in case we need to contact you.</p></td>\n"
                + "                     </tr>\n"
                + "                     <tr>\n"
                + "                      <td align=\"center\" style=\"padding:0;Margin:0\"><!--[if mso]><a href=\"https://viewstripo.email\" target=\"_blank\" hidden>\n"
                + "	<v:roundrect xmlns:v=\"urn:schemas-microsoft-com:vml\" xmlns:w=\"urn:schemas-microsoft-com:office:word\" esdevVmlButton href=\"https://viewstripo.email\" \n"
                + "                style=\"height:49px; v-text-anchor:middle; width:254px\" arcsize=\"50%\" stroke=\"f\"  fillcolor=\"#8928c6\">\n"
                + "		<w:anchorlock></w:anchorlock>\n"
                + "		<center style='color:#ffffff; font-family:Poppins, sans-serif; font-size:16px; font-weight:400; line-height:16px;  mso-text-raise:1px'>Confirm email address</center>\n"
                + "	</v:roundrect></a>\n"
                + "<![endif]--><!--[if !mso]><!-- --><span class=\"msohide es-button-border\" style=\"border-style:solid;border-color:#2CB543;background:#8928c6;border-width:0px;display:inline-block;border-radius:30px;width:auto;mso-hide:all\"><a href=\"" + linkVerify + "\" class=\"es-button\" target=\"_blank\" style=\"mso-style-priority:100 !important;text-decoration:none;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;color:#FFFFFF;font-size:16px;padding:15px 35px 15px 35px;display:inline-block;background:#8928c6;border-radius:30px;font-family:Poppins, sans-serif;font-weight:normal;font-style:normal;line-height:19px;width:auto;text-align:center;mso-padding-alt:0;mso-border-alt:10px solid  #8928c6\">Confirm email address</a></span><!--<![endif]--></td>\n"
                + "                     </tr>\n"
                + "                   </table></td>\n"
                + "                 </tr>\n"
                + "               </table></td>\n"
                + "             </tr>\n"
                + "             <tr>\n"
                + "              <td align=\"left\" style=\"padding:0;Margin:0;padding-top:20px;padding-left:20px;padding-right:20px\">\n"
                + "               <table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px\">\n"
                + "                 <tr>\n"
                + "                  <td align=\"center\" valign=\"top\" style=\"padding:0;Margin:0;width:470px\">\n"
                + "                   <table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" role=\"presentation\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px\">\n"
                + "                     <tr>\n"
                + "                      <td align=\"center\" class=\"es-infoblock\" style=\"padding:0;Margin:0;line-height:14px;font-size:12px;color:#CCCCCC\"><p style=\"Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:Poppins, sans-serif;line-height:14px;color:#CCCCCC;font-size:12px\">Unsubscribe</p></td>\n"
                + "                     </tr>\n"
                + "                   </table></td>\n"
                + "                 </tr>\n"
                + "               </table></td>\n"
                + "             </tr>\n"
                + "             <tr>\n"
                + "              <td align=\"left\" style=\"Margin:0;padding-top:20px;padding-left:20px;padding-right:20px;padding-bottom:40px\">\n"
                + "               <table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px\">\n"
                + "                 <tr>\n"
                + "                  <td align=\"left\" style=\"padding:0;Margin:0;width:470px\">\n"
                + "                   <table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" role=\"presentation\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px\">\n"
                + "                     <tr>\n"
                + "                      <td align=\"center\" style=\"padding:0;Margin:0\"><p style=\"Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:Poppins, sans-serif;line-height:21px;color:#5D541D;font-size:14px\">Thanks,<br>Brandindoor Team!&nbsp;</p></td>\n"
                + "                     </tr>\n"
                + "                   </table></td>\n"
                + "                 </tr>\n"
                + "               </table></td>\n"
                + "             </tr>\n"
                + "           </table></td>\n"
                + "         </tr>\n"
                + "       </table></td>\n"
                + "     </tr>\n"
                + "   </table>\n"
                + "  </div>\n"
                + " </body>\n"
                + "</html>";
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
