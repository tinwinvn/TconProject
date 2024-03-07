/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Admin
 */
public class Ticket {
   
    private String TicketID;
    private String TicketTypeID;
    private String orderID;
    private String TicketCode;
    private boolean isUsed;

    public Ticket() {
    }

    public Ticket(String TicketID, String TicketTypeID, String orderID, String TicketCode, boolean isUsed) {
        this.TicketID = TicketID;
        this.TicketTypeID = TicketTypeID;
        this.orderID = orderID;
        this.TicketCode = TicketCode;
        this.isUsed = isUsed;
    }

    public String getTicketID() {
        return TicketID;
    }

    public void setTicketID(String TicketID) {
        this.TicketID = TicketID;
    }

    public String getTicketTypeID() {
        return TicketTypeID;
    }

    public void setTicketTypeID(String TicketTypeID) {
        this.TicketTypeID = TicketTypeID;
    }

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public String getTicketCode() {
        return TicketCode;
    }

    public void setTicketCode(String TicketCode) {
        this.TicketCode = TicketCode;
    }

    public boolean isIsUsed() {
        return isUsed;
    }

    public void setIsUsed(boolean isUsed) {
        this.isUsed = isUsed;
    }   
}
