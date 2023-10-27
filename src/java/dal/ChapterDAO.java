/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Chapter;
import model.Manga;

/**
 *
 * @author PC
 */
public class ChapterDAO extends DBContext {

    // create
    public int create(Chapter chapter) {
        int generatedPostID = -1; // Giá trị mặc định nếu không có chapterID được tạo
        try {

            String sql = "INSERT INTO [Chapter] (title, description, mangaID) "
                    + "VALUES (?, ?, ?);";

            // Sử dụng PreparedStatement với RETURN_GENERATED_KEYS để lấy postID
            PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

            ps.setNString(1, chapter.getTitle());
            ps.setNString(2, chapter.getDescription());
            ps.setInt(3, chapter.getMangaID());

            // Thực hiện lệnh SQL
            int affectedRows = ps.executeUpdate();

            if (affectedRows > 0) {
                // Lấy các giá trị được sinh ra sau khi thêm dữ liệu
                ResultSet generatedKeys = ps.getGeneratedKeys();
                if (generatedKeys.next()) {
                    generatedPostID = generatedKeys.getInt(1); // Lấy giá trị chapterID
                }
            }

            ps.close();

        } catch (SQLException ex) {
            Logger.getLogger(ChapterDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return generatedPostID;
    }

    // update Manga
    public void update(Chapter chapter) {
        try {
            String sql = "UPDATE [Chapter]\n"
                    + "SET title = ?,\n"
                    + "    description = ?,\n"
                    + "    mangaID = ?\n"
                    + "WHERE chapterID = ?;";

            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setNString(1, chapter.getTitle());
            ps.setNString(2, chapter.getDescription());
            ps.setInt(3, chapter.getMangaID());
            ps.setInt(4, chapter.getChapterID());

            ps.execute();

            ps.close();

        } catch (SQLException ex) {
            Logger.getLogger(ChapterDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // delete
    public void delete(int chapterID) {

        // KHI ADD IMAGE THÌ COI LẠI CÓ NÊN XÓA BÊN BẢNG IMAGESOURCE TRƯỚC 
        // RỒI TỚI BẢNG CHAPTER XÓA HAY KHÔNG?
        try {
            String sql = "DELETE FROM [Chapter] "
                    + "WHERE chapterID = ?;";

            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setInt(1, chapterID);

            ps.execute();

            ps.close();

        } catch (SQLException ex) {
            Logger.getLogger(ChapterDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // get all chapters
    public ArrayList<Chapter> getAll() {
        try {
            String sql = "SELECT * FROM [Chapter];";
            PreparedStatement ps = connection.prepareStatement(sql);

            ResultSet res = ps.executeQuery();

            ArrayList<Chapter> list = new ArrayList<>();

            while (res.next()) {
                Chapter chapter = new Chapter();
                chapter.setChapterID(res.getInt("chapterID"));
                chapter.setTitle(res.getNString("title"));
                chapter.setDescription(res.getNString("description"));
                chapter.setMangaID(res.getInt("mangaID"));

                list.add(chapter);
            }

            res.close();
            ps.close();

            return list;

        } catch (SQLException ex) {
            Logger.getLogger(ChapterDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }
    // get all chapters by MangaID
    public ArrayList<Chapter> getAllChaptersByMangaID(int mangaID) {
        try {
            String sql = "SELECT * FROM [Chapter]"
                    + "WHERE mangaID = ?;";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, mangaID);

            ResultSet res = ps.executeQuery();

            ArrayList<Chapter> list = new ArrayList<>();

            while (res.next()) {
                Chapter chapter = new Chapter();
                chapter.setChapterID(res.getInt("chapterID"));
                chapter.setTitle(res.getNString("title"));
                chapter.setDescription(res.getNString("description"));
                chapter.setMangaID(res.getInt("mangaID"));

                list.add(chapter);
            }

            res.close();
            ps.close();

            return list;

        } catch (SQLException ex) {
            Logger.getLogger(ChapterDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    // get chapter
    public Chapter getChapter(int chapterID) {
        try {
            String sql = "SELECT * FROM [Chapter];";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, chapterID);

            ResultSet res = ps.executeQuery();
            Chapter chapter = new Chapter();
            if (res.next()) {
                chapter.setChapterID(res.getInt("chapterID"));
                chapter.setTitle(res.getNString("title"));
                chapter.setDescription(res.getNString("description"));
                chapter.setMangaID(res.getInt("mangaID"));
            }

            res.close();
            ps.close();

            return chapter;
        } catch (SQLException ex) {
            Logger.getLogger(ChapterDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return null;    
    }
}
