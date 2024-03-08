package Model;

import java.sql.Date;

public class User {

    private String userID;
    private int role;
    private String email;
    private String password;
    private String fullName;
    private String phone;
    private Date dob;
    private String image;
    private int point; 
    private Boolean isActive;

    public User() {
    }

    public User(String userID, int role, String email, String password, String fullName, String phone, Date dob, String image, int point, Boolean isActive) {
        this.userID = userID;
        this.role = role;
        this.email = email;
        this.password = password;
        this.fullName = fullName;
        this.phone = phone;
        this.dob = dob;
        this.image = image;
        this.point = point;
        this.isActive = isActive;
    }

    

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getPoint() {
        return point;
    }

    public void setPoint(int point) {
        this.point = point;
    }
    
    
    public Boolean getIsActive() {
        return isActive;
    }

    public void setIsActive(Boolean isActive) {
        this.isActive = isActive;
    }

    

    

    

}
