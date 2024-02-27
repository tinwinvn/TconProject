/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Nguyen Nhu Loc
 */
public class ParkDetail {
    private String ParkDetailID;
    private String ParkID;
    private String image1;
    private String image2;
    private String image3;
    private String image_bg;
    private String OpenrationTime;

    public ParkDetail() {
    }

    public ParkDetail(String ParkDetailID, String ParkID, String image1, String image2, String image3, String image_bg, String OpenrationTime) {
        this.ParkDetailID = ParkDetailID;
        this.ParkID = ParkID;
        this.image1 = image1;
        this.image2 = image2;
        this.image3 = image3;
        this.image_bg = image_bg;
        this.OpenrationTime = OpenrationTime;
    }

    public String getParkDetailID() {
        return ParkDetailID;
    }

    public void setParkDetailID(String ParkDetailID) {
        this.ParkDetailID = ParkDetailID;
    }

    public String getParkID() {
        return ParkID;
    }

    public void setParkID(String ParkID) {
        this.ParkID = ParkID;
    }

    public String getImage1() {
        return image1;
    }

    public void setImage1(String image1) {
        this.image1 = image1;
    }

    public String getImage2() {
        return image2;
    }

    public void setImage2(String image2) {
        this.image2 = image2;
    }

    public String getImage3() {
        return image3;
    }

    public void setImage3(String image3) {
        this.image3 = image3;
    }

    public String getImage_bg() {
        return image_bg;
    }

    public void setImage_bg(String image_bg) {
        this.image_bg = image_bg;
    }

    public String getOpenrationTime() {
        return OpenrationTime;
    }

    public void setOpenrationTime(String OpenrationTime) {
        this.OpenrationTime = OpenrationTime;
    }



    
 
    
    
}
