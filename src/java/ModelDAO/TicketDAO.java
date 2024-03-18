/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModelDAO;

import DAO.ConnectDB;
import Model.Ticket;
import Validation.GenerateID;
import Validation.GenerateQR;
import java.io.File;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

/**
 *
 * @author admin
 */
public class TicketDAO {
   private final ConnectDB db;

    public TicketDAO() throws Exception {
        db = new ConnectDB();
    }
            
    public List<Ticket> getAllTicket(){
        List<Ticket> list = new ArrayList<>();
        String sql = "select * from Ticket";
        Connection conn;
        try {
            conn = db.getConnection();
            System.out.println(conn);
            PreparedStatement st;
            st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Ticket tk = mapResultSetToTicket(rs);
                list.add(tk);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public List<String> getAllTicketCodeByORderID(String orderID) throws SQLException{
        List<String> tkcodelist = new ArrayList<>();
        String query =  "SELECT TicketCode\n" +
                        "FROM Ticket\n" +
                        "WHERE OrderID = ?;";
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;

        try {
            conn = db.getConnection();
            statement = conn.prepareStatement(query);
            statement.setString(1, orderID);
            rs = statement.executeQuery();
                while (rs.next()) {
                    tkcodelist.add(rs.getString("TicketCode"));
                }
        } catch (SQLException ex) {
            throw ex;
        } finally {
            db.close(conn, statement, rs);
        }
        return tkcodelist;
    }
    
    public boolean getTicketStatusByTicketCode(String ticketCode) throws SQLException{
        boolean isUsed = false;
        String query =  "SELECT isUsed\n" +
                        "FROM Ticket\n" +
                        "WHERE TicketCode = ?;";
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;

        try {
            conn = db.getConnection();
            statement = conn.prepareStatement(query);
            statement.setString(1, ticketCode);
            rs = statement.executeQuery();
                while (rs.next()) {
                    isUsed = rs.getBoolean("isUsed");
                }
        } catch (SQLException ex) {
            throw ex;
        } finally {
            db.close(conn, statement, rs);
        }
        return isUsed;
    }
    
    
    public void updateTicketStatusBYTicketCode(String ticketCode){
        String query = "update Ticket set isUsed = ? where TicketCode = ?";
        Connection conn;
         try {
            conn = db.getConnection();
            try (PreparedStatement statement = conn.prepareStatement(query)) {
                statement.setBoolean(1, true);
                statement.setString(2, ticketCode);
                statement.execute();
            }
            conn.close();
        } catch (SQLException e) {
        }
    }
    
    public void addNewTicket(String ticketTypeID, String orderID) throws SQLException, Exception {
        String query = "INSERT INTO Ticket VALUES (?, ?, ?, ?, ?)";
        Connection conn;
        GenerateID gn = new GenerateID();   
        GenerateQR qr = new GenerateQR();       
        String a =gn.generateID("TK");
        String ticketCode = randomCode(12);
        qr.generateQR(ticketCode);
        try {
            conn = db.getConnection();
                                                
            try (PreparedStatement statement = conn.prepareStatement(query)) {
                statement.setString(1, a);
                statement.setString(2, ticketTypeID);
                statement.setString(3, orderID);         
                statement.setString(4, ticketCode);
                statement.setBoolean(5, false);
                statement.execute();
            }
            conn.close();
        } catch (SQLException e) {
        }
    }
       
    private Ticket mapResultSetToTicket(ResultSet resultSet) throws SQLException {
        Ticket tk = new Ticket();
        tk.setTicketID(resultSet.getString("TicketID"));
        tk.setTicketTypeID(resultSet.getString("TicketTypeID"));
        tk.setOrderID(resultSet.getString("OrderID"));
        tk.setTicketCode(resultSet.getString("TicketCode"));
        tk.setIsUsed(resultSet.getBoolean("isUsed"));
        return tk;
    }
    
    public String randomCode(int len){
        Random rnd = new Random();
        String chars = "0123456789";
        StringBuilder sb = new StringBuilder(len);
        for (int i = 0; i < len; i++) {
            sb.append(chars.charAt(rnd.nextInt(chars.length())));
        }
        return sb.toString();
    } 
}
