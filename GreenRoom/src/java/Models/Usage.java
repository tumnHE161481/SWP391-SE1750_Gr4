/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author ADMIN
 */
public class Usage {
    private int usageID,roomID;
    private float electricNum,waterBlock;
    private String createAt,payAt;

    public Usage() {
    }

    public Usage(int usageID, int roomID, float electricNum, float waterBlock, String createAt, String payAt) {
        this.usageID = usageID;
        this.roomID = roomID;
        this.electricNum = electricNum;
        this.waterBlock = waterBlock;
        this.createAt = createAt;
        this.payAt = payAt;
    }

    public int getUsageID() {
        return usageID;
    }

    public void setUsageID(int usageID) {
        this.usageID = usageID;
    }

    public int getRoomID() {
        return roomID;
    }

    public void setRoomID(int roomID) {
        this.roomID = roomID;
    }

    public float getElectricNum() {
        return electricNum;
    }

    public void setElectricNum(float electricNum) {
        this.electricNum = electricNum;
    }

    public float getWaterBlock() {
        return waterBlock;
    }

    public void setWaterBlock(float waterBlock) {
        this.waterBlock = waterBlock;
    }

    public String getCreateAt() {
        return createAt;
    }

    public void setCreateAt(String createAt) {
        this.createAt = createAt;
    }

    public String getPayAt() {
        return payAt;
    }

    public void setPayAt(String payAt) {
        this.payAt = payAt;
    }
    
 
}
