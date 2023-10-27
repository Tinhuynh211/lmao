/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user.post;

import dal.PostDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
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
public class EditPostServlet extends HttpServlet {

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
            out.println("<title>Servlet EditPostServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditPostServlet at " + request.getContextPath() + "</h1>");
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
        
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8"); // works fine
        response.setCharacterEncoding("UTF-8");
        
        PrintWriter out = response.getWriter();
        HttpSession mySession = request.getSession();
        UserDAO userDAO = new UserDAO();
        PostDAO postDAO = new PostDAO();
        
        String postIdParam = request.getParameter("id");
        
        int postId = 0;
        
        if (postIdParam != null && !postIdParam.isEmpty()) {
            try {
                postId = Integer.parseInt(postIdParam);
            } catch (NumberFormatException e) {
                e.printStackTrace();
                out.println("Error: " + e.getMessage());
                return;
            }
        }
        
        User userSession = (User) mySession.getAttribute("userSession");
        
        Post post = postDAO.getPost(postId, userSession.getUserId());
//        out.println(post);
        if (post != null) {
            mySession.setAttribute("post", post);
            request.setAttribute("editPost", true);
//            response.sendRedirect("addPost.jsp");
            request.getRequestDispatcher("addPost.jsp").forward(request, response);
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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8"); // works fine
        response.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();
        HttpSession mySession = request.getSession();
        UserDAO userDAO = new UserDAO();
        PostDAO postDAO = new PostDAO();
        
        String postUrl = request.getParameter("postUrl");
        String title = request.getParameter("title");
        String description = request.getParameter("description");

//        out.print(description);
        User userSession = (User) mySession.getAttribute("userSession");
        Post postSession = (Post) mySession.getAttribute("post");

        //        int userId = userDAO.getUserId(userSession.getUsername(), userSession.getPassword(),
        //                userSession.getEmail());
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
            request.setAttribute("valueTitle", "");
            
        }

        /* Validate description */
        if (description.isEmpty()) {
            request.setAttribute("errDescription", "Description is not valid");
            checkEdit = false;
        } else {
            request.setAttribute("valueDescription", "");
        }
        
        if (checkEdit) {
            
            Post post = new Post(postSession.getPostId(), postSession.getUserId(), postUrl, title,
                    description, postSession.getCreateAt());
            
//            out.println(description);
//            out.println(post.getDescription());
            postDAO.update(post);

            // no error message
            request.setAttribute("errPostImage", "");
            request.setAttribute("errTitle", "");
            request.setAttribute("errDescription", "");

            // reset input value
            request.setAttribute("valuePostImage", "");
            request.setAttribute("valueTitle", "");
            request.setAttribute("valueDescription", "");
            
            mySession.setAttribute("messageSavePost", "Save successfully");
            mySession.setAttribute("editPost", false);
            mySession.removeAttribute("post");
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
