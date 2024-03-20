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
import java.io.UnsupportedEncodingException;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
        String query =  "SELECT TicketCode FROM Ticket WHERE OrderID = ?";
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;

        try {
            conn = db.getConnection();
            statement = conn.prepareStatement(query);
            statement.setString(1, orderID);
            rs = statement.executeQuery();
                while (rs.next()) {
                    System.out.println(rs.getString("TicketCode"));
                    tkcodelist.add(rs.getString("TicketCode"));
                }
        } catch (SQLException ex) {
            throw ex;
        } finally {
            db.close(conn, statement, rs);
        }
        return tkcodelist;
    }
    
    public List<String> getTicketTypeIDsByTicketCode(String ticketCode) throws SQLException, UnsupportedEncodingException {
        List<String> ticketTypeIDs = new ArrayList<>();
        String query = "SELECT TicketTypeID FROM Ticket WHERE TicketCode = ?";
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;

        try {
            conn = db.getConnection();
            statement = conn.prepareStatement(query);
            statement.setString(1, ticketCode);
            rs = statement.executeQuery();         
            while (rs.next()) {
                String ticketTypeID = rs.getString("TicketTypeID");
                ticketTypeIDs.add(ticketTypeID);
            }
        } catch (SQLException ex) {
            throw ex;
        } finally {
            db.close(conn, statement, rs);
        }
        return ticketTypeIDs;
    }

    
    public List<String> getTicketIDbyTicketCode(String ticketCode) throws SQLException, UnsupportedEncodingException {
        List<String> ticketIDs = new ArrayList<>();
        String query = "SELECT TicketID FROM Ticket WHERE TicketCode = ?";
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            conn = db.getConnection();
            statement = conn.prepareStatement(query);
            statement.setString(1, ticketCode);
            rs = statement.executeQuery();         
        while (rs.next()) {
            String ticketID = rs.getString("TicketID");
            ticketIDs.add(ticketID);
            System.out.println(ticketIDs);
            }
        } catch (SQLException ex) {
            throw ex;
        } finally {
            db.close(conn, statement, rs);
        }
        return ticketIDs;
    }
    
    public List<String> getOrderIDbyTicketCode(String ticketCode) throws SQLException, UnsupportedEncodingException {
        List<String> orderIDs = new ArrayList<>();
        String query = "SELECT OrderID FROM Ticket WHERE TicketCode = ?";
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            conn = db.getConnection();
            statement = conn.prepareStatement(query);
            statement.setString(1, ticketCode);
            rs = statement.executeQuery();         
        while (rs.next()) {
            String orderID = rs.getString("OrderID");
            orderIDs.add(orderID);
            System.out.println(orderIDs);
            }
        } catch (SQLException ex) {
            throw ex;
        } finally {
            db.close(conn, statement, rs);
        }
        return orderIDs;
    }
    
    public int getTicketStatusByTicketCode(String ticketCode) throws SQLException{
        int ticketStatus = 0;
        String query =  "SELECT TicketStatus\n" +
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
                    ticketStatus = rs.getInt("TicketStatus");
                }
        } catch (SQLException ex) {
            throw ex;
        } finally {
            db.close(conn, statement, rs);
        }
        return ticketStatus;
    }
    
    
    public void updateTicketStatusBYTicketCode(int ticketStatus, String ticketCode){
        String query = "update Ticket set TicketStatus = ? where TicketCode = ?";
        Connection conn;
         try {
            conn = db.getConnection();
            try (PreparedStatement statement = conn.prepareStatement(query)) {
                statement.setInt(1, ticketStatus);
                statement.setString(2, ticketCode);
                statement.execute();
            }
            conn.close();
        } catch (SQLException e) {
        }
    }
    
    public void addNewTicket(String ticketTypeID, String orderID, int ticketStatus, String experationDate) throws SQLException, Exception {
        String query = "INSERT INTO Ticket VALUES (?, ?, ?, ?, ?, ?)";
        Connection conn;
        GenerateID gn = new GenerateID();   
        GenerateQR qr = new GenerateQR();       
        String a = gn.generateID("TK");
        String ticketCode = randomCode(12);
        Timestamp fdate = toeDate(experationDate);
        qr.generateQR(ticketCode);
        try {
            conn = db.getConnection();
                                                
            try (PreparedStatement statement = conn.prepareStatement(query)) {
                statement.setString(1, a);
                statement.setString(2, ticketTypeID);
                statement.setString(3, orderID);         
                statement.setString(4, ticketCode);
                statement.setInt(5, ticketStatus);
                statement.setTimestamp(6, fdate);
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
        tk.setTicketStatus(resultSet.getInt("TicketStatus"));
        tk.setExperationDate(resultSet.getTimestamp("ExperationDate"));
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
    
    public Timestamp toeDate(String input){
        // Định nghĩa định dạng của ngày tháng
        SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd");
        
        try {
            java.util.Date date =  inputFormat.parse(input);
            Timestamp dateSQL = new Timestamp(date.getTime());
            return dateSQL;
        } catch (ParseException e) {
        }
        return null;
    }
}
