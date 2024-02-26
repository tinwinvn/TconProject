/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

public class AddFavourite {

    private String FavouriteID;
    private String UserID;
    private String FavouriteItems;

    public AddFavourite() {
    }

    public AddFavourite(String FavouriteID, String UserID, String FavouriteItems) {
        this.FavouriteID = FavouriteID;
        this.UserID = UserID;
        this.FavouriteItems = FavouriteItems;
    }

    public String getFavouriteID() {
        return FavouriteID;
    }

    public void setFavouriteID(String FavouriteID) {
        this.FavouriteID = FavouriteID;
    }

    public String getUserID() {
        return UserID;
    }

    public void setUserID(String UserID) {
        this.UserID = UserID;
    }

    public String getFavouriteItems() {
        return FavouriteItems;
    }

    public void setFavouriteItems(String FavouriteItems) {
        this.FavouriteItems = FavouriteItems;
    }

    

}
