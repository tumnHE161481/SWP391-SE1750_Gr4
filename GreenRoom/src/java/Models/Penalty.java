/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author Creep
 */
public class Penalty {

    private int penID;
    private String title;
    private String description;
    private int penMoney;
    private int status;
    private Account account;
    private User user;

    public Penalty() {
    }

    public Penalty(int penID, String title, String description, int penMoney, int status) {
        this.penID = penID;
        this.title = title;
        this.description = description;
        this.penMoney = penMoney;
        this.status = status;
        this.account = account;
        this.user = user;

    }

    public int getPenID() {
        return penID;
    }

    public void setPenID(int penID) {
        this.penID = penID;
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

    public Account getAccount() {
        return account;
    }

    public User getUser() {
        return user;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getPenMoney() {
        return penMoney;
    }

    public void setPenMoney(int penMoney) {
        this.penMoney = penMoney;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public void setUser(User user) {
        this.user = user;
    }

}
