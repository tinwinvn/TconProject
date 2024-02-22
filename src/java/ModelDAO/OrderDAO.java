/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModelDAO;

import DAO.ConnectDB;
import Model.Order;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Statement;
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
        String query = "SELECT * FROM [Order]";
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
    
    public Order getOrderbyUserID(int id) throws SQLException, UnsupportedEncodingException{
        Order o = new Order();
        String query = "SELECT * FROM [Order] where UserID = ?";
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
            
    private Order mapResultSetToOrder(ResultSet resultSet) throws SQLException {
        Order order = new Order();
        order.setOrderID(resultSet.getInt("OrderID"));
        order.setUserID(resultSet.getInt("UserID"));
        order.setVoucherID(resultSet.getInt("VoucherID"));
        order.setOrderDate(resultSet.getDate("OrderDate"));
        order.setIsConfirm(resultSet.getBoolean("isConfirm"));
        return order;
    }
}
