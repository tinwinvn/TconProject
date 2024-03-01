/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModelDAO;

import DAO.ConnectDB;
import Model.Notification;
import Validation.GenerateID;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class NotificationDAO {
    
    private final ConnectDB db;
     
    public NotificationDAO() throws Exception {
        db = new ConnectDB();
    }
    
    public List<Notification> getAllNotification(){
        List<Notification> list = new ArrayList<>();
        String sql = "select * from Notification";
        Connection conn;
        try {
            conn = db.getConnection();
            System.out.println(conn);
            PreparedStatement st;
            st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Notification nt = mapResultSetToNotification(rs);
                list.add(nt);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
     
      public void addNewNotification(String senderID, String receiverID, String title, String content, Date date) throws SQLException, Exception {
        String query = "INSERT INTO Notification VALUES (?, ?, ?, ?, ?, ?, ?)";
        Connection conn;
        GenerateID gn = new GenerateID();
        try {

            conn = db.getConnection();
            try (PreparedStatement statement = conn.prepareStatement(query)) {
                statement.setString(1, gn.generateID("NT"));
                statement.setString(2, senderID);
                statement.setString(3, receiverID);
                statement.setString(4, title);
                statement.setString(5, content);
                statement.setDate(6, date);
                statement.setBoolean(7, false);
                statement.execute();
            }
            conn.close();
        } catch (SQLException e) {
        }
    }
     
     private Notification mapResultSetToNotification(ResultSet resultSet) throws SQLException {
        Notification nt = new Notification();
        nt.setNotificationID(resultSet.getString("NotificationID"));
        nt.setSenderID(resultSet.getString("SenderID"));
        nt.setReceiverID(resultSet.getString("ReceiverID"));
        nt.setTitle(resultSet.getString("Title"));
        nt.setContent(resultSet.getString("Content"));
        nt.setNotificationDate(resultSet.getDate("NotificationDate"));
        nt.setIsConfirm(resultSet.getBoolean("isConfirm"));
        return nt;
    }
}
