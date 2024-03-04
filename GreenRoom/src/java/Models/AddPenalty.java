/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author ADMIN
 */
public class AddPenalty {

    private String ruleName;
    private String description;
    private double penMoney;
    private String penDate;
    private int penStatus;
    private Rule rule;
    private Penalty penalty;
    
    public AddPenalty() {
    }

    public AddPenalty(String ruleName, String description, double penMoney, String penDate, int penStatus) {
        this.ruleName = ruleName;
        this.description = description;
        this.penMoney = penMoney;
        this.penDate = penDate;
        this.penStatus = penStatus;
    }

    public String getRuleName() {
        return ruleName;
    }

    public void setRuleName(String ruleName) {
        this.ruleName = ruleName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPenMoney() {
        return penMoney;
    }

    public void setPenMoney(double penMoney) {
        this.penMoney = penMoney;
    }

    public String getPenDate() {
        return penDate;
    }

    public void setPenDate(String penDate) {
        this.penDate = penDate;
    }

    public int getPenStatus() {
        return penStatus;
    }

    public void setPenStatus(int penStatus) {
        this.penStatus = penStatus;
    }
    
}
