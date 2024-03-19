package Model;

public class Rating {
    private String ratingID;
    private String sendID;
    private String receiveID;
    private String ratingText;
    private int ratingValue;

    public Rating(String ratingID, String sendID, String receiveID, String ratingText, int ratingValue) {
        this.ratingID = ratingID;
        this.sendID = sendID;
        this.receiveID = receiveID;
        this.ratingText = ratingText;
        this.ratingValue = ratingValue;
    }

    public String getRatingID() {
        return ratingID;
    }

    public void setRatingID(String ratingID) {
        this.ratingID = ratingID;
    }

    public String getSendID() {
        return sendID;
    }

    public void setSendID(String sendID) {
        this.sendID = sendID;
    }

    public String getReceiveID() {
        return receiveID;
    }

    public void setReceiveID(String receiveID) {
        this.receiveID = receiveID;
    }

    public String getRatingText() {
        return ratingText;
    }

    public void setRatingText(String ratingText) {
        this.ratingText = ratingText;
    }

    public int getRatingValue() {
        return ratingValue;
    }

    public void setRatingValue(int ratingValue) {
        this.ratingValue = ratingValue;
    }

    
    
}