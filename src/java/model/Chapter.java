/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author PC
 */
public class Chapter {

    private int chapterID;
    private String title, description;
    private int mangaID;

    public Chapter() {
    }

    public Chapter(int chapterID, String title, String description, int mangaID) {
        this.chapterID = chapterID;
        this.title = title;
        this.description = description;
        this.mangaID = mangaID;
    }

    public Chapter(String title, String description, int mangaID) {
        this.title = title;
        this.description = description;
        this.mangaID = mangaID;
    }

    public int getChapterID() {
        return chapterID;
    }

    public void setChapterID(int chapterID) {
        this.chapterID = chapterID;
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

    public int getMangaID() {
        return mangaID;
    }

    public void setMangaID(int mangaID) {
        this.mangaID = mangaID;
    }

    @Override
    public String toString() {
        return "Chapter{" + "chapterID=" + chapterID + ", title=" + title + ", description=" + description + ", mangaID=" + mangaID + '}';
    }
    
    

}
