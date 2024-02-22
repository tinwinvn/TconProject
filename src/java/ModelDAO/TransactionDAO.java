/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModelDAO;

import DAO.ConnectDB;
import Model.Transaction;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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

    public List<Transaction> getAllTransaction() throws Exception {
        List<Transaction> output = new ArrayList<>();
        String query = "SELECT * FROM TransactionHistory";
        Connection conn = null;
        Statement statement = null;
        ResultSet rs = null;

        try {
            conn = db.getConnection();
            statement = conn.createStatement();
            rs = statement.executeQuery(query);

            while (rs.next()) {
                Transaction trc = mapResultSetToTransaction(rs);
                output.add(trc);
            }
        } catch (SQLException ex) {
            throw ex;
        } finally {
            db.close(conn, statement, rs);
        }
        return output;
    }

    public Transaction getTransactionbyOrderID(int id) throws SQLException, UnsupportedEncodingException {
        Transaction trc = new Transaction();
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

    public void addNewTransaction(int orderID, String date, String TransactionCode) throws SQLException {
        String query = "INSERT INTO TransactionHistory (OrderID, Date, TransactionCode) VALUES (?, ?, ?)";
        Connection conn;
        try {

            conn = db.getConnection();
            try (PreparedStatement statement = conn.prepareStatement(query)) {
                statement.setInt(1, orderID);
                statement.setString(2, date);
                statement.setString(3, TransactionCode);
                statement.execute();
            }
            conn.close();
        } catch (SQLException e) {
        }
    }

    private Transaction mapResultSetToTransaction(ResultSet resultSet) throws SQLException {
        Transaction trc = new Transaction();
        trc.setTransactionID(resultSet.getInt("TransactionID"));
        trc.setOrderID(resultSet.getInt("OrderID"));
        trc.setDate(resultSet.getDate("Date"));
        trc.setTransactionCode(resultSet.getString("TransactionCode"));
        return trc;
    }
}
