/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;


public class Manga {

    private int mangaID;
    private String title, description;
    private int userID;
    private LocalDateTime createAt;
    private boolean copyRight, free;
    private String coverImage;

    public Manga() {
    }

    public Manga(int mangaID, String title, String description, int userID, LocalDateTime createAt, boolean copyRight, boolean free, String coverImage) {
        this.mangaID = mangaID;
        this.title = title;
        this.description = description;
        this.userID = userID;
        this.createAt = createAt;
        this.copyRight = copyRight;
        this.free = free;
        this.coverImage = coverImage;
    }

    public Manga(String title, String description, int userID, LocalDateTime createAt, boolean copyRight, boolean free, String coverImage) {
        this.title = title;
        this.description = description;
        this.userID = userID;
        this.createAt = createAt;
        this.copyRight = copyRight;
        this.free = free;
        this.coverImage = coverImage;
    }


    public int getMangaID() {
        return mangaID;
    }

    public void setMangaID(int mangaID) {
        this.mangaID = mangaID;
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

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
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

    public boolean isCopyRight() {
        return copyRight;
    }

    public void setCopyRight(boolean copyRight) {
        this.copyRight = copyRight;
    }

    public boolean isFree() {
        return free;
    }

    public void setFree(boolean free) {
        this.free = free;
    }


    public String getCoverImage() {
        return coverImage;
    }

    public void setCoverImage(String coverImage) {
        this.coverImage = coverImage;
    }

    @Override
    public String toString() {
        return "Manga{" + "mangaID=" + mangaID + ", title=" + title + ", description=" + description + ", userID=" + userID + ", createAt=" + createAt + ", copyRight=" + copyRight + ", free=" + free + ", coverImage=" + coverImage + '}';
    }

    
    

}
