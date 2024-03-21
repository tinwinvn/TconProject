
package Model;

import java.sql.Date;

public class TransactionHistory {
    private String TransactionID;
    private String OrderID;
    private String Date;
    private String TransactionCode;


    public TransactionHistory() {
    }

    public TransactionHistory(String TransactionID, String OrderID, String Date, String TransactionCode) {
        this.TransactionID = TransactionID;
        this.OrderID = OrderID;
        this.Date = Date;
        this.TransactionCode = TransactionCode;
    }

    public String getTransactionID() {
        return TransactionID;
    }

    public void setTransactionID(String TransactionID) {
        this.TransactionID = TransactionID;
    }

    public String getOrderID() {
        return OrderID;
    }

    public void setOrderID(String OrderID) {
        this.OrderID = OrderID;
    }

    public String getDate() {
        return Date;
    }

    public void setDate(String Date) {
        this.Date = Date;
    }

    public String getTransactionCode() {
        return TransactionCode;
    }

    public void setTransactionCode(String TransactionCode) {
        this.TransactionCode = TransactionCode;
    }


    
}
