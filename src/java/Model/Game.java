/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Nguyen Nhu Loc
 */
public class Game {
    private String GameID;
    private String ParkID;
    private String GameName;
    private String GameDescription;
    private String Image;

    public Game() {
    }

    public Game(String GameID, String ParkID, String GameName, String GameDescription, String Image) {
        this.GameID = GameID;
        this.ParkID = ParkID;
        this.GameName = GameName;
        this.GameDescription = GameDescription;
        this.Image = Image;
    }

    public String getGameID() {
        return GameID;
    }

    public void setGameID(String GameID) {
        this.GameID = GameID;
    }

    public String getParkID() {
        return ParkID;
    }

    public void setParkID(String ParkID) {
        this.ParkID = ParkID;
    }

    public String getGameName() {
        return GameName;
    }

    public void setGameName(String GameName) {
        this.GameName = GameName;
    }

    public String getGameDescription() {
        return GameDescription;
    }

    public void setGameDescription(String GameDescription) {
        this.GameDescription = GameDescription;
    }

    public String getImage() {
        return Image;
    }

    public void setImage(String Image) {
        this.Image = Image;
    }
    
    
}
