/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.login;

import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
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
public class LoginServlet extends HttpServlet {

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
            out.println("<title>Servlet LoginServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("login.jsp").forward(request, response);
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
        
        UserDAO userDAO = new UserDAO();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        HttpSession mySession = request.getSession();

        boolean checkLoginValid = true;

        if (username == null || username.equals("")) {
            request.setAttribute("errUsername", "Username is not valid");
            checkLoginValid = false;
        } else {
            request.setAttribute("valueUsername", username);
        }

        if (password == null || password.equals("")) {
            request.setAttribute("errPassword", "Password is not valid");
            checkLoginValid = false;

        } else {
            request.setAttribute("valuePassword", password);
        }

        if (checkLoginValid) {

            boolean checkLogin = true;
            PrintWriter out = response.getWriter();


            // check username in DB
            if (userDAO.isUsernameExists(username) == false) {
                mySession.setAttribute("status", "failedUsername");
                checkLogin = false;
                request.setAttribute("valueUsername", "");

            } else {
                // Next, check password of username in DB
                EncryptPassword encryptPassword = new EncryptPassword();
                password = encryptPassword.toSHA1(password);
                if (userDAO.isUserExists(username, password) == false) {
                    mySession.setAttribute("status", "failedPassword");
                    request.setAttribute("valuePassword", "");
                    checkLogin = false;
                    request.setAttribute("valueUsername", username);
                }

            }

            if (checkLogin) {

                request.setAttribute("valueUsername", "");
                request.setAttribute("valuePassword", "");
                request.setAttribute("errUsername", "");
                request.setAttribute("errPassword", "");
                request.setAttribute("status", "success");
                
                User userSession = userDAO.getUserByUsername(username, password);
                mySession.setAttribute("userSession", userSession);

//                    request.getRequestDispatcher("UserProfileServlet").forward(request, response);
                request.getRequestDispatcher("userProfile.jsp").forward(request, response);
                return;
            }


        }
//        response.sendRedirect("login.jsp");
        request.getRequestDispatcher("login.jsp").forward(request, response);

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
