/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user.post;

import dal.PostDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
public class LoadMorePostServlet extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8"); // works fine
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        HttpSession mySession = request.getSession();
        PostDAO postDAO = new PostDAO();
        
        int existPost = Integer.parseInt(request.getParameter("existPost"));
        
        ArrayList<Post> list = postDAO.getNextThreePost(existPost);
        
        ArrayList<User> userListByPost = new ArrayList<>();
        for (Post p : list) {
            User user = postDAO.getUserByPost(p.getUserId());
            userListByPost.add(user);
        }
            
        int index = 0;
        for (Post p : list) {
            out.println("<li>\n"
                    + "                                                        <a href=\"/MangaUniverse/PostDetailServlet?postID=" + p.getPostId() + "&userID=" + userListByPost.get(index).getUserId() + "\">\n"
                    + "                                                            <div class=\"row align-items-center\">\n"
                    + "                                                                <div class=\"col-5\">\n"
                    + "                                                                    <img alt=\"\"\n"
                    + "                                                                         src=\"" + p.getImgUrl() + "\">\n"
                    + "                                                                </div>\n"
                    + "                                                                <div class=\"col-7 ps-0\">\n"
                    + "                                                                    <p class=\"date\">" + p.getCreateAtFormat() + "</p>\n"
                    + "                                                                    <h6 class=\"mb-0\">" + p.getTitle() + "</h6>\n"
                    + "                                                                </div>\n"
                    + "                                                            </div>\n"
                    + "                                                        </a>\n"
                    + "                                                    </li>");
            
            ++index;
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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
