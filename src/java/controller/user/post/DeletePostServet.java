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
public class DeletePostServet extends HttpServlet {

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
            out.println("<title>Servlet DeletePostServet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DeletePostServet at " + request.getContextPath() + "</h1>");
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
        PrintWriter out = response.getWriter();
        HttpSession mySession = request.getSession();
        UserDAO userDAO = new UserDAO();
        PostDAO postDAO = new PostDAO();

        String[] selectedPosts = request.getParameterValues("selectedPosts");

        if (selectedPosts != null) {
            // Sử dụng lớp DAO của bài post để xóa các bài post dựa trên id
            for (String id : selectedPosts) {
                int postId = Integer.parseInt(id);
                User userSession = (User) mySession.getAttribute("userSession");

                Post post = postDAO.getPost(postId, userSession.getUserId());
                postDAO.delete(post);
            }
        }
        
        response.sendRedirect("addPost.jsp");
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

//        PrintWriter out = response.getWriter();
//        HttpSession mySession = request.getSession();
//        UserDAO userDAO = new UserDAO();
//        PostDAO postDAO = new PostDAO();
//
//        String[] selectedPosts = request.getParameterValues("selectedPosts");
//
//        if (selectedPosts != null) {
//            // Sử dụng lớp DAO của bài post để xóa các bài post dựa trên id
//            for (String id : selectedPosts) {
//                int postId = Integer.parseInt(id);
//                User userSession = (User) mySession.getAttribute("userSession");
//
//                Post post = postDAO.getPost(postId, userSession.getUserId());
////                postDAO.delete(post);
//                out.println(postId);
//            }
//        }
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
