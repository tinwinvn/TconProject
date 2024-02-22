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
    private String ParkID;
    private String TicketTypeID;
    private String GameID;
    private String TicketCode;
    private double price;

    public Ticket() {
    }

    public Ticket(String TicketID, String ParkID, String TicketTypeID, String GameID, String TicketCode, double price) {
        this.TicketID = TicketID;
        this.ParkID = ParkID;
        this.TicketTypeID = TicketTypeID;
        this.GameID = GameID;
        this.TicketCode = TicketCode;
        this.price = price;
    }

    public String getTicketID() {
        return TicketID;
    }

    public void setTicketID(String TicketID) {
        this.TicketID = TicketID;
    }

    public String getParkID() {
        return ParkID;
    }

    public void setParkID(String ParkID) {
        this.ParkID = ParkID;
    }

    public String getTicketTypeID() {
        return TicketTypeID;
    }

    public void setTicketTypeID(String TicketTypeID) {
        this.TicketTypeID = TicketTypeID;
    }

    public String getGameID() {
        return GameID;
    }

    public void setGameID(String GameID) {
        this.GameID = GameID;
    }

    public String getTicketCode() {
        return TicketCode;
    }

    public void setTicketCode(String TicketCode) {
        this.TicketCode = TicketCode;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
    
    
}
