/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author PC
 */
public class ImageSource {

    private int imageSourceID;
    private String imageURL;
    private int chapterID;
    private int mangaID;

    public ImageSource() {
    }

    public ImageSource(int imageSourceID, String imageURL, int chapterID, int mangaID) {
        this.imageSourceID = imageSourceID;
        this.imageURL = imageURL;
        this.chapterID = chapterID;
        this.mangaID = mangaID;
    }

    public ImageSource(String imageURL, int chapterID, int mangaID) {
        this.imageURL = imageURL;
        this.chapterID = chapterID;
        this.mangaID = mangaID;
    }

    public int getImageSourceID() {
        return imageSourceID;
    }

    public void setImageSourceID(int imageSourceID) {
        this.imageSourceID = imageSourceID;
    }

    public String getImageURL() {
        return imageURL;
    }

    public void setImageURL(String imageURL) {
        this.imageURL = imageURL;
    }

    public int getChapterID() {
        return chapterID;
    }

    public void setChapterID(int chapterID) {
        this.chapterID = chapterID;
    }

    public int getMangaID() {
        return mangaID;
    }

    public void setMangaID(int mangaID) {
        this.mangaID = mangaID;
    }

    @Override
    public String toString() {
        return "Image{" + "imageSourceID=" + imageSourceID + ", imageURL=" + imageURL + ", chapterID=" + chapterID + ", mangaID=" + mangaID + '}';
    }

}
