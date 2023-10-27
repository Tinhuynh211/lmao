/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.login;

import ultils.GoogleUtils;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;
import model.UserGoogleDTO;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Request;
import org.apache.http.client.fluent.Form;
import ultils.EncryptPassword;

/**
 *
 * @author PC
 */
public class RegisterGoogleServlet extends HttpServlet {

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
            out.println("<title>Servlet RegisterGoogleServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterGoogleServlet at " + request.getContextPath() + "</h1>");
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
    LocalDateTime dateCreated = LocalDateTime.now();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String code = request.getParameter("code");
        if (code == null || code.isEmpty()) {
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            String accessToken = GoogleUtils.getTokenRegister(code);
            UserGoogleDTO userGoogleDTO = GoogleUtils.getUserInfo(accessToken);

            request.setAttribute("id", userGoogleDTO.getId()); // password
            request.setAttribute("email", userGoogleDTO.getEmail()); // == username
            request.setAttribute("verified_email", userGoogleDTO.isVerified_email());
            request.setAttribute("name", userGoogleDTO.getName());
            request.setAttribute("given_name", userGoogleDTO.getGiven_name());
            request.setAttribute("family_name", userGoogleDTO.getFamily_name());
            request.setAttribute("link", userGoogleDTO.getLink());
            request.setAttribute("picture", userGoogleDTO.getPicture());

            UserDAO userDAO = new UserDAO();
            HttpSession mySession = request.getSession();

            if (userDAO.isEmailExists(userGoogleDTO.getEmail())) {
                mySession.setAttribute("status", "failedRegisterGoogle");
                response.sendRedirect("registration.jsp");
                return;

            } else {
                String password = "";
                EncryptPassword encryptPassword = new EncryptPassword();
                password = encryptPassword.toSHA1(userGoogleDTO.getId());
                
                User user = new User(userGoogleDTO.getPicture(), userGoogleDTO.getEmail(),
                        password, "", userGoogleDTO.getEmail(), "",
                        true, "Free", dateCreated, 0, dateCreated);
                userDAO.create(user);
                mySession.setAttribute("userSession", user);
            }

            response.sendRedirect("userProfile.jsp");

//            request.getRequestDispatcher("userProfile.jsp").  forward(request, response); 
//   => Error 500: Bad Request -> when trying resend the `code`
//request.getRequestDispatcher("demo.jsp").forward(request, response);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
