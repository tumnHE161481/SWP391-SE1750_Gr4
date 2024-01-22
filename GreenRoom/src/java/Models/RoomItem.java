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
    private int itemID;
    private int singleBed;
    private int bunk;
    private int chair;
    private boolean ceilingFans;
    private boolean airConditional;

    public RoomItem() {
    }

    public RoomItem(int itemID, int singleBed, int bunk, int chair, boolean ceilingFans, boolean airConditional) {
        this.itemID = itemID;
        this.singleBed = singleBed;
        this.bunk = bunk;
        this.chair = chair;
        this.ceilingFans = ceilingFans;
        this.airConditional = airConditional;
    }

    public int getItemID() {
        return itemID;
    }

    public void setItemID(int itemID) {
        this.itemID = itemID;
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
