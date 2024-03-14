/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author ADMIN
 */
public class UsagePrice {
    private double elecprice,waterprice;

    public UsagePrice(double elecprice, double waterprice) {
        this.elecprice = elecprice;
        this.waterprice = waterprice;
    }

    public UsagePrice() {
    }

    public double getElecprice() {
        return elecprice;
    }

    public void setElecprice(double elecprice) {
        this.elecprice = elecprice;
    }

    public double getWaterprice() {
        return waterprice;
    }

    public void setWaterprice(double waterprice) {
        this.waterprice = waterprice;
    }

    
    
}
