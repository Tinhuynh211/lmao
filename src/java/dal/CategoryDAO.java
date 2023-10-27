/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Category;

/**
 *
 * @author PC
 */
public class CategoryDAO extends DBContext {

    // get all Category
    public ArrayList<Category> getAllCategoryAscending() {
        try {
            String sql = "SELECT * FROM [Category] \n"
                    + "  ORDER BY type ASC;";
            PreparedStatement ps = connection.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            ArrayList<Category> list = new ArrayList<>();
            while (rs.next()) {
                Category category = new Category();
                category.setCategoryID(rs.getInt("categoryID"));
                category.setType(rs.getNString("type"));
                category.setDescription(rs.getNString("description"));

                list.add(category);
            }

            rs.close();
            ps.close();

            return list;

        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    // view Categories of Manga => editManga.jsp
    public ArrayList<Category> getCategoriesByMangaID(int mangaID) {
        try {
            String sql = "SELECT * FROM Category c \n"
                    + "  INNER JOIN MangaCategory mc ON c.categoryID = mc.categoryID \n"
                    + "  WHERE mc.MangaID = ?\n"
                    + "  ORDER BY type ASC;";
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setInt(1, mangaID);

            ResultSet rs = ps.executeQuery();

            ArrayList<Category> list = new ArrayList<>();
            while (rs.next()) {
                Category category = new Category();
                category.setCategoryID(rs.getInt("categoryID"));
                category.setType(rs.getNString("type"));
                category.setDescription(rs.getNString("description"));

                list.add(category);
            }

            rs.close();
            ps.close();

            return list;

        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }
}
