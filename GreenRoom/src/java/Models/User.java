/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.util.Date;

public class User {
    private int userId;
    private String userName;
    private String userGender;
    private Date userBirth;
    private String userAddress;
    private String userPhone;
    private String userAvatar;

    public User() {
    }

    public User(int userId, String userName, String userGender, Date userBirth, String userAddress, String userPhone, String userAvatar) {
        this.userId = userId;
        this.userName = userName;
        this.userGender = userGender;
        this.userBirth = userBirth;
        this.userAddress = userAddress;
        this.userPhone = userPhone;
        this.userAvatar = userAvatar;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserGender() {
        return userGender;
    }

    public void setUserGender(String userGender) {
        this.userGender = userGender;
    }

    public Date getUserBirth() {
        return userBirth;
    }

    public void setUserBirth(Date userBirth) {
        this.userBirth = userBirth;
    }

    public String getUserAddress() {
        return userAddress;
    }

    public void setUserAddress(String userAddress) {
        this.userAddress = userAddress;
    }

    public String getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone;
    }

    public String getUserAvatar() {
        return userAvatar;
    }

    public void setUserAvatar(String userAvatar) {
        this.userAvatar = userAvatar;
    }
    
    

    
   
    
}
