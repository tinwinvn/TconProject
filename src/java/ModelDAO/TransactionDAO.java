/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModelDAO;

import DAO.ConnectDB;
import Model.TransactionHistory;
import Validation.GenerateID;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class TransactionDAO {

    private final ConnectDB db;

    public TransactionDAO() throws Exception {
        db = new ConnectDB();
    }

    public List<TransactionHistory> getAllTransaction() throws Exception {
        List<TransactionHistory> output = new ArrayList<>();
        String query = "SELECT * FROM TransactionHistory";
        Connection conn = null;
        Statement statement = null;
        ResultSet rs = null;

        try {
            conn = db.getConnection();
            statement = conn.createStatement();
            rs = statement.executeQuery(query);

            while (rs.next()) {
                TransactionHistory trc = mapResultSetToTransaction(rs);
                output.add(trc);
            }
        } catch (SQLException ex) {
            throw ex;
        } finally {
            db.close(conn, statement, rs);
        }
        return output;
    }

    public TransactionHistory getTransactionbyOrderID(int id) throws SQLException, UnsupportedEncodingException {
        TransactionHistory trc = new TransactionHistory();
        String query = "SELECT * FROM TransactionHistory where OrderID = ?";
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;

        try {
            conn = db.getConnection();
            statement = conn.prepareStatement(query);
            statement.setInt(1, id);
            rs = statement.executeQuery();
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    return mapResultSetToTransaction(resultSet);
                }
            }
        } catch (SQLException ex) {
            throw ex;
        } finally {
            db.close(conn, statement, rs);
        }
        return trc;
    }
 
    public String getOrderIDbyTransactionCode(String transactionCode) throws SQLException, UnsupportedEncodingException {
        TransactionHistory trc = new TransactionHistory();
        String query = "SELECT * FROM TransactionHistory where TransactionCode = ?";
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;

        try {
            conn = db.getConnection();
            statement = conn.prepareStatement(query);
            statement.setString(1, transactionCode);
            rs = statement.executeQuery();         
            if (rs.next()) {
                    trc = mapResultSetToTransaction(rs);
                }
        } catch (SQLException ex) {
            throw ex;
        } finally {
            db.close(conn, statement, rs);
        }
        return trc.getOrderID();
    }
    
    public String getTransactionIDbyTransactionCode(String transactionCode) throws SQLException, UnsupportedEncodingException {
        TransactionHistory trc = new TransactionHistory();
        String query = "SELECT * FROM TransactionHistory where TransactionCode = ?";
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;

        try {
            conn = db.getConnection();
            statement = conn.prepareStatement(query);
            statement.setString(1, transactionCode);
            rs = statement.executeQuery();         
            if (rs.next()) {
                    trc = mapResultSetToTransaction(rs);
                }
        } catch (SQLException ex) {
            throw ex;
        } finally {
            db.close(conn, statement, rs);
        }
        return trc.getTransactionID();
    }
    
    
    public int getTransactionStatusbyTransactionCode(String transactionCode) throws SQLException, UnsupportedEncodingException {
        TransactionHistory trc = new TransactionHistory();
        String query = "SELECT * FROM TransactionHistory where TransactionCode = ?";
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;

        try {
            conn = db.getConnection();
            statement = conn.prepareStatement(query);
            statement.setString(1, transactionCode);
            rs = statement.executeQuery();         
            if (rs.next()) {
                    trc = mapResultSetToTransaction(rs);
                }
        } catch (SQLException ex) {
            throw ex;
        } finally {
            db.close(conn, statement, rs);
        }
        return trc.getTransactionStatus();
    }
    
    public void addNewTransaction(String orderID, String date, String TransactionCode, int transactionStatus) throws SQLException, Exception {
        String query = "INSERT INTO TransactionHistory VALUES (?, ?, ?, ?, ?)";
        Connection conn;
        Timestamp fdate = toDate(date);
        System.out.println(orderID);
        System.out.println(date);
        System.out.println(TransactionCode  );
        GenerateID gn = new GenerateID();
        try {

            conn = db.getConnection();
            try (PreparedStatement statement = conn.prepareStatement(query)) {
                statement.setString(1, gn.generateID("TS"));
                statement.setString(2, orderID);
                statement.setTimestamp(3, fdate);              
                statement.setString(4, TransactionCode);
                statement.setInt(5, transactionStatus);
                statement.execute();
            }
            conn.close();
        } catch (SQLException e) {
        }
    }

    public void updateTransactionStatus(String transactionID, int transactionStatus) throws SQLException, Exception {
        String query = "update TransactionHistory set TransactionStatus = ? where TransactionID = ?";
        Connection conn;
        GenerateID gn = new GenerateID();
        try {

            conn = db.getConnection();
            try (PreparedStatement statement = conn.prepareStatement(query)) {
                statement.setInt(1, transactionStatus);
                statement.setString(2, transactionID);
                statement.execute();
            }
            conn.close();
        } catch (SQLException e) {
        }
    }

    
    public Timestamp toDate(String input){
        // Định nghĩa định dạng của ngày tháng
        SimpleDateFormat inputFormat = new SimpleDateFormat("yyyyMMddHHmmss");
        
        try {
            java.util.Date date =  inputFormat.parse(input);
            Timestamp dateSQL = new Timestamp(date.getTime());
            return dateSQL;
        } catch (ParseException e) {
        }
        return null;
    }
    
    private TransactionHistory mapResultSetToTransaction(ResultSet resultSet) throws SQLException {
        TransactionHistory trc = new TransactionHistory();
        trc.setTransactionID(resultSet.getString("TransactionID"));
        trc.setOrderID(resultSet.getString("OrderID"));
        trc.setDate(resultSet.getDate("Date"));
        trc.setTransactionCode(resultSet.getString("TransactionCode"));
        trc.setTransactionStatus(resultSet.getInt("TransactionStatus"));
        return trc;
    }
}