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

    private String userName;
    private String newsTitle;
    private String newDes;

    public News() {
    }

    public News(String userName, String newsTitle, String newDes) {
        this.userName = userName;
        this.newsTitle = newsTitle;
        this.newDes = newDes;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getNewsTitle() {
        return newsTitle;
    }

    public void setNewsTitle(String newsTitle) {
        this.newsTitle = newsTitle;
    }

    public String getNewDes() {
        return newDes;
    }

    public void setNewDes(String newDes) {
        this.newDes = newDes;
    }

}
