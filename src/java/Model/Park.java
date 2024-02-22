/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Nguyen Nhu Loc
 */
public class Park {

    private String ParkID;
    private String UserID;
    private String ParkName;
    private String Address;
    private String Image;

    public Park() {
    }

    public Park(String ParkID, String UserID, String ParkName, String Address, String Image) {
        this.ParkID = ParkID;
        this.UserID = UserID;
        this.ParkName = ParkName;
        this.Address = Address;
        this.Image = Image;
    }

    public String getParkID() {
        return ParkID;
    }

    public void setParkID(String ParkID) {
        this.ParkID = ParkID;
    }

    public String getUserID() {
        return UserID;
    }

    public void setUserID(String UserID) {
        this.UserID = UserID;
    }

    public String getParkName() {
        return ParkName;
    }

    public void setParkName(String ParkName) {
        this.ParkName = ParkName;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public String getImage() {
        return Image;
    }

    public void setImage(String Image) {
        this.Image = Image;
    }
    
    
    

}
