/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user;

import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author PC
 */
@MultipartConfig

public class UserProfileServlet extends HttpServlet {

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
            out.println("<title>Servlet UserProfileServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UserProfileServlet at " + request.getContextPath() + "</h1>");
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

        request.getRequestDispatcher("userProfile.jsp").forward(request, response);

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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8"); // works fine
        // phạm ngọc huy

        // check duplicate when reload page using DB ...
        PrintWriter out = response.getWriter();
        HttpSession mySession = request.getSession();
        UserDAO userDAO = new UserDAO();
        User userSession = (User) mySession.getAttribute("userSession");
        String userGooglePicture = (String) mySession.getAttribute("userGooglePicture");

        String username = request.getParameter("username"); // check
        String password = "";
        String name = request.getParameter("name"); // check 
        String email = request.getParameter("email"); // check 
        String phone = request.getParameter("phone"); // check 
        String genderStr = request.getParameter("gender"); // check 
        String role = request.getParameter("role");
        String avatarUrl = request.getParameter("avatarUrl");

        boolean checkEdit = true;

        /* Validate Avatar */
        if (avatarUrl == null) {
            avatarUrl = userGooglePicture;
        } else if (!avatarUrl.isEmpty()) {
            request.setAttribute("valueAvatarUrl", avatarUrl);
        }

//        if (!avatarUrl.isEmpty()) {
//            request.setAttribute("valueAvatarUrl", avatarUrl);
//        }

        /* Validate Username */
        if (username.isEmpty()) {
            request.setAttribute("errUsername", "Username is not valid");
            checkEdit = false;
        } else {
            request.setAttribute("valueUserName", username);
        }

        /* Validate Name */
        if (name.isEmpty()) {
            name = "";
            request.setAttribute("errName", "Name is not valid");
//            checkEdit = false;
        } else {
            request.setAttribute("valueName", name);
        }

        /* Validate Phone */
        if (phone.isEmpty()) {
            phone = "";
            request.setAttribute("errPhone", "Phone is not valid");
//            checkEdit = false;
        } else {
            request.setAttribute("valuePhone", phone);
        }

        boolean gender = true;
        if (genderStr == null) {
            genderStr = "";
            request.setAttribute("errGender", "Choose your gender");
//            checkEdit = false;
        } else {
            request.setAttribute("valueGender", genderStr);

            if (genderStr.equals("true")) {
                gender = true;
            } else if (genderStr.equals("false")) {
                gender = false;
            }
        }

        if (checkEdit) {

//            User userSession = new User(avatarUrl, username, password, name,
//                    email, phone, gender, role, expiredTime, coinQuantity, createAt);
            User user = new User(userSession.getUserId(), avatarUrl, username, userSession.getPassword(), name, 
                    userSession.getEmail(), phone, gender, userSession.getRole(), 
                    userSession.getExpiredTime(), userSession.getCoinQuantity(), 
                    userSession.getCreateAt());
            
//            int userId = userDAO.getUserId(userSession.getUsername(), userSession.getPassword(), 
//                    userSession.getEmail());
            userDAO.update(user);
            
            mySession.setAttribute("userSession", user);
            
            mySession.removeAttribute("userGooglePicture");

            // no error message
            request.setAttribute("errUsername", "");
            request.setAttribute("errName", "");
            request.setAttribute("errEmail", "");
            request.setAttribute("errPhone", "");
            request.setAttribute("errGender", "");
            // reset input value
            request.setAttribute("valueUsername", "");
            request.setAttribute("valueName", "");
            request.setAttribute("valueEmail", "");
            request.setAttribute("valuePhone", "");
            request.setAttribute("valueGender", "");

            request.setAttribute("messageSave", "Save successfully");
        }
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
