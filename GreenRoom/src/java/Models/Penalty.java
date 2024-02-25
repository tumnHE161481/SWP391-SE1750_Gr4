/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.sql.Date;

/**
 *
 * @author Creep
 */
public class Penalty {

    private int penID;
    private int reportID;
    private int accuseID;
    private int roomID;
    private String description;
    private Date penDate;
    private int ruleID;
    private boolean penStatus;
    private Account account;
    private User user;

    public Penalty() {
    }

    public Penalty(int penID, int reportID, int accuseID, int roomID, String description, Date penDate, int ruleID, boolean penStatus, Account account, User user) {
        this.penID = penID;
        this.reportID = reportID;
        this.accuseID = accuseID;
        this.roomID = roomID;
        this.description = description;
        this.penDate = penDate;
        this.ruleID = ruleID;
        this.penStatus = penStatus;
        this.account = account;
        this.user = user;
    }

    public int getPenID() {
        return penID;
    }

    public void setPenID(int penID) {
        this.penID = penID;
    }

    public int getReportID() {
        return reportID;
    }

    public void setReportID(int reportID) {
        this.reportID = reportID;
    }

    public int getAccuseID() {
        return accuseID;
    }

    public void setAccuseID(int accuseID) {
        this.accuseID = accuseID;
    }

    public int getRoomID() {
        return roomID;
    }

    public void setRoomID(int roomID) {
        this.roomID = roomID;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getPenDate() {
        return penDate;
    }

    public void setPenDate(Date penDate) {
        this.penDate = penDate;
    }

    public int getRuleID() {
        return ruleID;
    }

    public void setRuleID(int ruleID) {
        this.ruleID = ruleID;
    }

    public boolean isPenStatus() {
        return penStatus;
    }

    public void setPenStatus(boolean penStatus) {
        this.penStatus = penStatus;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    
    

}
