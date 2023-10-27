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
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;
import model.Post;

/**
 *
 * @author PC
 */
public class PostDAO extends DBContext {

    // get Post
    public Post getPost(int postId, int userId) {

        try {
            String sql = "SELECT * FROM [Post] "
                    + "WHERE postID = ? AND userID = ?;";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, postId);
            ps.setInt(2, userId);

            ResultSet rs = ps.executeQuery();
            Post post = new Post();

            if (rs.next()) {

                post.setPostId(rs.getInt("postID"));
                post.setUserId(rs.getInt("userID"));
                post.setImgUrl(rs.getString("imgUrl"));
                post.setTitle(rs.getString("title"));
                post.setDescription(rs.getString("description"));
                post.setCreateAt(rs.getTimestamp("createdAt").toLocalDateTime());

            }

            rs.close();
            ps.close();

            return post;

        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    // get all Post by userID
    public ArrayList<Post> getAllByUserId(int userId) {

        try {
            String sql = "SELECT * FROM [Post]\n"
                    + "WHERE userID = ?;";
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            ArrayList<Post> list = new ArrayList<>();
            while (rs.next()) {
                Post post = new Post();
                post.setPostId(rs.getInt("postID"));
                post.setUserId(rs.getInt("userID"));
                post.setImgUrl(rs.getString("imgUrl"));
                post.setTitle(rs.getString("title"));
                post.setDescription(rs.getString("description"));
                post.setCreateAt(rs.getTimestamp("createdAt").toLocalDateTime());

                list.add(post);

            }

            rs.close();
            ps.close();

            return list;

        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    // get all Post
    public ArrayList<Post> getAll() {

        try {
            String sql = "SELECT * FROM [Post];";
            PreparedStatement ps = connection.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            ArrayList<Post> list = new ArrayList<>();
            while (rs.next()) {
                Post post = new Post();
                post.setPostId(rs.getInt("postID"));
                post.setUserId(rs.getInt("userID"));
                post.setImgUrl(rs.getString("imgUrl"));
                post.setTitle(rs.getString("title"));
                post.setDescription(rs.getString("description"));
                post.setCreateAt(rs.getTimestamp("createdAt").toLocalDateTime());

                list.add(post);

            }

            rs.close();
            ps.close();

            return list;

        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    // create Post
    public int create(Post post) {
        int generatedPostID = -1; // Giá trị mặc định nếu không có postID được tạo

        try {
            String sql = "INSERT INTO [Post] (userID, imgUrl, title, description, createdAt)\n"
                    + "VALUES (?, ?, ?, ?, ?)";

            // Sử dụng PreparedStatement với RETURN_GENERATED_KEYS để lấy postID
            PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

            ps.setInt(1, post.getUserId());
            ps.setString(2, post.getImgUrl());
            ps.setNString(3, post.getTitle());
            ps.setNString(4, post.getDescription());
            ps.setTimestamp(5, Timestamp.valueOf(post.getCreateAt())); // Convert LocalDateTime to Timestamp

            // Thực hiện lệnh SQL
            int affectedRows = ps.executeUpdate();

            if (affectedRows > 0) {
                // Lấy các giá trị được sinh ra sau khi thêm dữ liệu
                ResultSet generatedKeys = ps.getGeneratedKeys();
                if (generatedKeys.next()) {
                    generatedPostID = generatedKeys.getInt(1); // Lấy giá trị postID
                }
            }

            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return generatedPostID;
    }

//    // create Post
//    public void create(Post post) {
//        try {
//            String sql = "INSERT INTO [Post] (userID, imgUrl, title, description, createdAt)\n"
//                    + "VALUES (?, ?, ?, ?, ?)";
//            PreparedStatement ps = connection.prepareStatement(sql);
//
//            ps.setInt(1, post.getUserId());
//            ps.setString(2, post.getImgUrl());
//            ps.setString(3, post.getTitle());
//            ps.setString(4, post.getDescription());
//            ps.setTimestamp(5, Timestamp.valueOf(post.getCreateAt())); // Convert LocalDateTime to Timestamp
//
//            ps.execute();
//
//            ps.close();
//        } catch (SQLException ex) {
//            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//    }
    // update Post
    public void update(Post post) {
        try {
            String sql = "UPDATE [Post]\n"
                    + "SET userID = ?,\n"
                    + "    imgUrl = ?,\n"
                    + "    title = ?,\n"
                    + "    description = ?,\n"
                    + "    createdAt = ?\n"
                    + "WHERE postID = ?;";

            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setInt(1, post.getUserId());
            ps.setString(2, post.getImgUrl());
            ps.setNString(3, post.getTitle());
//            ps.setString(4, post.getDescription());
            ps.setNString(4, post.getDescription()); // UTF-8

            ps.setTimestamp(5, Timestamp.valueOf(post.getCreateAt())); // Convert LocalDateTime to Timestamp
            ps.setInt(6, post.getPostId());

            ps.execute();

            ps.close();

        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // Delete
    public void delete(Post post) {
        try {
            String sql = "DELETE FROM [Post] "
                    + "WHERE postId = ?;";

            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setInt(1, post.getPostId());

            ps.execute();

            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // get PostID by userId, title
    public int getPostID(int userId, String title) {
        int postID = -1;

        try {
            String sql = "SELECT postID FROM [Post] WHERE userID = ? AND title = ?";
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setInt(1, userId);
            ps.setString(2, title);

            ResultSet resultSet = ps.executeQuery();

            if (resultSet.next()) {
                postID = resultSet.getInt("postID");
            }

            resultSet.close();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return postID;
    }

    // check Title exist
    public boolean isTitleExist(String title) {
        boolean titleExists = false;

        try {
            String sql = "SELECT COUNT(*) FROM [Post] WHERE title = ?";
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setString(1, title);

            ResultSet resultSet = ps.executeQuery();

            if (resultSet.next()) {
                int count = resultSet.getInt(1);
                if (count > 0) {
                    titleExists = true;
                }
            }

            resultSet.close();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return titleExists;
    }

    // find user by UserId
    public User getUserByPost(int userId) {

        try {
            String sql = "SELECT userID, username, avatarUrl FROM [Users]\n"
                    + "WHERE [Users].userID =  ?;";
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setInt(1, userId);

            ResultSet resultSet = ps.executeQuery();

            User user = new User();

            while (resultSet.next()) {
                user.setUserId(resultSet.getInt("userID"));
                user.setUsername(resultSet.getString("username"));
                user.setAvatarUrl(resultSet.getString("avatarUrl"));
            }

            resultSet.close();
            ps.close();

            return user;
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    // pagingPostList
    public int getTotalPost() {

        try {
            String sql = "SELECT COUNT(*) FROM Post";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                return rs.getInt(1);
            }

            rs.close();
            ps.close();

        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return -1;
    }

    // paging post list
    public ArrayList<Post> pagingPostList(int index) {
        try {
            String sql = "SELECT * FROM Post\n"
                    + "ORDER BY postID\n"
                    + "OFFSET ? ROWS FETCH NEXT 4 ROWS ONLY;";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, (index - 1) * 4);

            ResultSet rs = ps.executeQuery();

            ArrayList<Post> list = new ArrayList<>();
            while (rs.next()) {
                Post post = new Post();
                post.setPostId(rs.getInt("postID"));
                post.setUserId(rs.getInt("userID"));
                post.setImgUrl(rs.getString("imgUrl"));
                post.setTitle(rs.getString("title"));
                post.setDescription(rs.getString("description"));
                post.setCreateAt(rs.getTimestamp("createdAt").toLocalDateTime());

                list.add(post);

            }

            rs.close();
            ps.close();

            return list;

        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    // search by title
    public ArrayList<Post> searchByTitle(String txtSearch) {
        try {
            String sql = "SELECT * FROM Post\n"
                    + "WHERE title LIKE ?;";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + txtSearch + "%");

            ResultSet rs = ps.executeQuery();

            ArrayList<Post> list = new ArrayList<>();
            while (rs.next()) {
                Post post = new Post();
                post.setPostId(rs.getInt("postID"));
                post.setUserId(rs.getInt("userID"));
                post.setImgUrl(rs.getString("imgUrl"));
                post.setTitle(rs.getString("title"));
                post.setDescription(rs.getString("description"));
                post.setCreateAt(rs.getTimestamp("createdAt").toLocalDateTime());

                list.add(post);

            }

            rs.close();
            ps.close();

            return list;

        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    // get 3 Post
    public ArrayList<Post> getThreePost() {

        try {
            String sql = "SELECT TOP 3 * FROM [Post];";
            PreparedStatement ps = connection.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            ArrayList<Post> list = new ArrayList<>();
            while (rs.next()) {
                Post post = new Post();
                post.setPostId(rs.getInt("postID"));
                post.setUserId(rs.getInt("userID"));
                post.setImgUrl(rs.getString("imgUrl"));
                post.setTitle(rs.getString("title"));
                post.setDescription(rs.getString("description"));
                post.setCreateAt(rs.getTimestamp("createdAt").toLocalDateTime());

                list.add(post);

            }

            rs.close();
            ps.close();

            return list;

        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    // get next 3 Post
    public ArrayList<Post> getNextThreePost(int amountPost) {

        try {
            String sql = "SELECT * FROM [Post]\n"
                    + "ORDER BY postID\n"
                    + "OFFSET ? ROWS\n"
                    + "FETCH NEXT 3 ROWS ONLY;;";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, amountPost);
            
            ResultSet rs = ps.executeQuery();

            ArrayList<Post> list = new ArrayList<>();
            while (rs.next()) {
                Post post = new Post();
                post.setPostId(rs.getInt("postID"));
                post.setUserId(rs.getInt("userID"));
                post.setImgUrl(rs.getString("imgUrl"));
                post.setTitle(rs.getString("title"));
                post.setDescription(rs.getString("description"));
                post.setCreateAt(rs.getTimestamp("createdAt").toLocalDateTime());

                list.add(post);

            }

            rs.close();
            ps.close();

            return list;

        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }
}
