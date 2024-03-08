
package Model;

import java.sql.Date;

/**
 *
 * @author Admin
 */
public class Chart {
    private int Quantity;
    private int Price;
    private Date OrderDate;
    private String ParkName;
    
    public Chart() {
    }

    public Chart(int Quantity, int Price, Date OrderDate, String ParkName) {
        this.Quantity = Quantity;
        this.Price = Price;
        this.OrderDate = OrderDate;
        this.ParkName = ParkName;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }

    public int getPrice() {
        return Price;
    }

    public void setPrice(int Price) {
        this.Price = Price;
    }

    public Date getOrderDate() {
        return OrderDate;
    }

    public void setOrderDate(Date OrderDate) {
        this.OrderDate = OrderDate;
    }

    public String getParkName() {
        return ParkName;
    }

    public void setParkName(String ParkName) {
        this.ParkName = ParkName;
    }

    
    
}
