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
    private int roomFloor;
    private String roomNumber;
    private String roomSize;
    private String roomImg;
    private int singleBed;
    private int bunk;
    private int chair;
    private boolean ceilingFans;
    private boolean airConditional;

    public RoomDetailSe() {
    }

    public RoomDetailSe(int roomID, int roomFloor, String roomNumber, String roomSize, String roomImg, int singleBed, int bunk, int chair, boolean ceilingFans, boolean airConditional) {
        this.roomID = roomID;
        this.roomFloor = roomFloor;
        this.roomNumber = roomNumber;
        this.roomSize = roomSize;
        this.roomImg = roomImg;
        this.singleBed = singleBed;
        this.bunk = bunk;
        this.chair = chair;
        this.ceilingFans = ceilingFans;
        this.airConditional = airConditional;
    }

    public int getRoomID() {
        return roomID;
    }

    public void setRoomID(int roomID) {
        this.roomID = roomID;
    }

    public int getRoomFloor() {
        return roomFloor;
    }

    public void setRoomFloor(int roomFloor) {
        this.roomFloor = roomFloor;
    }

    public String getRoomNumber() {
        return roomNumber;
    }

    public void setRoomNumber(String roomNumber) {
        this.roomNumber = roomNumber;
    }

    public String getRoomSize() {
        return roomSize;
    }

    public void setRoomSize(String roomSize) {
        this.roomSize = roomSize;
    }

    public String getRoomImg() {
        return roomImg;
    }

    public void setRoomImg(String roomImg) {
        this.roomImg = roomImg;
    }

    public int getSingleBed() {
        return singleBed;
    }

    public void setSingleBed(int singleBed) {
        this.singleBed = singleBed;
    }

    public int getBunk() {
        return bunk;
    }

    public void setBunk(int bunk) {
        this.bunk = bunk;
    }

    public int getChair() {
        return chair;
    }

    public void setChair(int chair) {
        this.chair = chair;
    }

    public boolean isCeilingFans() {
        return ceilingFans;
    }

    public void setCeilingFans(boolean ceilingFans) {
        this.ceilingFans = ceilingFans;
    }

    public boolean isAirConditional() {
        return airConditional;
    }

    public void setAirConditional(boolean airConditional) {
        this.airConditional = airConditional;
    }
    
}
