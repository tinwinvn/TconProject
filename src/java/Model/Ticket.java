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
    private String TicketCode;

    public Ticket() {
    }

    public Ticket(String TicketID, String TicketTypeID, String TicketCode) {
        this.TicketID = TicketID;
        this.TicketTypeID = TicketTypeID;
        this.TicketCode = TicketCode;
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

    public String getTicketCode() {
        return TicketCode;
    }

    public void setTicketCode(String TicketCode) {
        this.TicketCode = TicketCode;
    }

    
    
    
}
