/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Chapter;
import model.ImageSource;

/**
 *
 * @author PC
 */
public class ImageSourceDAO extends DBContext {

    // create
    public int create(ImageSource imageSource) {
        int generatedPostID = -1; // Giá trị mặc định nếu không có chapterID được tạo
        try {
            String sql = "INSERT INTO [ImageSource] (imageURL, chapterID, mangaID) "
                    + "VALUES (?, ?, ?);";

            // Sử dụng PreparedStatement với RETURN_GENERATED_KEYS để lấy postID
            PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

            ps.setNString(1, imageSource.getImageURL());
            ps.setInt(2, imageSource.getChapterID());
            ps.setInt(3, imageSource.getMangaID());

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
            Logger.getLogger(ImageSourceDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return generatedPostID;

    }

    // update Manga
    public void update(ImageSource imageSource) {
        try {
            String sql = "UPDATE [ImageSource]\n"
                    + "SET imageURL = ?,\n"
                    + "    chapterID = ?,\n"
                    + "    mangaID = ?\n"
                    + "WHERE imageSourceID = ?;";

            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setNString(1, imageSource.getImageURL());
            ps.setInt(2, imageSource.getChapterID());
            ps.setInt(3, imageSource.getMangaID());
            ps.setInt(4, imageSource.getImageSourceID());

            ps.execute();

            ps.close();

        } catch (SQLException ex) {
            Logger.getLogger(ImageSourceDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // delete
    public void delete(int imageSourceID) {

        // KHI ADD IMAGE THÌ COI LẠI CÓ NÊN XÓA BÊN BẢNG IMAGESOURCE TRƯỚC 
        // RỒI TỚI BẢNG CHAPTER XÓA HAY KHÔNG?
        try {
            String sql = "DELETE FROM [ImageSource] "
                    + "WHERE imageSourceID = ?;";

            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setInt(1, imageSourceID);

            ps.execute();

            ps.close();

        } catch (SQLException ex) {
            Logger.getLogger(ImageSourceDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // get all chapters
    public ArrayList<ImageSource> getAll() {
        try {
            String sql = "SELECT * FROM [ImageSource];";
            PreparedStatement ps = connection.prepareStatement(sql);

            ResultSet res = ps.executeQuery();

            ArrayList<ImageSource> list = new ArrayList<>();

            while (res.next()) {
                ImageSource imageSource = new ImageSource();
                imageSource.setImageSourceID(res.getInt("imageSourceID"));
                imageSource.setImageURL(res.getNString("imageURL"));
                imageSource.setChapterID(res.getInt("chapterID"));
                imageSource.setMangaID(res.getInt("mangaID"));
                
                list.add(imageSource);
            }
            
            res.close();
            ps.close();

            return list;
            
        } catch (SQLException ex) {
            Logger.getLogger(ImageSourceDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return null;
    }
    
    // get all imageSource by ChapterID
    public ArrayList<ImageSource> getAllImageSourcesByChapterID(int chapterID) {
        
        try {
            String sql = "SELECT * FROM [ImageSource]"
                    + "WHERE chapterID = ?;";
            PreparedStatement ps = connection.prepareStatement(sql);
            
            ps.setInt(1, chapterID);

            ResultSet res = ps.executeQuery();

            ArrayList<ImageSource> list = new ArrayList<>();

            while (res.next()) {
                ImageSource imageSource = new ImageSource();
                imageSource.setImageSourceID(res.getInt("imageSourceID"));
                imageSource.setImageURL(res.getNString("imageURL"));
                imageSource.setChapterID(res.getInt("chapterID"));
                imageSource.setMangaID(res.getInt("mangaID"));
                
                list.add(imageSource);
            }
            
            res.close();
            ps.close();

            return list;
            
        } catch (SQLException ex) {
            Logger.getLogger(ImageSourceDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return null;
    }
}