/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.Timestamp;
public class Ticket {
   
    private String TicketID;
    private String TicketTypeID;
    private String orderID;
    private String TicketCode;
    private int TicketStatus;
    private Timestamp ExperationDate;
    
    public Ticket() {
    }

    public Ticket(String TicketID, String TicketTypeID, String orderID, String TicketCode, int TicketStatus, Timestamp ExperationDate) {
        this.TicketID = TicketID;
        this.TicketTypeID = TicketTypeID;
        this.orderID = orderID;
        this.TicketCode = TicketCode;
        this.TicketStatus = TicketStatus;
        this.ExperationDate = ExperationDate;
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

    public int getTicketStatus() {
        return TicketStatus;
    }

    public void setTicketStatus(int TicketStatus) {
        this.TicketStatus = TicketStatus;
    }

    public Timestamp getExperationDate() {
        return ExperationDate;
    }

    public void setExperationDate(Timestamp ExperationDate) {
        this.ExperationDate = ExperationDate;
    }

    
}
