/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.time.LocalDateTime;

import model.Chapter;
import model.Manga;
import model.Post;
import model.User;
import ultils.EncryptPassword;

/**
 *
 * @author PC
 */
public class NewMain {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws Exception {
        LocalDateTime dateCreated = LocalDateTime.now();
        UserDAO userDAO = new UserDAO();
        PostDAO postDAO = new PostDAO();
        MangaDAO mangaDAO = new MangaDAO();
        CategoryDAO categoryDAO = new CategoryDAO();
        ChapterDAO chapterDAO = new ChapterDAO();
        userDAO.getTransaction();
       
        EncryptPassword encryptPassword = new EncryptPassword();

//        userDAO.create(new User("image/3.png", "fpt", "123", "", "sieunhangao@gmail.com", "", 
//                false, "Author", dateCreated, 9999, dateCreated));
        User user = new User(2, "", "premium", encryptPassword.toSHA1("123"), "", "premium123@gmail.com", "", true, "Premium", dateCreated, 0, dateCreated);
//        userDAO.create(user);
//        int userId = userDAO.getUserId("author", "123", "author123@gmail.com");
//        userDAO.update(user);
//        userDAO.delete(12);
        Post post = new Post(4, "https://uiparadox.co.uk/templates/animeloop/demo/assets/media/blog-detail/blog-img-1.jpg",
                "Dragon Ball’s 948th Episod", "Ðây là descrition nha các bạn",
                dateCreated);

//        postDAO.create(post);
//        System.out.println(postDAO.create(post));
//        int postId = postDAO.getPostID(4, "One piêc");
//        System.out.println(postId);
//        postDAO.create(post);
//        System.out.println(postDAO.getAll());
//        for (Post p : postDAO.getNextThreePost(3)) {
//            System.out.println(p);
//        }
        Manga manga = new Manga("Dragon Ball", "Dragon ball là bộ truyện tranh thuộc nhóm nổi tiếng nhất thế giới, được rất nhiều bạn trẻ ưa thích.",
                4, dateCreated, true, false, "http://res.cloudinary.com/djytvqlon/image/upload/v1696507667/nzlzwjy9oqlwsmu7ydhj.jpg");
        //        System.out.println(mangaDAO.create(manga));

//        mangaDAO.create(manga);
//        for (Category c : categoryDAO.getCategoriesByMangaID(1)) {
//            System.out.println(c);
//        }
//        System.out.println(mangaDAO.getTop4MangaList().get(1).getUserID());
//            System.out.println(mangaDAO.getManga(4));
        Chapter chapter = new Chapter("Chapter 1", "description_1", 4);
        chapterDAO.create(chapter);
        
//        for (Chapter c : chapterDAO.getAllChaptersByMangaID(5)) {
//            System.out.println(c);
//        }
    }

}
