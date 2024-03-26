/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author ASUS
 */
public class RoomTu {

    private int roomID;
    private int roomFloor;
    private int roomNumber;
    private int roomSize;
    private String roomImg;
    private int total;
    private Item item;
    private RoomItem roomitem;

    public RoomTu(Item item, RoomItem roomitem) {
        this.item = item;
        this.roomitem = roomitem;
    }
    
    
    

    public RoomTu(int roomID, int roomFloor, int roomNumber, int roomSize, String roomImg, int total) {
        this.roomID = roomID;
        this.roomFloor = roomFloor;
        this.roomNumber = roomNumber;
        this.roomSize = roomSize;
        this.roomImg = roomImg;
        this.total = total;
    }
    
    
    public RoomTu(int roomID, int roomFloor, int roomNumber, int roomSize, String roomImg) {
        this.roomID = roomID;
        this.roomFloor = roomFloor;
        this.roomNumber = roomNumber;
        this.roomSize = roomSize;
        this.roomImg = roomImg;
    }
    
    public RoomTu() {
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

    public int getRoomNumber() {
        return roomNumber;
    }

    public void setRoomNumber(int roomNumber) {
        this.roomNumber = roomNumber;
    }

    public int getRoomSize() {
        return roomSize;
    }

    public void setRoomSize(int roomSize) {
        this.roomSize = roomSize;
    }

    public String getRoomImg() {
        return roomImg;
    }

    public void setRoomImg(String roomImg) {
        this.roomImg = roomImg;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public Item getItem() {
        return item;
    }

    public void setItem(Item item) {
        this.item = item;
    }

    public RoomItem getRoomitem() {
        return roomitem;
    }

    public void setRoomitem(RoomItem roomitem) {
        this.roomitem = roomitem;
    }
    
    
    

}


   
