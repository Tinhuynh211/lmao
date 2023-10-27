/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user;

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
public class ChangePasswordServlet extends HttpServlet {

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
            out.println("<title>Servlet ChangePasswordServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangePasswordServlet at " + request.getContextPath() + "</h1>");
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
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
PrintWriter out = response.getWriter();
        HttpSession mySession = request.getSession();
        UserDAO userDAO = new UserDAO();
        String password = request.getParameter("password");
        String newpassword = request.getParameter("newpassword");
        String renewpassword = request.getParameter("renewpassword");

        boolean checkInput = true;

        if (password.isEmpty() || password == null) {
            mySession.setAttribute("errPassword", "Please enter your password!");
            checkInput = false;
        }

        if (newpassword.isEmpty() || newpassword == null) {
            mySession.setAttribute("errNewPassword", "Please enter your new password!");
            checkInput = false;
        }

        if (renewpassword.isEmpty() || renewpassword == null) {
            mySession.setAttribute("errReNewPassword", "Please enter your re-new password!");
            checkInput = false;
        } else if (newpassword.equals(renewpassword) == false) {
            mySession.setAttribute("errReNewPassword", "Re-new password doesn't match!");
            checkInput = false;
        }

        if (checkInput) {

            User userSession = (User) mySession.getAttribute("userSession");
            EncryptPassword encryptPassword = new EncryptPassword();
            password = encryptPassword.toSHA1(password); // entered

//            out.println("user pass: " + userSession.getPassword());
//            out.println("pass: " + password);
//            out.println("new pass: " + newpassword);
            if (userSession.getPassword().equals(password) == false) {

                request.setAttribute("errPassword", "Wrong Password!");
                request.getRequestDispatcher("userProfile.jsp").forward(request, response);
                return;
            } else {
                request.setAttribute("messageChangePassword", "Change password successfully!");
                newpassword = encryptPassword.toSHA1(newpassword); // entered

                int userId = userDAO.getUserId(userSession.getUsername(), userSession.getPassword(),
                        userSession.getEmail());
                
                userSession.setPassword(newpassword);
                userDAO.update(userSession);
            }

        }

        request.setAttribute("pageChangePassword", ". active .show");
        request.getRequestDispatcher("userProfile.jsp").forward(request, response);
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
