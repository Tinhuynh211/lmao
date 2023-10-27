/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author PC
 */
public class Post {

    private int postId;
    private int userId;
    private String imgUrl;
    private String title;
    private String description;
    private LocalDateTime createAt;

    public Post() {
    }

    public Post(int userId, String imgUrl, String title, String description, LocalDateTime createAt) {
        this.userId = userId;
        this.imgUrl = imgUrl;
        this.title = title;
        this.description = description;
        this.createAt = createAt;
    }

    public Post(int postId, int userId, String imgUrl, String title, String description, LocalDateTime createAt) {
        this.postId = postId;
        this.userId = userId;
        this.imgUrl = imgUrl;
        this.title = title;
        this.description = description;
        this.createAt = createAt;
    }

    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public LocalDateTime getCreateAt() {
        return createAt;
    }

    public String getCreateAtFormat() {
        return createAt.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
    }

    public void setCreateAt(LocalDateTime createAt) {
        this.createAt = createAt;
    }

    @Override
    public String toString() {
        return "Post{" + "postId=" + postId + ", userId=" + userId + ", imgUrl=" + imgUrl + ", title=" + title + ", description=" + description + ", createAt=" + createAt + '}';
    }

    

}
