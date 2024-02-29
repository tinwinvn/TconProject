/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModelDAO;

import DAO.ConnectDB;
import Model.Order;
import Validation.GenerateID;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class OrderDAO {
     private final ConnectDB db;

    public OrderDAO() throws Exception {
        db = new ConnectDB();
    }
    
    public List<Order> getAllOrder() throws Exception {
        List<Order> output = new ArrayList<>();
        String query = "SELECT * FROM Orders";
        Connection conn = null;
        Statement statement = null;
        ResultSet rs = null;

        try {
            conn = db.getConnection();
            statement = conn.createStatement();
            rs = statement.executeQuery(query);

            while (rs.next()) {
                Order o = mapResultSetToOrder(rs);
                output.add(o);
            }
        } catch (SQLException ex) {
            throw ex;
        } finally {
            db.close(conn, statement, rs);
        }
        return output;
    }
    
    public Order getOrderbyUserID(String id) throws SQLException, UnsupportedEncodingException{
        Order o = new Order();
        String query = "SELECT * FROM Orders where UserID = ?";
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;

        try {
            conn = db.getConnection();
            statement = conn.prepareStatement(query);
            statement.setString(1, id);
            rs = statement.executeQuery();
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    return mapResultSetToOrder(resultSet);
                }
            }
        } catch (SQLException ex) {
            throw ex;
        } finally {
            db.close(conn, statement, rs);
        }
        return o;
    }
    
    public Order getOrderbyOrderID(String id) throws SQLException, UnsupportedEncodingException{
        Order o = new Order();
        String query = "SELECT * FROM Orders where OrderID = ?";
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;

        try {
            conn = db.getConnection();
            statement = conn.prepareStatement(query);
            statement.setString(1, id);
            rs = statement.executeQuery();
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    return mapResultSetToOrder(resultSet);
                }
            }
        } catch (SQLException ex) {
            throw ex;
        } finally {
            db.close(conn, statement, rs);
        }
        return o;
    }
    
    
    public void addNewOrder(String orderID, String userID, String voucherID, String orderDate, boolean isConfirm) throws SQLException, Exception {
        String query = "INSERT INTO Orders VALUES (?, ?, ?, ?, ?)";
        Connection conn;
        String fdate = toDate(orderDate);
        try {

            conn = db.getConnection();
            try (PreparedStatement statement = conn.prepareStatement(query)) {
                statement.setString(1, orderID);
                statement.setString(2, userID);
                statement.setString(3, null);
                statement.setString(4, fdate);
                statement.setBoolean(5, isConfirm);
                statement.execute();
            }
            conn.close();
        } catch (SQLException e) {
        }
    }
    
    private Order mapResultSetToOrder(ResultSet resultSet) throws SQLException {
        Order order = new Order();
        order.setOrderID(resultSet.getString("OrderID"));
        order.setUserID(resultSet.getString("UserID"));
        order.setVoucherID(resultSet.getString("VoucherID"));
        order.setOrderDate(resultSet.getString("OrderDate"));
        order.setIsConfirm(resultSet.getBoolean("isConfirm"));
        return order;
    }
    
    public String toDate(String input){
        // Định nghĩa định dạng của ngày tháng
        SimpleDateFormat inputFormat = new SimpleDateFormat("yyyyMMddHHmmss");
        
        try {
            // Chuyển đổi chuỗi thành đối tượng Date
            java.util.Date date =  inputFormat.parse(input);
            
            // Định nghĩa định dạng mới cho ngày tháng
            SimpleDateFormat outputFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
            
            // Định dạng lại thành chuỗi theo định dạng mới
            String formattedDate = outputFormat.format(date);
            System.out.println(formattedDate);
            return formattedDate;
        } catch (ParseException e) {
        }
        return null;
    }
}
