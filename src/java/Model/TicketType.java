/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Admin
 */
public class TicketType {
    private String TicketTypeID;
    private String ParkID;
    private String GameID;
    private String TypeName;
    private String Description;
    private int Price;
    
    public TicketType() {
    }

    public TicketType(String TicketTypeID, String ParkID, String GameID, String TypeName, String Description, int Price) {
        this.TicketTypeID = TicketTypeID;
        this.ParkID = ParkID;
        this.GameID = GameID;
        this.TypeName = TypeName;
        this.Description = Description;
        this.Price = Price;
    }

    public String getTicketTypeID() {
        return TicketTypeID;
    }

    public void setTicketTypeID(String TicketTypeID) {
        this.TicketTypeID = TicketTypeID;
    }

    public String getParkID() {
        return ParkID;
    }

    public void setParkID(String ParkID) {
        this.ParkID = ParkID;
    }

    public String getGameID() {
        return GameID;
    }

    public void setGameID(String GameID) {
        this.GameID = GameID;
    }

    public String getTypeName() {
        return TypeName;
    }

    public void setTypeName(String TypeName) {
        this.TypeName = TypeName;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public int getPrice() {
        return Price;
    }

    public void setPrice(int Price) {
        this.Price = Price;
    }

    

    
}
