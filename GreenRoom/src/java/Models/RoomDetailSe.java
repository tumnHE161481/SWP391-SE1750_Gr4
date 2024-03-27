/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author ASUS
 */
public class RoomDetailSe {

    private int roomID;
    private String roomNumber;
    private String roomImg;
    private String userName;
    private String userGender;
    private String userBirth;
    private int CGRScore;

    public RoomDetailSe() {
    }
    

    public RoomDetailSe(int roomID, String roomNumber, String roomImg, String userName, String userGender, String userBirth, int CGRScore) {
        this.roomID = roomID;
        this.roomNumber = roomNumber;
        this.roomImg = roomImg;
        this.userName = userName;
        this.userGender = userGender;
        this.userBirth = userBirth;
        this.CGRScore = CGRScore;
    }

    public int getRoomID() {
        return roomID;
    }

    public void setRoomID(int roomID) {
        this.roomID = roomID;
    }

    public String getRoomNumber() {
        return roomNumber;
    }

    public void setRoomNumber(String roomNumber) {
        this.roomNumber = roomNumber;
    }

    public String getRoomImg() {
        return roomImg;
    }

    public void setRoomImg(String roomImg) {
        this.roomImg = roomImg;
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

    public int getCGRScore() {
        return CGRScore;
    }

    public void setCGRScore(int CGRScore) {
        this.CGRScore = CGRScore;
    }

    @Override
    public String toString() {
        return "RoomDetailSe{" + "roomID=" + roomID + ", roomNumber=" + roomNumber + ", roomImg=" + roomImg + ", userName=" + userName + ", userGender=" + userGender + ", userBirth=" + userBirth + ", CGRScore=" + CGRScore + '}';
    }


  
   
}
