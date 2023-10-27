/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user.post;

import dal.PostDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Post;
import model.User;

/**
 *
 * @author PC
 */
@MultipartConfig
public class AddPostServlet extends HttpServlet {

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
            out.println("<title>Servlet AddPostServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddPostServlet at " + request.getContextPath() + "</h1>");
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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8"); // works fine
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        String postUrl = request.getParameter("postUrl");
        String title = request.getParameter("title");
        String description = request.getParameter("description");

        HttpSession mySession = request.getSession();
        UserDAO userDAO = new UserDAO();
        PostDAO postDAO = new PostDAO();

        User userSession = (User) mySession.getAttribute("userSession");

        int userId = userDAO.getUserId(userSession.getUsername(), userSession.getPassword(),
                userSession.getEmail());

        boolean checkEdit = true;

        /* Validate postUrl */
        if (postUrl.isEmpty()) {
            request.setAttribute("errPostImage", "Image is not valid");
            checkEdit = false;
        } else {
            request.setAttribute("valuePostImage", "");
        }

        /* Validate title */
        if (title.isEmpty()) {
            request.setAttribute("errTitle", "Title is not valid");
            checkEdit = false;
        } else {
            if (postDAO.isTitleExist(title)) {
                checkEdit = false;
            } else {
                request.setAttribute("valueTitle", "");
            }
            
        }

        /* Validate description */
        if (description.isEmpty()) {
            request.setAttribute("errDescription", "Description is not valid");
            checkEdit = false;
        } else {
            request.setAttribute("valueDescription", "");
        }

        if (checkEdit) {

            Post newPost = new Post(userId, postUrl, title, description, dateCreated);
            postDAO.create(newPost);
//            int postId = postDAO.getPostID(userId, title);
//            request.setAttribute("post", postDAO.getPost(postId));

            // no error message
            request.setAttribute("errPostImage", "");
            request.setAttribute("errTitle", "");
            request.setAttribute("errDescription", "");

            // reset input value
            request.setAttribute("valuePostImage", "");
            request.setAttribute("valueTitle", "");
            request.setAttribute("valueDescription", "");

            request.setAttribute("messageUpload", "Upload successfully");

        }
        request.getRequestDispatcher("addPost.jsp").forward(request, response);
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
