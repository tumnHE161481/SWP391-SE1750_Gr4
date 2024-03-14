/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author ASUS
 */
public class User{
    private int userID;
    private String userName;
    private String userGender;
    private String userBirth;
    private String userAddress;
    private String userPhone;
    private String userAvatar;
    private Account account;
    private Renter renter;
    private Room room;
    private Security security;
    
    public User() {
    }

    public User( String userName, Renter renter) {
        this.userName = userName;
        this.renter = renter;
    }

    public User(int userID, String userName, String userGender, String userBirth, String userAddress, String userPhone, String userAvatar, Account account, Renter renter, Room room) {
        this.userID = userID;
        this.userName = userName;
        this.userGender = userGender;
        this.userBirth = userBirth;
        this.userAddress = userAddress;
        this.userPhone = userPhone;
        this.userAvatar = userAvatar;
        this.account = account;
        this.renter = renter;
        this.room = room;
    }

    public User(int userID, String userName, String userGender, String userBirth, String userAddress, String userPhone, String userAvatar, Account account) {
        this.userID = userID;
        this.userName = userName;
        this.userGender = userGender;
        this.userBirth = userBirth;
        this.userAddress = userAddress;
        this.userPhone = userPhone;
        this.userAvatar = userAvatar;
        this.account = account;
    }
    
    

    public User(int userID, String userName, String userAvatar, Account account) {
        this.userID = userID;
        this.userName = userName;
        this.userAvatar = userAvatar;
        this.account = account;
    }

    public User(int userID, String userName, String userGender, String userBirth, String userAddress, String userPhone, String userAvatar) {
        this.userID = userID;
        this.userName = userName;
        this.userGender = userGender;
        this.userBirth = userBirth;
        this.userAddress = userAddress;
        this.userPhone = userPhone;
        this.userAvatar = userAvatar;
    }

    public User(int userID, String userName, String userGender, String userBirth, String userAddress, String userPhone, String userAvatar, Account account, Security security) {
        this.userID = userID;
        this.userName = userName;
        this.userGender = userGender;
        this.userBirth = userBirth;
        this.userAddress = userAddress;
        this.userPhone = userPhone;
        this.userAvatar = userAvatar;
        this.account = account;
        this.security = security;
    }

    public Security getSecurity() {
        return security;
    }

    public void setSecurity(Security security) {
        this.security = security;
    }
    

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
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

    public String getUserBirth() {
        return userBirth;
    }

    public void setUserBirth(String userBirth) {
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

     public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public Renter getRenter() {
        return renter;
    }

    public void setRenter(Renter renter) {
        this.renter = renter;
    }
    
    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }
    
}