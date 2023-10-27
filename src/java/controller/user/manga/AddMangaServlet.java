/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user.manga;

import dal.MangaCategoryDAO;
import dal.MangaDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Manga;
import model.User;

/**
 *
 * @author PC
 */
public class AddMangaServlet extends HttpServlet {

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
            out.println("<title>Servlet AddMangaServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddMangaServlet at " + request.getContextPath() + "</h1>");
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
//        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8"); // works fine
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        HttpSession mySession = request.getSession();
        User userSession = (User) mySession.getAttribute("userSession");
        MangaDAO mangaDAO = new MangaDAO();
        MangaCategoryDAO mangaCategoryDAO = new MangaCategoryDAO();

//        String id = (String) mySession.getAttribute("mangaID");
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
            if (mangaDAO.isTitleExist(title)) {
                request.setAttribute("titleError", "Title is already exist!.");
                request.setAttribute("titleValue", title);
                hasError = false;
            } else {
                request.setAttribute("titleValue", title);
            }

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

//anga(String title, String description, int userID, LocalDateTime createAt, boolean copyRight, boolean free, String coverImage)
            Manga manga = new Manga(title, summary, userId, dateCreated, true, false, coverUrl);
            int mangaID = mangaDAO.create(manga);

            mySession.setAttribute("mangaIDAdded", mangaID);

            // mangaCategoryDAO....
            mangaCategoryDAO.addCategoriesToManga(mangaID, selectedCategories);

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

            request.setAttribute("messageAdd", "Add Manga Successfully");
        }
        request.getRequestDispatcher("addManga.jsp").forward(request, response);
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
