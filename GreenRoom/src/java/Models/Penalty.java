/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author ADMIN
 */
public class Penalty {

    private int penID;
    private int reportID;
    private int accuseID;
    private int roomID;
    private String description;
    private String penDate;
    private int ruleID;
    private boolean penStatus;

    private Rule rule;
    private User user;
    private Renter renter;

    public Penalty() {
    }

    public Rule getRule() {
        return rule;
    }

    public void setRule(Rule rule) {
        this.rule = rule;
    }

    public Penalty(int penID, int reportID, int accuseID, int roomID, String description, String penDate, int ruleID, boolean penStatus, Rule rule, User user, Renter renter) {
        this.penID = penID;
        this.reportID = reportID;
        this.accuseID = accuseID;
        this.roomID = roomID;
        this.description = description;
        this.penDate = penDate;
        this.ruleID = ruleID;
        this.penStatus = penStatus;
        this.rule = rule;
        this.user = user;
        this.renter = renter;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Renter getRenter() {
        return renter;
    }

    public void setRenter(Renter renter) {
        this.renter = renter;
    }

    public Penalty(int reportID, int accuseID, int roomID, String description, String penDate, int ruleID, boolean penStatus) {
        this.reportID = reportID;
        this.accuseID = accuseID;
        this.roomID = roomID;
        this.description = description;
        this.penDate = penDate;
        this.ruleID = ruleID;
        this.penStatus = penStatus;
    }

    public Penalty(int penID, int reportID, int accuseID, int roomID, String description, String penDate, int ruleID, boolean penStatus, Rule rule) {
        this.penID = penID;
        this.reportID = reportID;
        this.accuseID = accuseID;
        this.roomID = roomID;
        this.description = description;
        this.penDate = penDate;
        this.ruleID = ruleID;
        this.penStatus = penStatus;
        this.rule = rule;
    }

    public Penalty(int penID, int reportID, int accuseID, String description, String penDate, boolean penStatus) {
        this.penID = penID;
        this.reportID = reportID;
        this.accuseID = accuseID;
        this.description = description;
        this.penDate = penDate;
        this.penStatus = penStatus;
    }

    public Penalty(int penID, int reportID, int accuseID, int roomID, String description, String penDate, int ruleID, boolean penStatus) {
        this.penID = penID;
        this.reportID = reportID;
        this.accuseID = accuseID;
        this.roomID = roomID;
        this.description = description;
        this.penDate = penDate;
        this.ruleID = ruleID;
        this.penStatus = penStatus;
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

    public String getPenDate() {
        return penDate;
    }

    public void setPenDate(String penDate) {
        this.penDate = penDate;
    }

    public int getRuleID() {
        return ruleID;
    }

    public void setRuleID(int ruleID) {
        this.ruleID = ruleID;
    }

    public boolean getPenStatus() {
        return penStatus;
    }

    public void setPenStatus(boolean penStatus) {
        this.penStatus = penStatus;
    }

}
