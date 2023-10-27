/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user.manga;

import dal.CategoryDAO;
import dal.MangaCategoryDAO;
import dal.MangaDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Category;
import model.Manga;
import model.User;

/**
 *
 * @author PC
 */
public class EditMangaServlet extends HttpServlet {

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
            out.println("<title>Servlet EditMangaServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditMangaServlet at " + request.getContextPath() + "</h1>");
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

        int mangaID = Integer.parseInt(request.getParameter("id"));
        ArrayList<Category> categories = categoryDAO.getCategoriesByMangaID(mangaID);
        Manga manga = mangaDAO.getManga(mangaID);

        mySession.setAttribute("mangaEdit", manga);
        mySession.setAttribute("categoriesEdit", categories);

//        out.println(manga + "<br/>");
//        out.println(categories);
        response.sendRedirect("editManga.jsp?mangaID="+mangaID);

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
        User userSession = (User) mySession.getAttribute("userSession");
        MangaDAO mangaDAO = new MangaDAO();
        CategoryDAO categoryDAO = new CategoryDAO();
        MangaCategoryDAO mangaCategoryDAO = new MangaCategoryDAO();

        String id = request.getParameter("mangaID");
        String title = request.getParameter("title");
        String coverUrl = request.getParameter("coverUrl");
        String[] selectedCategories = request.getParameterValues("selectedCategories");
        String summary = request.getParameter("summary");

//        out.println("line 1---------\n");
//        out.println(title + "\n");
//        out.println(author);
//        out.println(coverUrl);
//        for (String c : selectedCategories) {
//            out.println(c + "\n");
//        }
//        out.println(summary + "\n");
//        out.println("line 2---------\n");
        boolean hasError = true;

        if (title == null || title.isEmpty()) {
            request.setAttribute("titleError", "Title is required.");
            hasError = false;
        } else {

            request.setAttribute("titleValue", title);

        }

        if (coverUrl == null || coverUrl.isEmpty()) {
            request.setAttribute("coverUrlError", "Cover Image is required.");
            hasError = false;
        } else {
            request.setAttribute("coverUrlValue", coverUrl);
        }

        if (selectedCategories == null || selectedCategories.length == 0) {
            request.setAttribute("categoryError", "Category is required.");
            hasError = false;
        } else {
            request.setAttribute("selectedCategories", selectedCategories);
        }

        if (summary == null || summary.isEmpty()) {
            request.setAttribute("summaryError", "Summary is required.");
            hasError = false;
        } else {
            request.setAttribute("summaryValue", summary);
        }

        if (hasError) {
            String author = userSession.getUsername();
            int userId = userSession.getUserId();
            int mangaID = Integer.parseInt(id);
            Manga m = mangaDAO.getManga(mangaID);

//anga(String title, String description, int userID, LocalDateTime createAt, boolean copyRight, boolean free, String coverImage)
            Manga manga = new Manga(m.getMangaID(), title, summary, userId, m.getCreateAt(), m.isCopyRight(), m.isFree(), coverUrl);
            mangaDAO.update(manga);

            request.setAttribute("m", manga);

            // mangaCategoryDAO....
            mangaCategoryDAO.updateCategories(mangaID, selectedCategories);
            request.setAttribute("sC", categoryDAO.getCategoriesByMangaID(mangaID));

            // no error message
            request.setAttribute("titleError", "");
            request.setAttribute("coverUrlError", "");
            request.setAttribute("errDescription", "");
            request.setAttribute("summaryError", "");

            // reset input value
            request.setAttribute("titleValue", "");
            request.setAttribute("coverUrlValue", "");
            request.setAttribute("selectedCategories", "");
            request.setAttribute("summaryValue", "");

            request.setAttribute("messageAdd", "Edit Manga Successfully");
        }
        request.getRequestDispatcher("editManga.jsp").forward(request, response);
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
