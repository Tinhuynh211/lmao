/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author PC
 */
public class MangaCategoryDAO extends DBContext {

    // create categories for manga
    public void addCategoriesToManga(int mangaID, String[] selectedCategories) {
        try {
            String sql = "INSERT INTO MangaCategory (mangaID, categoryID) "
                    + "VALUES (?, ?)";

            for (String categoryID : selectedCategories) {
                PreparedStatement ps = connection.prepareStatement(sql);
                ps.setInt(1, mangaID);
                ps.setInt(2, Integer.parseInt(categoryID));
                ps.executeUpdate();
            }

        } catch (SQLException ex) {
            Logger.getLogger(MangaCategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // update categories for manga
    public void updateCategories(int mangaID, String[] selectedCategories) {
        PreparedStatement ps = null;
        try {
            // Đầu tiên, xóa tất cả các liên kết MangaCategory hiện có cho Manga này
            String deleteMangaCategorySQL = "DELETE FROM [MangaCategory] WHERE MangaID = ?";
            ps = connection.prepareStatement(deleteMangaCategorySQL);
            ps.setInt(1, mangaID);
            ps.executeUpdate();

            // Sau đó, thêm lại các liên kết mới dựa vào danh sách Category đã được chọn
            String insertMangaCategorySQL = "INSERT INTO [MangaCategory] (mangaID, categoryID) "
                    + "VALUES (?, ?)";
            for (String categoryID : selectedCategories) {
                ps = connection.prepareStatement(insertMangaCategorySQL);
                ps.setInt(1, mangaID);
                ps.setInt(2, Integer.parseInt(categoryID));
                ps.executeUpdate();
            }

        } catch (SQLException ex) {
            Logger.getLogger(MangaCategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // delete categories for manga
    public boolean deleteCategories(int mangaID) {
        try ( PreparedStatement ps = connection.prepareStatement("DELETE FROM MangaCategory WHERE MangaID = ?")) {
            ps.setInt(1, mangaID);
            int rowsDeleted = ps.executeUpdate();

            if (rowsDeleted > 0) {
                return true;
            } 
        } catch (SQLException ex) {
            Logger.getLogger(MangaCategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

//    public void deleteCategories(int mangaID) {
//        try {
//            String deleteMangaCategorySQL = "DELETE FROM [MangaCategory] WHERE MangaID = ?";
//            PreparedStatement ps = connection.prepareStatement(deleteMangaCategorySQL);
//            
//            ps.setInt(1, mangaID);
//            ps.executeUpdate();
//            
//            ps.close();
//            
//        } catch (SQLException ex) {
//            Logger.getLogger(MangaCategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//    }
}
