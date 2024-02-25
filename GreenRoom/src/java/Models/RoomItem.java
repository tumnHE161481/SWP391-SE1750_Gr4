/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author ASUS
 */
public class RoomItem {
    private int roomitemID;
    private String itemName;
    private String itemImg;

    public RoomItem() {
    }

    public RoomItem(int roomitemID, String itemName, String itemImg) {
        this.roomitemID = roomitemID;
        this.itemName = itemName;
        this.itemImg = itemImg;
    }

    public int getRoomitemID() {
        return roomitemID;
    }

    public void setRoomitemID(int roomitemID) {
        this.roomitemID = roomitemID;
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

  
    
    
}
