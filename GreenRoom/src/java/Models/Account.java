/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author yetvv.piacom
 */
public class Account {
    private int userId;
    private String email;
    private String password;
    private int role;
    private User user;

    public Account() {
    }

    public Account(int userId, String email, String password, int role, User user) {
        this.userId = userId;
        this.email = email;
        this.password = password;
        this.role = role;
        this.user = user;
    }
    
    public Account(String email, String password, int role) {
        this.email = email;
        this.password = password;
        this.role = role;
    }

    public Account(int userId, String email, String password, int role) {
        this.userId = userId;
        this.email = email;
        this.password = password;
        this.role = role;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }
    
    
    
}
