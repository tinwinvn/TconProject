/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModelDAO;

import DAO.ConnectDB;
import Model.OrderDetail;
import Validation.GenerateID;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class OrderDetailDAO {
     private final ConnectDB db;
     
     public OrderDetailDAO() throws Exception {
        db = new ConnectDB();
    }
      public List<OrderDetail> getAllOrderDetail(){
        List<OrderDetail> list = new ArrayList<>();
        String sql = "select * from OrderDetail";
        Connection conn;
        try {
            conn = db.getConnection();
            System.out.println(conn);
            PreparedStatement st;
            st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                OrderDetail odd = mapResultSetToOrderDetail(rs);
                list.add(odd);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
      public void addNewOrderDetail(String orderID, String tickettypeID, int quantity) throws SQLException, Exception {
        String query = "INSERT INTO OrderDetail VALUES (?, ?, ?, ?)";
        Connection conn;
        GenerateID gn = new GenerateID();
        try {

            conn = db.getConnection();
            try (PreparedStatement statement = conn.prepareStatement(query)) {
                statement.setString(1, gn.generateID("OD"));
                statement.setString(2, orderID);
                statement.setString(3, tickettypeID);
                statement.setInt(4, quantity);
                statement.execute();
            }
            conn.close();
        } catch (SQLException e) {
        }
    }
    
     private OrderDetail mapResultSetToOrderDetail(ResultSet resultSet) throws SQLException {
        OrderDetail odd = new OrderDetail();
        odd.setOrderDetailID(resultSet.getString("OrderDetailID"));
        odd.setOrderID(resultSet.getString("OrderID"));
        odd.setTicketTypeID(resultSet.getString("TicketTypeID"));
        odd.setQuantity(resultSet.getInt("Quantity"));
        return odd;
    }
}
