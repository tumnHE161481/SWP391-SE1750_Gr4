/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author ASUS
 */
public class News {
    private int newsID;
    private String newsTitle;
    private String newsDes;

    public News() {
    }

    public News(int newsID, String newsTitle, String newsDes) {
        this.newsID = newsID;
        this.newsTitle = newsTitle;
        this.newsDes = newsDes;
    }

    public int getNewsID() {
        return newsID;
    }

    public void setNewsID(int newsID) {
        this.newsID = newsID;
    }

    public String getNewsTitle() {
        return newsTitle;
    }

    public void setNewsTitle(String newsTitle) {
        this.newsTitle = newsTitle;
    }

    public String getNewsDes() {
        return newsDes;
    }

    public void setNewsDes(String newsDes) {
        this.newsDes = newsDes;
    }

    @Override
    public String toString() {
        return "News{" + "newsID=" + newsID + ", newsTitle=" + newsTitle + ", newsDes=" + newsDes + '}';
    }
    
}
