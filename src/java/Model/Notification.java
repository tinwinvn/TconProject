/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.Date;

/**
 *
 * @author Admin
 */
public class Notification {

    private String NotificationID;
    private String SenderID;
    private String ReceiverID;
    private String Title;
    private String Content;
    private Date NotificationDate;

    public Notification() {
    }

    public Notification(String NotificationID, String SenderID, String ReceiverID, String Title, String Content, Date NotificationDate) {
        this.NotificationID = NotificationID;
        this.SenderID = SenderID;
        this.ReceiverID = ReceiverID;
        this.Title = Title;
        this.Content = Content;
        this.NotificationDate = NotificationDate;
    }

    public String getNotificationID() {
        return NotificationID;
    }

    public void setNotificationID(String NotificationID) {
        this.NotificationID = NotificationID;
    }

    public String getSenderID() {
        return SenderID;
    }

    public void setSenderID(String SenderID) {
        this.SenderID = SenderID;
    }

    public String getReceiverID() {
        return ReceiverID;
    }

    public void setReceiverID(String ReceiverID) {
        this.ReceiverID = ReceiverID;
    }

    public String getTitle() {
        return Title;
    }

    public void setTitle(String Title) {
        this.Title = Title;
    }

    public String getContent() {
        return Content;
    }

    public void setContent(String Content) {
        this.Content = Content;
    }

    public Date getNotificationDate() {
        return NotificationDate;
    }

    public void setNotificationDate(Date NotificationDate) {
        this.NotificationDate = NotificationDate;
    }
    
    
}
