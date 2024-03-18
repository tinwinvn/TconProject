/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author admin
 */
public class OrderTicketList {
    private String TypeName; 
    private int price;
    private String ticketCode;
    private boolean isUsed;

    public OrderTicketList() {
    }

    public OrderTicketList(String TypeName, int price, String ticketCode, boolean isUsed) {
        this.TypeName = TypeName;
        this.price = price;
        this.ticketCode = ticketCode;
        this.isUsed = isUsed;
    }


    public String getTypeName() {
        return TypeName;
    }

    public void setTypeName(String TypeName) {
        this.TypeName = TypeName;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getTicketCode() {
        return ticketCode;
    }

    public void setTicketCode(String ticketCode) {
        this.ticketCode = ticketCode;
    }

    public boolean isIsUsed() {
        return isUsed;
    }

    public void setIsUsed(boolean isUsed) {
        this.isUsed = isUsed;
    }
    
    
}
