/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.Date;

public class Order {
    private String OrderID; 
    private String UserID;
    private String VoucherID;
    private Date OrderDate;

    public Order() {
    }

    public Order(String OrderID, String UserID, String VoucherID, Date OrderDate) {
        this.OrderID = OrderID;
        this.UserID = UserID;
        this.VoucherID = VoucherID;
        this.OrderDate = OrderDate;
    }

    
    public String getOrderID() {
        return OrderID;
    }

    public void setOrderID(String OrderID) {
        this.OrderID = OrderID;
    }

    public String getUserID() {
        return UserID;
    }

    public void setUserID(String UserID) {
        this.UserID = UserID;
    }

    public String getVoucherID() {
        return VoucherID;
    }

    public void setVoucherID(String VoucherID) {
        this.VoucherID = VoucherID;
    }

    public Date getOrderDate() {
        return OrderDate;
    }

    public void setOrderDate(Date OrderDate) {
        this.OrderDate = OrderDate;
    }

    

}
