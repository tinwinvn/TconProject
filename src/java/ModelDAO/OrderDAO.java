/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModelDAO;

import DAO.ConnectDB;
import Model.Chart;
import Model.Order;
import Model.OrderTicketList;
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
import java.sql.Statement;
import java.sql.Timestamp;
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
    
    public List<Chart> MixOrderWTicket() throws SQLException, UnsupportedEncodingException{
        List<Chart> ch = new ArrayList<>();
        String query = "SELECT OrderDetail.Quantity, TicketType.Price, Orders.OrderDate, Park.ParkName, Park.ParkID\n" +
                        "FROM Orders\n" +
                        "INNER JOIN OrderDetail ON Orders.OrderID = OrderDetail.OrderID\n" +
                        "INNER JOIN TicketType ON OrderDetail.TicketTypeID = TicketType.TicketTypeID\n" +
                        "INNER JOIN Park ON TicketType.ParkID = Park.ParkID";
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;

        try {
            conn = db.getConnection();
            statement = conn.prepareStatement(query);
            rs = statement.executeQuery();
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    ch.add(mapResultSetToChart(resultSet));
                }
            }
        } catch (SQLException ex) {
            throw ex;
        } finally {
            db.close(conn, statement, rs);
        }
        return ch;
    }
    
    public List<OrderTicketList> getOrderTicketListByOrderID (String orderID) throws SQLException {
        List<OrderTicketList> output = new ArrayList<>();
        String query =  "  SELECT tt.TypeName, tt.Price, t.TicketCode, t.TicketStatus \n" +
                        "  FROM Ticket AS t \n" +
                        "  INNER JOIN OrderDetail AS od ON t.OrderID = od.OrderID \n" +
                        "  INNER JOIN TicketType AS tt ON t.TicketTypeID = tt.TicketTypeID AND od.TicketTypeID = tt.TicketTypeID \n" +
                        "  WHERE t.OrderID = ?";
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;

        try {
            conn = db.getConnection();
            statement = conn.prepareStatement(query);
            statement.setString(1, orderID);
            rs = statement.executeQuery();
            while (rs.next()) {
                OrderTicketList o = new OrderTicketList(rs.getString("TypeName")
                        , rs.getInt("Price")
                        , rs.getString("TicketCode")
                        , rs.getInt("TicketStatus"));
                output.add(o);
            }
        } catch (SQLException ex) {
            throw ex;
        } finally {
            db.close(conn, statement, rs);
        }
        return output;
    }
    
    
    public void addNewOrder(String orderID, String userID, String voucherID, String orderDate, String email) throws SQLException, Exception {
        String query = "INSERT INTO Orders VALUES (?, ?, ?, ?)";
        Connection conn;    
        GenerateQR genQR = new GenerateQR();
        genQR.generateQR(orderID);       
        Timestamp fdate = toDate(orderDate);
        try {
            conn = db.getConnection();
            try (PreparedStatement statement = conn.prepareStatement(query)) {
                statement.setString(1, orderID);
                statement.setString(2, userID);
                statement.setString(3, null);
                statement.setTimestamp(4, fdate);
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
        order.setOrderDate(resultSet.getDate("OrderDate"));
        return order;
    }
    
    private Chart mapResultSetToChart(ResultSet resultSet) throws SQLException {
        Chart chart = new Chart();
        chart.setQuantity(resultSet.getInt("Quantity"));
        chart.setPrice(resultSet.getInt("Price"));
        chart.setOrderDate(resultSet.getDate("OrderDate"));
        chart.setParkName(resultSet.getString("ParkName")); 
        chart.setParkID(resultSet.getString("ParkID"));
        return chart;
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