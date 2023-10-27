/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user.post;

import dal.PostDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Post;
import model.User;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author PC
 */
public class PostListPagingServlet extends HttpServlet {

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
        try {
            response.setContentType("text/html;charset=UTF-8");
            request.setCharacterEncoding("UTF-8"); // works fine
            response.setCharacterEncoding("UTF-8");
            response.setContentType("application/json");
            PrintWriter out = response.getWriter();

            HttpSession mySession = request.getSession();
            PostDAO postDAO = new PostDAO();

            String indexStr = request.getParameter("index");

            if (indexStr == null) {
                indexStr = "1";
            }

            int indexPage = Integer.parseInt(indexStr);

            int count = postDAO.getTotalPost();
            int endPage = count / 4; // each page has 4 posts

            if (count % 4 != 0) {
                endPage++;
            }

            ArrayList<Post> list = postDAO.pagingPostList(indexPage);

            mySession.setAttribute("postList", list);
            mySession.setAttribute("endPage", endPage);
            mySession.setAttribute("tag", indexPage);

//        out.println("indexPage: " + indexPage + "\n");
//        out.println("endPage: " + endPage);
            ArrayList<User> userListByPost = new ArrayList<>();
            for (Post p : list) {
                User user = postDAO.getUserByPost(p.getUserId());
                userListByPost.add(user);
            }

//            int index = 0;
//            out.println("<div class=\"row\">");
//            for (Post p : list) {
//                out.println("<div class=\"col-lg-6 col-md-6 col-12 mb-4\">\n"
//                        + "                                                        <a href=\"/MangaUniverse/PostDetailServlet?postID=" + p.getPostId() + "&userID=" + userListByPost.get(index).getUserId() + "\" class=\"inner-box\">\n"
//                        + "                                                            <div class=\"image-box\">\n"
//                        + "                                                                <img src=\"" + p.getImgUrl() + "\"\n"
//                        + "                                                                     alt=\"\" class=\"attachment-full size-full w-100\">\n"
//                        + "                                                            </div>\n"
//                        + "                                                            <div class=\"author-box text-start\">\n"
//                        + "                                                                <div class=\"detail d-flex align-items-center justify-content-between\">\n"
//                        + "                                                                    <p>" + p.getCreateAtFormat() + "</p>\n"
//                        + "                                                                    <p>Manga</p>\n"
//                        + "                                                                </div>\n"
//                        + "                                                                <h4>" + p.getTitle() + " </h4>\n"
//                        + "\n"
//                        + "                                                                <div class=\"d-flex align-items-center\">\n"
//                        + "                                                                    <img src=\"" + userListByPost.get(index).getAvatarUrl() + "\"\n"
//                        + "                                                                         class=\"w-auto\" alt=\"\" style=\"width: 50px; height: 50px\">\n"
//                        + "                                                                    <h5>" + userListByPost.get(index).getUsername() + "</h5>\n"
//                        + "\n"
//                        + "                                                                </div>\n"
//                        + "                                                            </div>\n"
//                        + "                                                        </a>\n"
//                        + "                                                    </div>");
//
//                ++index;
//            }
//            out.println("</div>");

            JSONObject jsonResponse = new JSONObject();
            jsonResponse.put("newContent", generateNewContent(list, userListByPost));
            jsonResponse.put("endPage", endPage);
            jsonResponse.put("tag", indexPage);
            
            out.print(jsonResponse.toString());

        } catch (JSONException ex) {
            Logger.getLogger(PostListPagingServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // Hàm này có thể tạo nội dung mới dưới dạng HTML hoặc JSON, tùy thuộc vào nhu cầu của bạn
    private String generateNewContent(ArrayList<Post> list, ArrayList<User> userListByPost) {
        // Tạo nội dung mới dựa trên danh sách bài viết và danh sách người dùng
        // Rồi chuyển nó thành chuỗi JSON hoặc HTML
        // Ví dụ, ở đây, tôi sẽ trả về nó dưới dạng JSON
        JSONArray postsArray = new JSONArray();
        for (int index = 0; index < list.size(); index++) {
            try {
                JSONObject postObject = new JSONObject();
                Post post = list.get(index);
                User user = userListByPost.get(index);

                postObject.put("postId", post.getPostId());
                postObject.put("userId", user.getUserId());
                postObject.put("imgUrl", post.getImgUrl());
                postObject.put("createAtFormat", post.getCreateAtFormat());
                postObject.put("title", post.getTitle());
                postObject.put("avatarUrl", user.getAvatarUrl());
                postObject.put("username", user.getUsername());

                postsArray.put(postObject);
            } catch (JSONException ex) {
                Logger.getLogger(PostListPagingServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        return postsArray.toString();
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
