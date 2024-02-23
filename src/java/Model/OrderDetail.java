/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

public class OrderDetail {
    private String OrderDetailID;
    private String OrderID;
    private String TicketTypeID;
    private int Quantity;

    public OrderDetail() {
    }

    public OrderDetail(String OrderDetailID, String OrderID, String TicketTypeID, int Quantity) {
        this.OrderDetailID = OrderDetailID;
        this.OrderID = OrderID;
        this.TicketTypeID = TicketTypeID;
        this.Quantity = Quantity;
    }

    public String getOrderDetailID() {
        return OrderDetailID;
    }

    public void setOrderDetailID(String OrderDetailID) {
        this.OrderDetailID = OrderDetailID;
    }

    public String getOrderID() {
        return OrderID;
    }

    public void setOrderID(String OrderID) {
        this.OrderID = OrderID;
    }

    public String getTicketTypeID() {
        return TicketTypeID;
    }

    public void setTicketTypeID(String TicketTypeID) {
        this.TicketTypeID = TicketTypeID;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }
    
    
}
