/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.Date;

public class Order {
    private int OrderID; 
    private int UserID;
    private int VoucherID;
    private Date OrderDate;
    private Boolean isConfirm;

    public Order() {
    }

    public Order(int OrderID, int UserID, int VoucherID, Date OrderDate, Boolean isConfirm) {
        this.OrderID = OrderID;
        this.UserID = UserID;
        this.VoucherID = VoucherID;
        this.OrderDate = OrderDate;
        this.isConfirm = isConfirm;
    }

    public int getOrderID() {
        return OrderID;
    }

    public void setOrderID(int OrderID) {
        this.OrderID = OrderID;
    }

    public int getUserID() {
        return UserID;
    }

    public void setUserID(int UserID) {
        this.UserID = UserID;
    }

    public int getVoucherID() {
        return VoucherID;
    }

    public void setVoucherID(int VoucherID) {
        this.VoucherID = VoucherID;
    }

    public Date getOrderDate() {
        return OrderDate;
    }

    public void setOrderDate(Date OrderDate) {
        this.OrderDate = OrderDate;
    }

    public Boolean getIsConfirm() {
        return isConfirm;
    }

    public void setIsConfirm(Boolean isConfirm) {
        this.isConfirm = isConfirm;
    }

    @Override
    public String toString() {
        return "Order{" + "OrderID=" + OrderID + ", UserID=" + UserID + ", VoucherID=" + VoucherID + ", OrderDate=" + OrderDate + ", isConfirm=" + isConfirm + '}';
    }
    
    
}
