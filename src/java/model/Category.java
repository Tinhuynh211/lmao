/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author PC
 */
public class Category {
    private int categoryID;
    private String type;
    private String description;

    public Category() {
    }

    public Category(int categoryID, String type, String description) {
        this.categoryID = categoryID;
        this.type = type;
        this.description = description;
    }

    public Category(String type, String description) {
        this.type = type;
        this.description = description;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "Category{" + "categoryID=" + categoryID + ", type=" + type + ", description=" + description + '}';
    }
    
    
}
