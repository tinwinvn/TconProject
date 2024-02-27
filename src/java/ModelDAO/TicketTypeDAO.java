/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModelDAO;

import DAO.ConnectDB;
import Model.TicketType;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TicketTypeDAO {
    
    private final ConnectDB db;

    public TicketTypeDAO() throws Exception {
        db = new ConnectDB();
    }
            
    public List<TicketType> getAllTicketType(){
        List<TicketType> list = new ArrayList<>();
        String sql = "select * from TicketType";
        Connection conn;
        try {
            conn = db.getConnection();
            System.out.println(conn);
            PreparedStatement st;
            st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                TicketType tkt = mapResultSetToTicketType(rs);
                list.add(tkt);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public TicketType getTicketTypeByID(String TicketTypeID) throws SQLException{
        TicketType tt = new TicketType();
        String query = "SELECT * FROM TicketType where TicketTypeID = ?";
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;

        try {
            conn = db.getConnection();
            statement = conn.prepareStatement(query);
            statement.setString(1, TicketTypeID);
            rs = statement.executeQuery();
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    return mapResultSetToTicketType(resultSet);
                }
            }
        } catch (SQLException ex) {
            throw ex;
        } finally {
            db.close(conn, statement, rs);
        }
        return tt;
    }
     
    
    
     private TicketType mapResultSetToTicketType(ResultSet resultSet) throws SQLException {
        TicketType tkt = new TicketType();
        tkt.setTicketTypeID(resultSet.getString("TicketTypeID"));
        tkt.setParkID(resultSet.getString("ParkID"));
        tkt.setGameID(resultSet.getString("GameID"));
        tkt.setTypeName(resultSet.getString("TypeName"));
        tkt.setDescription(resultSet.getString("Description"));
        tkt.setPrice(resultSet.getInt("Price"));
        return tkt;
    }
}
