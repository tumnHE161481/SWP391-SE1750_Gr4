/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author yetvv.piacom
 */
public class Security {
    private int seID, userID, sShift, seStatus;

    public Security() {
    }

    public Security(int seID, int userID, int sShift, int seStatus) {
        this.seID = seID;
        this.userID = userID;
        this.sShift = sShift;
        this.seStatus = seStatus;
    }

    public int getSeID() {
        return seID;
    }

    public void setSeID(int seID) {
        this.seID = seID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getsShift() {
        return sShift;
    }

    public void setsShift(int sShift) {
        this.sShift = sShift;
    }

    public int getSeStatus() {
        return seStatus;
    }

    public void setSeStatus(int seStatus) {
        this.seStatus = seStatus;
    }
    
    
    
    
}
