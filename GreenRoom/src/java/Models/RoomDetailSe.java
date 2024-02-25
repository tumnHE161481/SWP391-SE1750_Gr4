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
    private String roomSize;
    private int roomFloor;
    private String itemName;
    private String itemImg;
    private int quantity;


    public RoomDetailSe() {
    }

    public RoomDetailSe(int roomID, String roomNumber, String roomImg, String roomSize, int roomFloor, String itemName, String itemImg, int quantity) {
        this.roomID = roomID;
        this.roomNumber = roomNumber;
        this.roomImg = roomImg;
        this.roomSize = roomSize;
        this.roomFloor = roomFloor;
        this.itemName = itemName;
        this.itemImg = itemImg;
        this.quantity = quantity;
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

    public String getRoomSize() {
        return roomSize;
    }

    public void setRoomSize(String roomSize) {
        this.roomSize = roomSize;
    }

    public int getRoomFloor() {
        return roomFloor;
    }

    public void setRoomFloor(int roomFloor) {
        this.roomFloor = roomFloor;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public String getItemImg() {
        return itemImg;
    }

    public void setItemImg(String itemImg) {
        this.itemImg = itemImg;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "RoomDetailSe{" + "roomID=" + roomID + ", roomNumber=" + roomNumber + ", roomImg=" + roomImg + ", roomSize=" + roomSize + ", roomFloor=" + roomFloor + ", itemName=" + itemName + ", itemImg=" + itemImg + ", quantity=" + quantity + '}';
    }

   
}
