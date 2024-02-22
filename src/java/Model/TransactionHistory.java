
package Model;

import java.sql.Date;

public class TransactionHistory {
    private int TransactionID;
    private int OrderID;
    private Date Date;
    private String TransactionCode;

    public TransactionHistory() {
    }

    public TransactionHistory(int TransactionID, int OrderID, Date Date, String TransactionCode) {
        this.TransactionID = TransactionID;
        this.OrderID = OrderID;
        this.Date = Date;
        this.TransactionCode = TransactionCode;
    }

    public int getTransactionID() {
        return TransactionID;
    }

    public void setTransactionID(int TransactionID) {
        this.TransactionID = TransactionID;
    }

    public int getOrderID() {
        return OrderID;
    }

    public void setOrderID(int OrderID) {
        this.OrderID = OrderID;
    }

    public Date getDate() {
        return Date;
    }

    public void setDate(Date Date) {
        this.Date = Date;
    }

    public String getTransactionCode() {
        return TransactionCode;
    }

    public void setTransactionCode(String TransactionCode) {
        this.TransactionCode = TransactionCode;
    }
    
    
}
