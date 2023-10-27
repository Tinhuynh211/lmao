/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user.chapter;

import dal.CategoryDAO;
import dal.ChapterDAO;
import dal.ImageSourceDAO;
import dal.MangaCategoryDAO;
import dal.MangaDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Chapter;
import model.ImageSource;

/**
 *
 * @author PC
 */
public class AddChapterServlet extends HttpServlet {

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
            out.println("<title>Servlet AddChapterServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddChapterServlet at " + request.getContextPath() + "</h1>");
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
        MangaDAO mangaDAO = new MangaDAO();
        MangaCategoryDAO mangaCategoryDAO = new MangaCategoryDAO();
        CategoryDAO categoryDAO = new CategoryDAO();
        ChapterDAO chapterDAO = new ChapterDAO();
        
        int mangaID = Integer.parseInt(request.getParameter("mangaID"));
        
        mySession.setAttribute("mangaToAddChapter", mangaDAO.getManga(mangaID));
        
        response.sendRedirect("addChapter.jsp");
        
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
        
//        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8"); // works fine
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        
        HttpSession mySession = request.getSession();
        MangaDAO mangaDAO = new MangaDAO();
        MangaCategoryDAO mangaCategoryDAO = new MangaCategoryDAO();
        CategoryDAO categoryDAO = new CategoryDAO();
        
        ChapterDAO chapterDAO = new ChapterDAO();
        ImageSourceDAO imageSourceDAO = new ImageSourceDAO();
        
        
        int mangaID = Integer.parseInt(request.getParameter("mangaID"));
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String[] imageURLs = request.getParameterValues("imageURL");
                
        
//        out.println(mangaID);
//        out.println(title);
//        out.println(description);
//        out.println(imageURLs);
//        for(String s : imageURLs) {
//            out.println(s);
//        }

        // CHUA VALIDATE !!!!
        Chapter chapter = new Chapter(title, description, mangaID);
        chapterDAO.create(chapter);
        
        // imageURL, chapterID, mangaID
        for (String imageURL : imageURLs) {
            ImageSource imageSource = new ImageSource(imageURL, chapterID
                    
                    , mangaID);
            imageSourceDAO.create(imageSource);
        }
        
        
        
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
